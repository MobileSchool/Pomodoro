//
//  Pomodoro.h
//  Pomodoro
//
//  Created: Leonardo Minora on 04/08/14
//  Modified: Leonardo Minora on 28/08/2014
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.


#import <Foundation/Foundation.h>
#import "Time.h"
#import "Alarme.h"
#import "PomodoroState.h"

@interface Pomodoro : NSObject

@property (readonly) enum PomodoroState state;

- (instancetype) initWithWorktime: (int) worktime andBreaktime: (int) breaktime;

- (void) pulse;
//propriedade não sintetizada e somente leitura  
//- (enum PomodoroState) state;

-(NSString*) timeWithStringFormat;
- (void) forceStop;
- (void) start;
- (void) callEraseElasep;

@end
