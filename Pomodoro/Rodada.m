//
//  Rodada.m
//  Pomodoro
//
//  Created by Dennis da Silva Nunes on 13/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import "Rodada.h"
#import "Pomodoro.h"

@implementation Rodada

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self atualizarPomodoros];
        
    }
    return self;
}

- (void)atualizarPomodoros{
    
    NSString *fileCustom = [[NSBundle mainBundle] pathForResource:@"custom" ofType:@"json"]; //atribui endereco do arquivo custom.json (dentro do aplicativo na pasta resource)
    
    NSData *jsonData = [NSData dataWithContentsOfFile:fileCustom options:NSDataReadingMappedIfSafe error:nil]; // le arquivo json e coloca dados em uma variavel NSData, sem tratamento de erro.
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL]; // Transforma JsonData em Dicionario
    
    Pomodoro *pomodoro1 = [[Pomodoro alloc]initComTempoDeTrabalho:[dic objectForKey:@"tempoTrabalho1"] eTempoDeDescanso:[dic objectForKey:@"tempoDescanso1"]];
    Pomodoro *pomodoro2 = [[Pomodoro alloc]initComTempoDeTrabalho:[dic objectForKey:@"tempoTrabalho2"] eTempoDeDescanso:[dic objectForKey:@"tempoDescanso2"]];
    Pomodoro *pomodoro3 = [[Pomodoro alloc]initComTempoDeTrabalho:[dic objectForKey:@"tempoTrabalho3"] eTempoDeDescanso:[dic objectForKey:@"tempoDescanso3"]];
    Pomodoro *pomodoro4 = [[Pomodoro alloc]initComTempoDeTrabalho:[dic objectForKey:@"tempoTrabalho4"] eTempoDeDescanso:[dic objectForKey:@"tempoDescanso4"]];
    
    self.pomodoros = [NSMutableArray arrayWithObjects: pomodoro1, pomodoro2, pomodoro3, pomodoro4, nil];

}

@end
