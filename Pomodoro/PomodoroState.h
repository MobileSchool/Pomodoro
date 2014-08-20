//
//  PomodoroState.h
//  Pomodoro
//
//  Created: Leonardo Minora on 18/08/14
//  Modified: Leonardo Minora on 20/08/2014
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//


enum PomodoroState {
    NEW,
    ON_PULSE_WORKTIME,
    CHANGE_WORKTIME_BREAKTIME,
    ON_PULSE_BREAKTIME,
    STOPPED,
    END
};
