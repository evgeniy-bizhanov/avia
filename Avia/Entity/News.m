//
//  News.m
//  Avia
//
//  Created by Евгений Бижанов on 26/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "News.h"

@implementation News

- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        _status = [dictionary valueForKey:@"status"];
        _totalResults = [dictionary valueForKey:@"totalResults"];
        _articles = [[NSMutableArray alloc] init];
        
        NSDictionary *articleDictionary = [dictionary valueForKey:@"articles"];
        
        for (NSDictionary *dictionary in articleDictionary) {
            Article *article = [[Article alloc] initWithDictionary:dictionary];
            [_articles addObject:article];
        }
    }
    
    return self;
}

@end
