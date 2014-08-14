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


int contadorPomodoros = 0;
int trocaTrabalhoDescanso = 1;
int second = 0;
int minute;
bool started=FALSE;


@implementation AppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.rodada = [[Rodada alloc]init]; //Iniciando objeto de classe Rodada
    minute = [[self.rodada.pomodoros[0] trabalho] intValue]; // colocando valor de trabalho do primeiro pomodoro da rodada
    [_textTimer setStringValue:[NSString stringWithFormat:@"%0i : 00",minute]]; // colocando minuto na view
}

- (IBAction)push_start:(id)sender { //quando o botao start eh apertado...
    if (!started) { //se started eh falso..
        started=TRUE; //define strated como true
        [_startButton setEnabled: NO];//desabilita botao start
        [self tick:nil]; //chama funcao tick
    }

}


- (void) tick:(id)sender{ //funcao tick
    if(started){ // se started for true...
        NSString *sec=[NSString stringWithFormat:@"%i", second]; //declara sec com o valor de second
        if(second<10){ //se second for menor que 10
            sec = [NSString stringWithFormat:@"0%i", second]; // atribui o valor de second com zero na frente para sec
        }
        NSString *min=[NSString stringWithFormat:@"%i", minute];//declara min com o valor de minute
        if(minute<10){//se minute for menor que 10
            min = [NSString stringWithFormat:@"0%i", minute]; //atribui o valor de minute com zero na frente para sec
        }
        NSString *time=[NSString stringWithFormat:@"%@ : %@", min, sec];//declara time com o valor de min e sec
        [_textTimer setStringValue:time];// muda o valor da string textTimer para time
        [self performSelector:@selector(tick:) withObject:nil afterDelay:1.0];//chama a funcao tick apos 1 segundo
        
		if(minute == 0 && second == 0){//se minuto e segundo for 0...
            //Lógica de variação de pomodoros e tempo de trabalho e descanso
            if (trocaTrabalhoDescanso == 1) {
                --trocaTrabalhoDescanso;
                minute = [[self.rodada.pomodoros[contadorPomodoros] descanso] intValue];
                if (contadorPomodoros==3) {
                    contadorPomodoros = 0;
                }else{++contadorPomodoros;}
            }else{
                ++trocaTrabalhoDescanso;
                minute = [[self.rodada.pomodoros[contadorPomodoros] trabalho] intValue];
            }
            [_textTimer setStringValue:[NSString stringWithFormat:@"%0i : 00",minute]];//muda a string textimer para "acabou"
            started = FALSE;//define started como falso
            [_startButton setEnabled: YES];//abilita botao start
            [Alarme tocar]; // Inicia os beeps
        }
		
		second-=1;//decrescenta 1 segundo


        }
        if(second<0){//se segundo menor que 0
            second=59;//atribui o valor 59 para segundo
            minute-=1;//decrescenta 1 minuto
        }
        
    }



@end
