//
//  Source.m
//  Avia
//
//  Created by Евгений Бижанов on 26/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "Source.h"

@implementation Source

+ (void)initialize {}

- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    
    if (self) {
        _identifier = [dictionary valueForKey:@"id"];
        _name = [dictionary valueForKey:@"name"];
    }
        
    return self;
}

@end
