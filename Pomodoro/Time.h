//
//  Time.h
//  Pomodoro
//
//  Created by Leonardo Ataide Minora on 04/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Time : NSObject

@property (readonly) NSInteger minuto;
@property (readonly) NSInteger segundo;

-(instancetype)initWithMinutes:(int)minutes;
-(NSString*)timeWithStringFormat;
-(BOOL)pulse;
-(Time*)start;

@end
