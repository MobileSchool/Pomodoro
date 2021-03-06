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

@property (weak) IBOutlet NSMenuItem *startMenu;

@property (weak) IBOutlet NSMenuItem *stopMenu;

@property (weak) IBOutlet NSButton *stopButton;

@property (strong) IBOutlet NSButton *startButton;
@property (assign) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSTextField *textTimer;
@property Rodada* rodada;

@property (weak) IBOutlet NSTextField *labelCounter;
@property (weak) IBOutlet NSMenuItem *clockMenuItem;



- (IBAction)push_start:(id)sender;



@property JanelaConfigWindowController *Janela;
- (IBAction)SelectConfig:(id)sender;
- (IBAction)push_stop:(id)sender;
- (IBAction)openPomodoroWindow:(id)sender;
- (IBAction)changeStateClockMenuItem:(id)sender;






//menu bar
@property (weak) IBOutlet NSMenu *menu;

@end
