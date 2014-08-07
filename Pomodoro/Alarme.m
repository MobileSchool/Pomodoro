//
//  Alarme.m
//  Pomodoro
//
//  Created by Leonardo Ataide Minora on 04/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import "Alarme.h"

@implementation Alarme


// Método de inicialização para colocar endereço de arquivo na variavel beep

- (instancetype)init
{

    self = [super init];
// Pegando URL do arquivo beep
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"beep" withExtension:@"mp3"];
    if (self) {
// Atribuindo endereço a beep
        self.beep = [[NSSound alloc] initWithContentsOfURL:url byReference:YES];
    }
    return self;
}

// Método que ativa o alarme

- (void)tocar{
    
    if (self.beep) {
        [self.beep play];
    }
    
}



@end
