//
//  JanelaConfigWindowController.h
//  Pomodoro
//
//  Created by Ítalo Berg on 15/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Config.h"


@interface JanelaConfigWindowController : NSWindowController

@property (weak) IBOutlet NSTextField *workTime;
@property (weak) IBOutlet NSTextField *shortBreak;
@property (weak) IBOutlet NSTextField *longBreak;
@property (weak) IBOutlet NSStepper *workStepper;
@property (weak) IBOutlet NSStepper *shortStepper;
@property (weak) IBOutlet NSStepper *longStepper;

- (IBAction)changeWorkStepper:(id)sender;
- (IBAction)changeShortStepper:(id)sender;
- (IBAction)changeLongStepper:(id)sender;


- (IBAction)salvar:(id)sender;
- (IBAction)restaurarPadrao:(id)sender;



@end
