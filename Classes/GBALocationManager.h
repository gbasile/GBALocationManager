//
//  GBAPositionManager.m
//  Giuseppe Basile
//
//  Created by Giuseppe Basile on 17/12/13.
//  Copyright (c) 2013 Giuseppe Basile. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface GBALocationManager : NSObject

//! The current position, if shouldCacheCurrentLocation is YES it returns
//! immediatly the cached value while fetching the new one
@property (nonatomic, strong, readonly) CLLocation *location;


//! Cache every value so that it can be used on next launch of the Location
//! Manager
@property (nonatomic, assign) BOOL shouldCacheCurrentLocation;

//! If yes, the manager automatically stop when retrieve a location with the
//! desired accurancy
@property (nonatomic, assign) BOOL shouldAutomaticallyStopOnDesiredAccurancy;

+ (instancetype)sharedInstance;
- (void)startLocationManager;
- (void)stopLocationManager;

@end
