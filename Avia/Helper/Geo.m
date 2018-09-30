//
//  Geo.m
//  Avia
//
//  Created by Евгений Бижанов on 30/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "Geo.h"

@implementation Geo

+ (void)addressFromLocation:(CLLocation *)location completion:(void (^)(CLPlacemark *placemark))completion {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        completion([placemarks firstObject]);
    }];
}

+ (void)locationFromAddress:(NSString *)address completion:(void (^)(CLPlacemark *placemark))completion {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        completion([placemarks firstObject]);
    }];
}

@end
