//
//  News.h
//  Avia
//
//  Created by Евгений Бижанов on 26/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Article.h"

NS_ASSUME_NONNULL_BEGIN
//NS_ROOT_CLASS // disable the root class warning

@interface News : NSObject

@property(nonatomic, strong) NSString *status;
@property(nonatomic, assign) NSNumber *totalResults;
@property(nonatomic, strong) NSMutableArray *articles;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
