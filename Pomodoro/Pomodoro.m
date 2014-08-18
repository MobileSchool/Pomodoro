//
//  Pomodoro.m
//  Pomodoro
//
//  Created by Leonardo Ataide Minora on 04/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import "Pomodoro.h"

@implementation Pomodoro

int second = 0;
int minute;
int time_work;
int time_break;
BOOL stopped = YES;
enum PomodoroState _state;

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

- (void) workTime: (int) workTime breakTime: (int) breakTime {
    time_break = breakTime;
    time_work = workTime;
    [self start];
}

- (void) pulse {
    if (_state == ON_PULSE_WORKTIME) {
        second--;
        if(second < 0){
            second = 59;
            minute--;
        }else if(second == 0 && minute == 0){
            [self changeTime];
        }
    }else if (_state == ON_PULSE_BREAKTIME){
        second--;
        if(second < 0){
            second = 59;
            minute--;
        }else if(second == 0 && minute == 0){
            [self finish];
        }
    }
}

- (int) second {
    return second;
}

- (int) minute {
    return minute;
}

- (enum PomodoroState) state {
    return _state;
}

- (void) forceStop {
    _state = STOPPED;
}

- (void) finish {
    _state = END;
}

- (void) start {
    minute = time_work;
    second = 0;
    _state = ON_PULSE_WORKTIME;
}
// changeTimeFromWorkToBreak
- (void) changeTime {
    minute = time_break;
    second = 0;
    _state = ON_PULSE_BREAKTIME;
}

@end
