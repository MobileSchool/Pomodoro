//
//  AppDelegate.m
//  pomodoro2
//
//  Created by Mobile School - Julian on 30/07/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//
// Comentario teste
#import "AppDelegate.h"
#import "Alarme.h"
#import "Config.h"
#import "Pomodoro.h"

@interface AppDelegate(){
    NSStatusItem * statusItem;
}

@end

@implementation AppDelegate

int contadorPomodoros = 0;
int trocaTrabalhoDescanso = 1;
NSString * workBgImage = @"workBG.png";
NSString * restBgImage = @"restBG.png";

Pomodoro *pomodoro;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [Config restoreCustom];
    statusItem = [[NSStatusBar systemStatusBar]statusItemWithLength:NSVariableStatusItemLength];
    statusItem.title = @"🍅";
    statusItem.menu = self.menu;
    
    
    self.rodada = [[Rodada alloc]init]; //Iniciando objeto de classe Rodada
//    minute = [[self.rodada.pomodoros[0] trabalho] intValue]; // colocando valor de trabalho do primeiro pomodoro da rodada
//    if (minute<10) {
//        [_textTimer setStringValue:[NSString stringWithFormat:@"0%i : 00",minute]];
//    }else{
//        [_textTimer setStringValue:[NSString stringWithFormat:@"%i : 00",minute]]; // colocando minuto na view
//    }
    
   _window.backgroundColor = [NSColor colorWithPatternImage:[NSImage imageNamed:workBgImage]];
    
}

- (IBAction)push_start:(id)sender { //quando o
    [self updateButtonState:NO];

    pomodoro = [self.rodada next];
    [pomodoro start];
    [self execute: pomodoro];
}

- (void) updateButtonState:(BOOL) state {
    [_startButton setEnabled:state];
    [_stopButton setEnabled:!state];
}

- (void) execute: (Pomodoro *) pomodoro {
    [pomodoro pulse];
    [self updateView: pomodoro];
    switch ([pomodoro state]) {
        case ON_PULSE_WORKTIME:
        case ON_PULSE_BREAKTIME:
            [self performSelector:@selector(execute:) withObject:pomodoro afterDelay:1.0];
            
            break;
        case STOPPED:
            [self updateButtonState:YES];
            break;
        case CHANGE_WORKTIME_BREAKTIME:
            [Alarme tocar];
            [self performSelector:@selector(execute:) withObject:pomodoro afterDelay:1.0];
            
            break;
        case END:
            [self updateButtonState:YES];
            [Alarme tocar];
            
            break;
        default:
            
            break;
    }
}

- (NSString*)formtatFromPomodoroToStringWithMinute: (Pomodoro*)p {
    NSString *strMinute = [self formatFromTimeToString:[p minute]];
    NSString *strSecond = [self formatFromTimeToString:[p second]];
    statusItem.title = [NSString stringWithFormat:@"%@ : %@",strMinute,strSecond];
    return [NSString stringWithFormat:@"%@ : %@",strMinute,strSecond];
}

- (NSString*) formatFromTimeToString: (int) time {
    NSString * temp;
    if(time < 10){
        temp = [NSString stringWithFormat:@"0%i",time];
    }else{
        temp = [NSString stringWithFormat:@"%i",time];
        
    }
    return temp;
}

- (void) updateView: (Pomodoro *) pomodoro {
    NSString *strTime = [self formtatFromPomodoroToStringWithMinute: pomodoro];

    [_textTimer setStringValue:strTime];
    [self swapImage];
    
    
    
}

- (IBAction)SelectConfig:(id)sender {
    if (!_Janela){
        _Janela =  [[JanelaConfigWindowController alloc] initWithWindowNibName:@"JanelaConfigWindowController"];
    }
    [_Janela showWindow:self];
    
}

- (IBAction)push_stop:(id)sender {
    [pomodoro forceStop];
}

- (void) swapImage {
    if (pomodoro.state == ON_PULSE_BREAKTIME)
        _window.backgroundColor = [NSColor colorWithPatternImage:[NSImage imageNamed:restBgImage]];
    else _window.backgroundColor = [NSColor colorWithPatternImage:[NSImage imageNamed:workBgImage]];
    
}
@end
