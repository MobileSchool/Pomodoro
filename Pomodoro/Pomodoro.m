//
//  Pomodoro.m
//  Pomodoro
//
//  Created: Leonardo Minora on 04/08/14
//  Modified: Leonardo Minora on 28/08/2014
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import "Pomodoro.h"
#import "Time.h"

@implementation Pomodoro {
// atributos privados ficam entre chaves
    // e não tem atribuição de valores
    int second;
    int minute;
    Time *myTime;
    Time *worktime;
    Time *breaktime;
//    int intWorktime;
//    int intBreaktime;
    BOOL stopped;
    enum PomodoroState state;
}

- (instancetype) initWithWorktime:(int)intWorktime andBreaktime:(int)intBreaktime {
    self = [super init];
    if (self) {
        worktime = [[Time alloc] initWithMinutes: intWorktime];
        breaktime = [[Time alloc] initWithMinutes: intBreaktime];
        stopped = NEW;
        stopped = YES;
    }
    return self;
}

- (BOOL)pulseRegressiveTime {
//    second--;
//    if(second < 0){
//        second = 59;
//        minute--;
//    }
//    return (second == 0 && minute == 0);
    return [myTime pulse];
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

-(NSString*) timeWithStringFormat {
    return [myTime timeWithStringFormat];
//    return [NSString stringWithFormat:@"%02u:%02u", minute, second];
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
    myTime = [worktime start];
//    minute = intWorktime;
    second = 0;
    state = ON_PULSE_WORKTIME;
}

- (void) startBreaktime {
    myTime = [breaktime start];
//    minute = intBreaktime;
    second = 0;
    state = ON_PULSE_BREAKTIME;
}

- (void) changeTimeFromWorkToBreak {
    state = CHANGE_WORKTIME_BREAKTIME;
}

@end
