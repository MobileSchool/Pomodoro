//
//  AppDelegate.h
//  pomodoro2
//
//  Created by Mobile School - Julian on 30/07/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Rodada.h"
#import "JanelaConfigWindowController.h"


@interface AppDelegate : NSObject <NSApplicationDelegate>


@property (strong) IBOutlet NSButton *startButton;
@property (assign) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSTextField *textTimer;
@property Rodada* rodada;

- (IBAction)push_start:(id)sender;
- (void)tick:(id)sender;

@property JanelaConfigWindowController *Janela;
- (IBAction)SelectConfig:(id)sender;

@end
