//
//  Config.h
//  Pomodoro
//
//  Created by Mobile School - Julian on 13/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Config : NSObject

+ (void)restoreCustom;

+ (void)changeWorkTime: (id) workTime
            shortBreak: (id) shortBreak
             longBreak: (id) longBreak;



@end
