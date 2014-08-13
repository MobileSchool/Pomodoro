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

+ (void)restauraPadrao{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"default" ofType:@"json"]; //atribui endereco do arquivo default.json (dentro do aplicativo na pasta resource)
    NSString *filecustom = [[NSBundle mainBundle] pathForResource:@"custom" ofType:@"json"]; //atribui endereco do arquivo custom.json (dentro do aplicativo na pasta resource)

    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil]; // le arquivo json e coloca dados em uma variavel NSData, caso erro sera nulo.
    
    [JSONData writeToFile:filecustom atomically:YES]; // escreve dados do JSONData no arquivo custom.json
    
}

//Método de personalização de tempos do pomodoro

+ (void)alterarTempoTrabalho1: (id) tempoTrabalho1
               tempoTrabalho2: (id) tempoTrabalho2
               tempoTrabalho3: (id) tempoTrabalho3
               tempoTrabalho4: (id) tempoTrabalho4
               tempoDescanso1: (id) tempoDescanso1
               tempoDescanso2: (id) tempoDescanso2
               tempoDescanso3: (id) tempoDescanso3
               tempoDescanso4: (id) tempoDescanso4{

    NSString *fileCustom = [[NSBundle mainBundle] pathForResource:@"custom" ofType:@"json"]; //atribui endereco do arquivo custom.json (dentro do aplicativo na pasta resource)
    
    NSData *jsonData = [NSData dataWithContentsOfFile:fileCustom options:NSDataReadingMappedIfSafe error:nil]; // le arquivo json e coloca dados em uma variavel NSData, sem tratamento de erro.
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL]; // Transforma JsonData em Dicionario
    NSMutableDictionary * dicionario = [dic mutableCopy]; // Cria um dicionario mutavel igual o anterior imutavel

// Condições para substituição de valores no dicionario mutavel
    
    if (tempoTrabalho1) {
        [dicionario setObject:tempoTrabalho1 forKey:@"tempoTrabalho1"];
    }
    if (tempoTrabalho2) {
        [dicionario setObject:tempoTrabalho2 forKey:@"tempoTrabalho2"];
    }
    if (tempoTrabalho3) {
        [dicionario setObject:tempoTrabalho3 forKey:@"tempoTrabalho3"];
    }
    if (tempoTrabalho4) {
        [dicionario setObject:tempoTrabalho4 forKey:@"tempoTrabalho4"];
    }
    if (tempoDescanso1) {
        [dicionario setObject:tempoDescanso1 forKey:@"tempoDescanso1"];
    }
    if (tempoDescanso2) {
        [dicionario setObject:tempoDescanso2 forKey:@"tempoDescanso2"];
    }
    if (tempoDescanso3) {
        [dicionario setObject:tempoDescanso3 forKey:@"tempoDescanso3"];
    }
    if (tempoDescanso4) {
        [dicionario setObject:tempoDescanso4 forKey:@"tempoDescanso4"];
    }
    

    NSData * jsonNewData = [NSJSONSerialization dataWithJSONObject:dicionario options:NSJSONWritingPrettyPrinted error:nil]; // Transformando dicionario mutavel em jsonData
    
    [jsonNewData writeToFile:fileCustom atomically:YES]; // Escrevendo em arquivo custom o que esta no JsonData
}









@end
