//
//  JanelaConfigWindowController.m
//  Pomodoro
//
//  Created by Ítalo Berg on 15/08/14.
//  Copyright (c) 2014 Mobile School at IFRN-CNAT. All rights reserved.
//

#import "JanelaConfigWindowController.h"
#import "AppDelegate.h"

@interface JanelaConfigWindowController ()

@end

@implementation JanelaConfigWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    NSLog(@"Esta funcionando");
    
}

- (IBAction)salvar:(id)sender {
    
    NSNumber *trab = [NSNumber numberWithInt: [self.tempoTrabalho intValue]];
    
    NSNumber *descCurto = [NSNumber numberWithInt: [self.tempoDescansoCurto intValue]];
    NSNumber *descLongo = [NSNumber numberWithInt: [self.tempoDescansoLongo intValue]];
                       
    [Config changeWorkTime:trab shortBreak:descCurto longBreak:descLongo];
   
}

- (IBAction)restaurarPadrao:(id)sender {
    [Config restoreCustom];
}
@end
