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
    [Config alterarTempoTrabalho1:self.tempoTrabalho1 tempoTrabalho2: self.tempoTrabalho2 tempoTrabalho3:self.tempoTrabalho3 tempoTrabalho4:self.tempoTrabalho4 tempoDescanso1:self.tempoDescanso1 tempoDescanso2:self.tempoDescanso2 tempoDescanso3:self.tempoDescanso3 tempoDescanso4:self.tempoDescanso4];
}

- (IBAction)restaurarPadrao:(id)sender {
    [Config restauraPadrao];
}
@end
