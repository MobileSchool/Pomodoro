//
//  Pomodoro.m
//  Pomodoro
//
//  Created: Leonardo Minora on 04/08/14
//  Modified: Leonardo Minora on 20/08/2014
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import "Pomodoro.h"

@implementation Pomodoro {
// atributos privados ficam entre chaves
    // e não tem atribuição de valores
    int second;
    int minute;
    int worktime;
    int breaktime;
    BOOL stopped;
    enum PomodoroState state;
}

//- (instancetype)initComTempoDeTrabalho: (id) tempoTrabalho
//                      eTempoDeDescanso: (id) tempoDescanso
//{
//    self = [super init];
//    if (self) {
//        self.trabalho = tempoTrabalho;
//        self.descanso = tempoDescanso;
//        state = NEW;
//        stopped = YES;
//    }
//    return self;
//}

- (instancetype) initWithWorktime:(int)wTime andBreaktime:(int)bTime {
    self = [super init];
    if (self) {
        worktime = wTime;
        breaktime = bTime;
        stopped = NEW;
        stopped = YES;
    }
    return self;
}

- (BOOL)pulseRegressiveTime {
    second--;
    if(second < 0){
        second = 59;
        minute--;
    }
    return (second == 0 && minute == 0);
}

- (void) pulse {
    switch (state) {
        case ON_PULSE_BREAKTIME:
            if ([self pulseRegressiveTime]) {
                [self finish];
            }
            break;
        case ON_PULSE_WORKTIME:
            if ([self pulseRegressiveTime]) {
                [self changeTimeFromWorkToBreak];
            }
            break;
        case CHANGE_WORKTIME_BREAKTIME:
            [self startBreaktime];
        default:
            break;
    }
}

- (int) second {
    return second;
}

- (int) minute {
    return minute;
}


-(NSString*) timeWithStringFormat {
    return [NSString stringWithFormat:@"%02u:%02u", minute, second];
}

- (enum PomodoroState) state {
    return state;
}

- (void) forceStop {
    state = STOPPED;
}

- (void) finish {
    state = END;
}

- (void) start {
    minute = worktime;
    second = 0;
    state = ON_PULSE_WORKTIME;
}

- (void) startBreaktime {
    minute = breaktime;
    second = 0;
    state = ON_PULSE_BREAKTIME;
}

- (void) changeTimeFromWorkToBreak {
    state = CHANGE_WORKTIME_BREAKTIME;
}

@end
