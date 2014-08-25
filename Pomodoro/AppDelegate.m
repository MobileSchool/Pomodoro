//
//  AppDelegate.m
//  pomodoro2
//
//  Created by Mobile School - Julian on 30/07/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "Alarme.h"
#import "Config.h"
#import "Pomodoro.h"

@interface AppDelegate(){
    NSStatusItem * statusItem; //Item da barra de menu
}

@end

@implementation AppDelegate

//int contadorPomodoros = 0;
//int trocaTrabalhoDescanso = 1;
NSString *workBG = @"workBG.png";
NSString *restBG = @"restBG.png";


Pomodoro *pomodoro;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
   
    statusItem = [[NSStatusBar systemStatusBar]statusItemWithLength:NSVariableStatusItemLength]; //Inicializando barra e colocando tamanho variavel.
    statusItem.menu = self.menu; // atribuindo preferencias e quit a barra de menu
    self.rodada = [[Rodada alloc]init]; //Alocando e inicializando rodada
    pomodoro = [[self.rodada pomodoros] objectAtIndex:0]; //Coloca o primeiro pomodoro na variavel pomodoro
    [pomodoro start]; //Coloca tempo e muda estado do pomodoro
    [self updateView:pomodoro]; //atualiza a view
    statusItem.title = @"🍅"; // Simbolo na barra de menu
    _window.backgroundColor = [NSColor colorWithPatternImage:[NSImage imageNamed:workBG]];
}

- (IBAction)push_start:(id)sender { //quando o botão start é apertado
    [self updateButtonState:NO];  //desativa botão start e ativa botão stop
    pomodoro = [self.rodada next]; //Troca de pomodoro
    [pomodoro start]; //Coloca tempo em pomodoro e muda o estado
    [self execute: pomodoro];  //ativa o método execute abaixo
}

- (void) updateButtonState:(BOOL) state { //Em caso de boleano "NO",desativa botão start e ativa botão stop(efeito oposto se for "YES")
    [_startButton setEnabled:state];
    [_stopButton setEnabled:!state];
}

- (void) execute: (Pomodoro *) pomodoro {
    [pomodoro pulse]; //Decrementa o tempo do pomodoro
    [self updateView: pomodoro]; //Atualiza a view
    switch ([pomodoro state]) {  //Checagem de estado do pomodoro
        case ON_PULSE_WORKTIME:  //Caso esteja em tempo de trabalho ou descanso usa o método perform
        case ON_PULSE_BREAKTIME:
            [self performSelector:@selector(execute:) withObject:pomodoro afterDelay:1.0]; //Ativa método "execute:" com argumento pomodoro, 1 segundo depois de ser ativado
            break;
        case STOPPED:                      //Pomodoro parado
            [self swapImageWork];
            [self updateButtonState:YES]; //Troca de estado dos botões "start" e "stop"
            //Mostra a janela do pomodoro em pop-up
            if(! [self.window isVisible] )
                [self.window makeKeyAndOrderFront:nil];
            [self.window setLevel:NSPopUpMenuWindowLevel];
            break;
        case CHANGE_WORKTIME_BREAKTIME: //Periodo entre workTime e breakTime
            [self swapImageBreak];
            [Alarme tocar]; //Manda tocar o alarme
            //Mostra a janela do pomodoro em pop-up
            if(! [self.window isVisible] )
                [self.window makeKeyAndOrderFront:nil];
            [self.window setLevel:NSPopUpMenuWindowLevel];
            
            [self performSelector:@selector(execute:) withObject:pomodoro afterDelay:1.0];//Ativa método "execute:" com argumento pomodoro, 1 segundo depois de ser ativado

            break;
        case END:                          //Pomodoro finalizado
            [self swapImageWork];
            [self updateButtonState:YES]; //Troca de estado dos botões "start" e "stop"
            [Alarme tocar];              //Manda tocar o alarme
            //Mostra a janela do pomodoro em pop-up
            if(! [self.window isVisible] )
                [self.window makeKeyAndOrderFront:nil];
            [self.window setLevel:NSPopUpMenuWindowLevel];
            break;
        default:
            
            break;
    }
}

- (NSString*)formtatFromPomodoroToStringWithMinute: (Pomodoro*)p { //Transforma o segundo e minuto de um pomodoro em string e a retorna
    NSString *strMinute = [self formatFromTimeToString:[p minute]];
    NSString *strSecond = [self formatFromTimeToString:[p second]];
    
    return [NSString stringWithFormat:@"%@ : %@",strMinute,strSecond];
}

- (NSString*) formatFromTimeToString: (int) time { //Checa se o tempo é menor que 10, se for, bota 0 na frente do número, e o retorna como string
    NSString * temp;
    if(time < 10){
        temp = [NSString stringWithFormat:@"0%i",time];
    }else{
        temp = [NSString stringWithFormat:@"%i",time];
        
    }
    return temp;
}

- (void) updateView: (Pomodoro *) pomodoro { //atualiza a view do pomodoro e da barra de menu
    NSString *strTime = [self formtatFromPomodoroToStringWithMinute: pomodoro];
    statusItem.title = strTime;
    [_textTimer setStringValue:strTime];
    
    
    
    
}

- (IBAction)SelectConfig:(id)sender { //abre o view de preferencias
    if (!_Janela){
        _Janela =  [[JanelaConfigWindowController alloc] initWithWindowNibName:@"JanelaConfigWindowController"];
    }
    
    [_Janela showWindow:self];
    
}

- (IBAction)push_stop:(id)sender { //Força o pomodoro a parar
    [pomodoro forceStop];
}

- (IBAction)openPomodoroWindow:(id)sender {
    if(! [self.window isVisible] )
        [self.window makeKeyAndOrderFront:sender];
        [self.window setLevel:NSPopUpMenuWindowLevel];
    
}

- (void) swapImageWork {
   _window.backgroundColor = [NSColor colorWithPatternImage:[NSImage imageNamed:workBG]];
}

- (void) swapImageBreak{
    _window.backgroundColor = [NSColor colorWithPatternImage:[NSImage imageNamed:restBG]];
}
@end
