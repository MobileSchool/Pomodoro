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

@property AppDelegate * delegate;

@end

@implementation JanelaConfigWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        self.delegate = (AppDelegate*)[[NSApplication sharedApplication]delegate];
        
        
        [self.window orderFrontRegardless];
    }
    return self;
    
    


}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
}


- (IBAction)changeWorkStepper:(id)sender {
    [self.workTime setStringValue:[NSString stringWithFormat:@"%i",[self.workStepper intValue]]];
}

- (IBAction)changeShortStepper:(id)sender {
    [self.shortBreak setStringValue:[NSString stringWithFormat:@"%i",[self.shortStepper intValue]]];
}

- (IBAction)changeLongStepper:(id)sender {
    [self.longBreak setStringValue:[NSString stringWithFormat:@"%i",[self.longStepper intValue]]];
}

- (IBAction)salvar:(id)sender {
    
    NSNumber *trab1 = [NSNumber numberWithInt: [self.workStepper intValue]];
    
    NSNumber *desc1 = [NSNumber numberWithInt: [self.shortStepper intValue]];
    
    NSNumber *desc4 = [NSNumber numberWithInt: [self.longStepper intValue]];
                       
    [Config changeWorkTime:trab1 shortBreak:desc1 longBreak:desc4];
    [self.delegate.rodada atualizarPomodoros];
}


- (IBAction)restaurarPadrao:(id)sender {
    [Config restoreCustom];
    [self.delegate.rodada atualizarPomodoros];
}
@end
