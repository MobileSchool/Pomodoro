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

@property (weak) IBOutlet NSTextField *tempoTrabalho1;
@property (weak) IBOutlet NSTextField *tempoTrabalho2;
@property (weak) IBOutlet NSTextField *tempoTrabalho3;
@property (weak) IBOutlet NSTextField *tempoTrabalho4;

@property (weak) IBOutlet NSTextField *tempoDescanso1;
@property (weak) IBOutlet NSTextField *tempoDescanso2;
@property (weak) IBOutlet NSTextField *tempoDescanso3;
@property (weak) IBOutlet NSTextField *tempoDescanso4;

- (IBAction)salvar:(id)sender;
- (IBAction)restaurarPadrao:(id)sender;



@end
