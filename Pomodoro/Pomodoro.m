//
//  Pomodoro.m
//  Pomodoro
//
//  Created by Leonardo Ataide Minora on 04/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import "Pomodoro.h"

@implementation Pomodoro


- (instancetype)initComTempoDeTrabalho: (id) tempoTrabalho
                      eTempoDeDescanso: (id) tempoDescanso
{
    self = [super init];
    if (self) {
        self.trabalho = tempoTrabalho;
        self.descanso = tempoDescanso;
    }
    return self;
}
@end
