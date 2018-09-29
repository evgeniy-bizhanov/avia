//
//  Arts.m
//  Avia
//
//  Created by Евгений Бижанов on 29/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "Arts.h"
#import "Art.h"

@implementation Arts

- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        for (NSDictionary *item in dictionary) {
            Art *art = [[Art alloc] initWithDictionary:item];
            [array addObject:art];
        }
        
        _array = array;
    }
    
    return self;
}

@end
