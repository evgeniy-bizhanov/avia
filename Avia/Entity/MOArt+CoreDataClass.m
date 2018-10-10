//
//  MOArt+CoreDataClass.m
//  Avia
//
//  Created by Евгений Бижанов on 09/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//
//

#import "MOArt+CoreDataClass.h"

@implementation MOArt

- (instancetype) initWithArt:(Art *) art {
    self = [super init];
    
    if (self) {
        self.title = art.title;
        self.desc = art.desc;
        self.creator = art.creator;
        self.date = art.date;
        self.discipline = art.discipline;
        self.imagefile = art.imagefile;
        self.latitude = art.latitude;
        self.longitude = art.longitude;
        self.location = art.location;
    }
    
    return self;
}

@end
