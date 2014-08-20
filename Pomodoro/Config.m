//
//  Config.m
//  Pomodoro
//
//  Created by Mobile School - Julian on 13/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import "Config.h"

@implementation Config

//Metódo de sobreEscrever personalização de tempo de volta para padrão.

+ (void)restoreCustom{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"timeConfig" ofType:@"json"]; //atribui endereco do arquivo default.json (dentro do aplicativo na pasta resource)

    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil]; // le arquivo json e coloca dados em uma variavel NSData, caso erro sera nulo.
    
    NSDictionary * dictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:NULL];
    
    NSMutableDictionary *dic = [dictionary mutableCopy];
    
    [dic setObject:[dic objectForKey:@"workTime"] forKey:@"customWorkTime"];
    [dic setObject:[dic objectForKey:@"shortBreak"] forKey:@"customShortBreak"];
    [dic setObject:[dic objectForKey:@"longBreak"] forKey:@"customLongBreak"];
    
    NSData *newJSONData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    [newJSONData writeToFile:filePath atomically:YES]; // escreve dados do JSONData no arquivo custom.json
}

+ (void)changeWorkTime: (id) workTime
            shortBreak: (id) shortBreak
             longBreak: (id) longBreak{
    
    NSString *timeConfig = [[NSBundle mainBundle] pathForResource:@"timeConfig" ofType:@"json" ]; //atribui endereco do arquivo custom.json (dentro do aplicativo na pasta resource)
    
    NSData *jsonData = [NSData dataWithContentsOfFile:timeConfig options:NSDataReadingMappedIfSafe error:nil]; // le arquivo json e coloca dados em uma variavel NSData, sem tratamento de erro.

    NSDictionary *dicJson = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL]; // Transforma JsonData em Dicionario
    
    NSMutableDictionary *dic = [dicJson mutableCopy];
    
    
    if (workTime) {
        [dic setObject:workTime forKey:@"customWorkTime"];
    }
    
    if(shortBreak){
        [dic setObject:shortBreak forKey:@"customShortBreak"];
    }
    
    if (longBreak) {
        [dic setObject:longBreak forKey:@"customLongBreak"];
    }
    
        NSData * jsonNewData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil]; // Transformando Dicionario em Data
    
    [jsonNewData writeToFile:timeConfig atomically:YES];

}
@end
