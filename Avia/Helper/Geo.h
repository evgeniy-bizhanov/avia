//
//  Geo.h
//  Avia
//
//  Created by Евгений Бижанов on 30/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Geo : NSObject

+ (void)addressFromLocation:(CLLocation *)location completion:(void (^)(CLPlacemark *placemark))completion;
+ (void)locationFromAddress:(NSString *)address completion:(void (^)(CLPlacemark *placemark))completion;
        
@end

NS_ASSUME_NONNULL_END
