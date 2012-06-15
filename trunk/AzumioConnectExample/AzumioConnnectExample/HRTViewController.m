//
//  HRTViewController.m
//  AzumioConnnectExample
//
//  Created by Peter Kuhar on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HRTViewController.h"
#import "AZConnect.h"

@interface HRTViewController ()

@end

@implementation HRTViewController
@synthesize heartrateLabel;
@synthesize hearrateButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    [[AZConnect instance] setHeartRateCallback:^(double heartRate) {
        heartrateLabel.text = [NSString stringWithFormat:@"%d bpm", (int)heartRate];
    } andSchema:@"com.azumio.iphone.AzumioConnectExample"];
	
}

- (void)viewDidUnload
{
    [self setHeartrateLabel:nil];
    [self setHearrateButton:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (void)dealloc {
    [heartrateLabel release];
    [hearrateButton release];
    [super dealloc];
}

- (IBAction)onMeasureHeartRAte:(id)sender {
    
    [[AZConnect instance] measureHeartRate];
    
}
@end
