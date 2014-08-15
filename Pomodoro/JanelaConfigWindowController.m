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
    
    NSNumber *trab1 = [NSNumber numberWithInt: [self.tempoTrabalho1 intValue]];
    NSNumber *trab2 = [NSNumber numberWithInt: [self.tempoTrabalho2 intValue]];
    NSNumber *trab3 = [NSNumber numberWithInt: [self.tempoTrabalho3 intValue]];
    NSNumber *trab4 = [NSNumber numberWithInt: [self.tempoTrabalho4 intValue]];
    
    NSNumber *desc1 = [NSNumber numberWithInt: [self.tempoDescanso1 intValue]];
    NSNumber *desc2 = [NSNumber numberWithInt: [self.tempoDescanso2 intValue]];
    NSNumber *desc3 = [NSNumber numberWithInt: [self.tempoDescanso3 intValue]];
    NSNumber *desc4 = [NSNumber numberWithInt: [self.tempoDescanso4 intValue]];
                       
    [Config alterarTempoTrabalho1:trab1 tempoTrabalho2:trab2 tempoTrabalho3:trab3 tempoTrabalho4:trab4 tempoDescanso1:desc1 tempoDescanso2:desc2 tempoDescanso3:desc3 tempoDescanso4:desc4];
   
}

- (IBAction)restaurarPadrao:(id)sender {
    [Config restauraPadrao];
}
@end
