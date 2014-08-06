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

@property Time *trabalho;
@property Time *descanso;

@property Alarme *alarme;

@end
