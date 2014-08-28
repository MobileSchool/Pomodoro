//
//  Time.m
//  Pomodoro
//
//  Created: Leonardo Ataide Minora on 04/08/14.
//  Modified: Leonardo Minora on 28/08/2014
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import "Time.h"

@implementation Time {
    int internalValue;
    int internalTime;
}

-(instancetype)initWithMinutes:(int)value {
    self = [super init];
    if (self) {
        internalValue = value * 60;
    }
    return self;
}

-(NSString*)timeWithStringFormat {
    int minutes = (int)internalTime / 60.0;
    int seconds = internalTime - (minutes * 60);
    return [NSString stringWithFormat:@"%02u:%02u", minutes, seconds];
}

-(BOOL)pulse {
    internalTime--;
    return (internalTime == 0);
}

-(Time*)start{
    internalTime = internalValue;
    return self;
}
@end
