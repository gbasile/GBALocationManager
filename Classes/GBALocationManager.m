//
//  GBAPositionManager.m
//  Giuseppe Basile
//
//  Created by Giuseppe Basile on 17/12/13.
//  Copyright (c) 2013 Giuseppe Basile. All rights reserved.
//

#import "GBALocationManager.h"

NSString * const GBALocationManagerLocationKey = @"GBALocationManagerLocationKey";

@interface GBALocationManager () <CLLocationManagerDelegate>
@property (nonatomic, strong, readwrite) CLLocation *location;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

@implementation GBALocationManager
@synthesize location = _location;

- (id)init
{
    self = [super init];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = 100.0;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    self.locationManager.delegate = self;
    
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    return self;
}

#pragma mark - Public Methods
+ (id)sharedInstance
{
    static dispatch_once_t once;
    static GBALocationManager *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)startLocationManager
{
    [self.locationManager startUpdatingLocation];
}

- (void)stopLocationManager
{
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - Custom Setter/Getter
- (void)setLocation:(CLLocation *)location
{
    _location = location;
    
    if (self.shouldCacheCurrentLocation) {
        [self.userDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:location] forKey:GBALocationManagerLocationKey];
        [self.userDefaults synchronize];
    }
}

- (CLLocation *)location
{
    if (!_location && self.shouldCacheCurrentLocation) {
        NSData *locationData = [self.userDefaults objectForKey:GBALocationManagerLocationKey];
        _location = [NSKeyedUnarchiver unarchiveObjectWithData:locationData];
    }
    
    return _location;
}

#pragma mark - Private Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.location = manager.location;
    
    if (self.shouldAutomaticallyStopOnDesiredAccurancy) {
        if (manager.location.horizontalAccuracy <= manager.desiredAccuracy) {
            [self stopLocationManager];
        }
    }
}

@end
