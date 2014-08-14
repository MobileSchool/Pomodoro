//
//  Pomodoro.h
//  Pomodoro
//
//  Created by Leonardo Minora on 04/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Time.h"
#import "Alarme.h"

@interface Pomodoro : NSObject

@property id trabalho;
@property id descanso;

- (instancetype)initComTempoDeTrabalho: (id) tempoTrabalho
                      eTempoDeDescanso: (id) tempoDescanso;

@end
