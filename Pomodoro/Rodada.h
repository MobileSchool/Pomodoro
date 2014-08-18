//
//  Rodada.h
//  Pomodoro
//
//  Created by Dennis da Silva Nunes on 13/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pomodoro.h"

@interface Rodada : NSObject

@property NSMutableArray* pomodoros;

- (void)atualizarPomodoros;
- (Pomodoro*) next;


@end
