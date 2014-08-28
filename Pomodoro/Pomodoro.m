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
    Time *myTime;
    Time *worktime;
    Time *breaktime;
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

- (void) pulse {
    switch (state) {
        case ON_PULSE_BREAKTIME:
            if ([myTime pulse]) {
                [self finish];
            }
            break;
        case ON_PULSE_WORKTIME:
            if ([myTime pulse]) {
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
    state = ON_PULSE_WORKTIME;
}

- (void) startBreaktime {
    myTime = [breaktime start];
    state = ON_PULSE_BREAKTIME;
}

- (void) changeTimeFromWorkToBreak {
    state = CHANGE_WORKTIME_BREAKTIME;
}

@end
