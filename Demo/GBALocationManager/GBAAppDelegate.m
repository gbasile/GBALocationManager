//
//  GBAAppDelegate.m
//  GBALocationManager
//
//  Created by Giuseppe Basile on 17/12/13.
//  Copyright (c) 2013 Giuseppe Basile. All rights reserved.
//

#import "GBAAppDelegate.h"
#import "GBALocationManager.h"

@implementation GBAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    GBALocationManager *manager = [GBALocationManager sharedInstance];
    manager.shouldCacheCurrentLocation = YES;
    manager.shouldAutomaticallyStopOnDesiredAccurancy = YES;
    
    [manager startLocationManager];
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[GBALocationManager sharedInstance] stopLocationManager];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[GBALocationManager sharedInstance] startLocationManager];
}

@end
