//
//  NGAViewController.m
//  NGAParallaxMotion Demo
//
//  Created by Michael Bishop on 7/4/13.
//  Copyright (c) 2013 Numerical Garden. All rights reserved.
//

#import "NGAViewController.h"
#import "NGAParallaxMotion.h"

@interface NGAViewController ()

@property (strong, nonatomic) IBOutlet UISwitch *parallaxSwitch;
@property (strong, nonatomic) IBOutlet UISegmentedControl *parallaxConstraintControl;
@property (strong, nonatomic) IBOutlet UILabel *midLabel;
@property (strong, nonatomic) NSArray * labels;
@end

@implementation NGAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray * labels = [NSMutableArray new];
    for (UIView * view in self.view.subviews)
    {
        if ([view isKindOfClass:[UILabel class]])
            [labels addObject:view];
    }
    self.labels = labels;
    self.parallaxConstraintControl.enabled = self.parallaxSwitch.isOn;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)toggleParallax:(id)sender
{
    UISwitch * uisswitch = (UISwitch*)sender;
    if (uisswitch.isOn)
    {
        self.parallaxConstraintControl.enabled = YES;
        CGFloat baseFontSize = self.midLabel.font.pointSize;
        for (UILabel * label in self.labels)
        {
            label.parallaxIntensity = label.font.pointSize - baseFontSize;
            label.parallaxDirectionConstraint = self.parallaxConstraintControl.selectedSegmentIndex;
        }
    }
    else
    {
        self.parallaxConstraintControl.enabled = NO;
        for (UILabel * label in self.labels)
        {
            label.parallaxIntensity = 0.0;
        }
    }
}

-(IBAction)setConstraintFromSender:(id)sender
{
    UISegmentedControl * control = (UISegmentedControl*)sender;
    for (UILabel * label in self.labels)
    {
        label.parallaxDirectionConstraint = control.selectedSegmentIndex;
    }
}

@end
