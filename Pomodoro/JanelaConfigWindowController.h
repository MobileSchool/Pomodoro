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

- (IBAction)salvar:(id)sender;
- (IBAction)restaurarPadrao:(id)sender;

@property (weak) IBOutlet NSPopUpButton *tempoTrabalho;
@property (weak) IBOutlet NSPopUpButton *tempoDescansoCurto;
@property (weak) IBOutlet NSPopUpButton *tempoDescansoLongo;


@end
