//
//  GBAViewController.m
//  GBALocationManager
//
//  Created by Giuseppe Basile on 17/12/13.
//  Copyright (c) 2013 Giuseppe Basile. All rights reserved.
//

#import "GBAViewController.h"
#import "GBALocationManager.h"

@interface GBAViewController ()
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@end

@implementation GBAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)updateLocation:(id)sender
{
    CLLocation *location = [GBALocationManager sharedInstance].location;
    
    self.locationLabel.text = location.description;
}

@end
