//
//  Config.h
//  Pomodoro
//
//  Created by Mobile School - Julian on 13/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Config : NSObject

+ (void)restauraPadrao;
+ (void)alterarTempoTrabalho1: (id) tempoTrabalho1
               tempoTrabalho2: (id) tempoTrabalho2
               tempoTrabalho3: (id) tempoTrabalho3
               tempoTrabalho4: (id) tempoTrabalho4
               tempoDescanso1: (id) tempoDescanso1
               tempoDescanso2: (id) tempoDescanso2
               tempoDescanso3: (id) tempoDescanso3
               tempoDescanso4: (id) tempoDescanso4;
@end
