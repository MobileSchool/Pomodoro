//
//  AppDelegate.m
//  pomodoro2
//
//  Created by Mobile School - Julian on 30/07/14.
//  Modified: Leonardo Minora on 28/08/2014
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

@implementation AppDelegate {

NSString *workBG;
NSString *restBG;
NSString *timeEmoji;
NSString *strTime;
int pomodoroCounter;

Pomodoro *pomodoro;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    workBG = @"workBG.png";
    restBG = @"restBG.png";
    pomodoroCounter = 0;
   
    statusItem = [[NSStatusBar systemStatusBar]statusItemWithLength:NSVariableStatusItemLength]; //Inicializando barra e colocando tamanho variavel.
    statusItem.menu = self.menu; // atribuindo preferencias e quit a barra de menu
    self.rodada = [[Rodada alloc]init]; //Alocando e inicializando rodada
    pomodoro = [self.rodada.pomodoros objectAtIndex:0]; //Coloca o primeiro pomodoro na variavel pomodoro
    [pomodoro start]; //Coloca tempo e muda estado do pomodoro
    [self updateView]; //atualiza a view
    timeEmoji = @"🍅";
    statusItem.title = timeEmoji; // Simbolo na barra de menu
    _window.backgroundColor = [NSColor colorWithPatternImage:[NSImage imageNamed:workBG]];
    
}

- (IBAction)push_start:(id)sender { //quando o botão start é apertado
    [self updateButtonState:NO];  //desativa botão start e ativa botão stop
    pomodoro = [self.rodada next]; //Troca de pomodoro
    [pomodoro start]; //Coloca tempo em pomodoro e muda o estado
    [self execute];  //ativa o método execute abaixo
}

- (void) updateButtonState:(BOOL) state { //Em caso de boleano "NO",desativa botão start e ativa botão stop(efeito oposto se for "YES")
    [_startButton setEnabled:state];
    [_stopButton setEnabled:!state];
    [_startMenu setHidden:!state];
    [_stopMenu setHidden:state];
    
}

- (void) execute {
    [pomodoro pulse]; //Decrementa o tempo do pomodoro
    [self updateView]; //Atualiza a view
    switch ([pomodoro state]) {  //Checagem de estado do pomodoro
        case ON_PULSE_WORKTIME:  //Caso esteja em tempo de trabalho ou descanso usa o método perform
        case ON_PULSE_BREAKTIME:
            [self performSelector:@selector(execute) withObject:nil afterDelay:1.0]; //Ativa método "execute:" com argumento pomodoro, 1 segundo depois de ser ativado
            break;
        case STOPPED:                      //Pomodoro parado
            [self swapImageWork];
            [self updateButtonState:YES]; //Troca de estado dos botões "start" e "stop"
            //Mostra a janela do pomodoro em pop-up
            
            [self popUp];
            
            break;
        case CHANGE_WORKTIME_BREAKTIME: //Periodo entre workTime e breakTime
            [self swapImageBreak];
            [Alarme tocar]; //Manda tocar o alarme
            //Mostra a janela do pomodoro em pop-up
            
            [self popUp];
            
            [self performSelector:@selector(execute) withObject:nil afterDelay:1.0];//Ativa método "execute:" com argumento pomodoro, 1 segundo depois de ser ativado

            break;
        case END:                          //Pomodoro finalizado
            [self changeLabelCounter];
            [self swapImageWork];
            [self updateButtonState:YES]; //Troca de estado dos botões "start" e "stop"
            [Alarme tocar];              //Manda tocar o alarme
            //Mostra a janela do pomodoro em pop-up
            
            [self popUp];
            
            break;
        default:
            
            break;
    }
}

- (void) updateView { //atualiza a view do pomodoro e da barra de menu
    strTime = [pomodoro timeWithStringFormat];
    
    if (self.clockMenuItem.state == 1) {
       timeEmoji = [NSString stringWithFormat:@"%@%@",strTime, @"🍅"];
    }
    statusItem.title = timeEmoji;
    [_textTimer setStringValue:strTime];
}

- (IBAction)SelectConfig:(id)sender { //abre o view de preferencias
    
    if(!_startButton.isEnabled){
        [self alertaPreferencias];
        
    }else {
     _Janela =  [[JanelaConfigWindowController alloc] initWithWindowNibName:@"JanelaConfigWindowController"];
     [_Janela showWindow:self];
    }
}

- (IBAction)push_stop:(id)sender { //Força o pomodoro a parar
    [pomodoro forceStop];
    [pomodoro callEraseElasep];
    [self updateView];
}

- (IBAction)openPomodoroWindow:(id)sender {
    //Traz a janela para frente
    [self popUp];
    
}

- (IBAction)changeStateClockMenuItem:(id)sender {
    
    if ( self.clockMenuItem.state  ==  0) {
        [self.clockMenuItem setState:1];
        [self updateMenuString];
    }
    else {
        [self.clockMenuItem setState:0];
        [self updateMenuString];
              }
    
    
    
}

-(void) popUp {
  
    [self.window close];
    [self.window orderFrontRegardless];
   
    
}


- (void) swapImageWork { //troca para imagem de fundo de trabalho
   _window.backgroundColor = [NSColor colorWithPatternImage:[NSImage imageNamed:workBG]];
}

- (void) swapImageBreak{ //troca para imagem de descanso
    _window.backgroundColor = [NSColor colorWithPatternImage:[NSImage imageNamed:restBG]];
}


- (void) alertaPreferencias {
    NSAlert *alertaPreferencias = [[NSAlert alloc]init];
    [alertaPreferencias addButtonWithTitle:@"OK"];
    [alertaPreferencias setMessageText:@"Atenção!"];
    [alertaPreferencias setInformativeText:@"Você só pode alterar as configurações se o pomodoro estiver parado."];
    [alertaPreferencias setAlertStyle:NSInformationalAlertStyle];
    [alertaPreferencias beginSheetModalForWindow:[self window] modalDelegate:self didEndSelector:@selector(alertDidEnd:NSAlertFirstButtonReturn:contextInfo:) contextInfo:nil];
}

- (void)alertDidEnd:(NSAlert *)alertaPreferencias NSAlertFirstButtonReturn:(NSInteger)NSAlertFirstButtonReturn contextInfo:(void *)contextInfo
{
   
}

- (void)changeLabelCounter {
    NSString *emoji = @"🍅";
    pomodoroCounter++;
    NSString *qtPomodoro = [NSString stringWithFormat:@"%i",pomodoroCounter];
    NSString *newQtPomodoro = [NSString stringWithFormat: @"%@%@",qtPomodoro,emoji];
   
    [self.labelCounter setStringValue:newQtPomodoro];
    
}

- (void)updateMenuString{
    if ([timeEmoji  isEqual: @"🍅"]) {
        timeEmoji = [NSString stringWithFormat:@"%@%@",strTime, timeEmoji];
    }else{
        timeEmoji = @"🍅";
    };
        
}

@end
