//
//  Config.m
//  Pomodoro
//
//  Created by Mobile School - Julian on 13/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import "Config.h"

@implementation Config

+ (void)restauraPadrao{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"default" ofType:@"json"]; //atribui endereco do arquivo default.json (dentro do aplicativo na pasta resource)
    NSString *filecustom = [[NSBundle mainBundle] pathForResource:@"custom" ofType:@"json"]; //atribui endereco do arquivo custom.json (dentro do aplicativo na pasta resource)

    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil]; // le arquivo json e coloca dados em uma variavel NSData, caso erro sera nulo.
    
    [JSONData writeToFile:filecustom atomically:YES]; // escreve dados do JSONData no arquivo custom.json
    
}

@end
