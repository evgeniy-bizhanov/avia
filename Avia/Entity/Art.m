//
//  Art.m
//  Avia
//
//  Created by Евгений Бижанов on 29/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "Art.h"

@implementation Art

- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        _creator = [dictionary valueForKey:@"creator"];
        _date = [dictionary valueForKey:@"date"];
        _desc = [dictionary valueForKey:@"description"];
        _discipline = [dictionary valueForKey:@"discipline"];
        _imagefile = [dictionary valueForKey:@"imagefile"];
        _latitude = [dictionary valueForKey:@"latitude"];
        _longitude = [dictionary valueForKey:@"longitude"];
        _location = [dictionary valueForKey:@"location"];
        _title = [dictionary valueForKey:@"title"];
    }
    
    return self;
}

@end
