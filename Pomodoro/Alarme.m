//
//  Alarme.m
//  Pomodoro
//
//  Created by Leonardo Ataide Minora on 04/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import "Alarme.h"

@implementation Alarme

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.beep = [[NSSound alloc] initWithContentsOfFile:@"/Users/DennisNunes/Dropbox/Documents To Go/Objective-C/Pomodoro/beep.mp3" byReference:YES];
    }
    return self;
}

- (void)tocar{

    [self.beep play];

}


@end
