//
//  Rodada.m
//  Pomodoro
//
//  Created by Dennis da Silva Nunes on 13/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import "Rodada.h"

@interface Rodada(){
    int pomodoroCounter;
}
@end

@implementation Rodada

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self atualizarPomodoros];
        pomodoroCounter = 0;
    }
    return self;
}

- (Pomodoro*) next {
    Pomodoro *temp = self.pomodoros[pomodoroCounter];
    pomodoroCounter++;
    return temp;
}

- (void)atualizarPomodoros{
    
    NSString *fileCustom = [[NSBundle mainBundle] pathForResource:@"timeConfig" ofType:@"json"]; //atribui endereco do arquivo timeConfig.json (dentro do aplicativo na pasta resource)
    
    NSData *jsonData = [NSData dataWithContentsOfFile:fileCustom options:NSDataReadingMappedIfSafe error:nil]; // le arquivo json e coloca dados em uma variavel NSData, sem tratamento de erro.
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL]; // Transforma JsonData em Dicionario
    
    Pomodoro *pomodoro1 = [[Pomodoro alloc]initWithWorktime:[[dic objectForKey:@"customWorkTime"]intValue] andBreaktime:[[dic objectForKey:@"customShortBreak"]intValue]];
    Pomodoro *pomodoro2 = [[Pomodoro alloc]initWithWorktime:[[dic objectForKey:@"customWorkTime"]intValue] andBreaktime:[[dic objectForKey:@"customShortBreak"]intValue]];
    Pomodoro *pomodoro3 = [[Pomodoro alloc]initWithWorktime:[[dic objectForKey:@"customWorkTime"]intValue] andBreaktime:[[dic objectForKey:@"customShortBreak"]intValue]];
    Pomodoro *pomodoro4 = [[Pomodoro alloc]initWithWorktime:[[dic objectForKey:@"customWorkTime"]intValue] andBreaktime:[[dic objectForKey:@"customLongBreak"]intValue]];
    
    self.pomodoros = [NSMutableArray arrayWithObjects: pomodoro1, pomodoro2, pomodoro3, pomodoro4, nil];

}

@end
