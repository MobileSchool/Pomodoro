//
//  Alarme.m
//  Pomodoro
//
//  Created by Leonardo Ataide Minora on 04/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import "Alarme.h"

@implementation Alarme

// Método que ativa o alarme

+ (void)tocar{
    // Pegando URL do arquivo beep
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"beep" withExtension:@"mp3"];
    // Atribuindo endereço a beep
    NSSound * beep = [[NSSound alloc] initWithContentsOfURL:url byReference:YES];
    if (beep) {
        [beep play];
    }
}



@end
