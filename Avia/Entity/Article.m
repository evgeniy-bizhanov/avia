//
//  Article.m
//  Avia
//
//  Created by Евгений Бижанов on 26/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "Article.h"

@implementation Article

- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        _source = [[Source alloc] initWithDictionary:[dictionary valueForKey:@"source"]];
        _author = [dictionary valueForKey:@"author"];
        _title = [dictionary valueForKey:@"title"];
        _shortDesc = [dictionary valueForKey:@"description"];
        _url = [dictionary valueForKey:@"url"];
        _urlToImage = [dictionary valueForKey:@"urlToImage"];
        _publishedAt = [dictionary valueForKey:@"publishedAt"];
        _content = [dictionary valueForKey:@"content"];
    }
    
    return self;
}

@end
