//
//  PushViewController.m
//  Push
//
//  Created by One Associates Technologies Pvt Ltd on 30/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PushViewController.h"
#import "PushAppDelegate.h"
@interface PushViewController ()

@end

@implementation PushViewController
@synthesize label;
@synthesize label2;
@synthesize label3;

- (void)viewDidLoad
{
    [super viewDidLoad];
       
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSString *alertValue = [prefs objectForKey:@"deviceToken"];
    NSLog(@"Token : %@", alertValue);
    label.text=alertValue;
     
    
    NSString *himanshulanjewar=[prefs stringForKey:@"himanshulanjewar"];
    label2.text=himanshulanjewar;
    
    NSString *device=[prefs stringForKey:@"deviceHardCoded"];
    label3.text=device;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [self setLabel2:nil];
    [self setLabel3:nil];
    [super viewDidUnload];
  
 
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
