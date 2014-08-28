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
    NSTimeInterval initial;
    int elapsed;
    int total;
}

-(instancetype)initWithMinutes:(int)value {
    self = [super init];
    if (self) {
        total = value * 60;
    }
    return self;
}

-(NSString*)timeWithStringFormat {
    int time = total - elapsed;
    
    int minutes = (int) (time / 60.0);
    int seconds = (int) (time - (minutes * 60));
    
    return [NSString stringWithFormat:@"%02u : %02u",minutes,seconds];
}

-(BOOL)pulse {
    elapsed = [NSDate timeIntervalSinceReferenceDate] - initial;
    return elapsed >= total;
}

-(Time*)start{
    initial = [NSDate timeIntervalSinceReferenceDate];
    return self;
}
@end
