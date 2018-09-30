//
//  Arts.h
//  Avia
//
//  Created by Евгений Бижанов on 29/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Arts : NSObject

@property(nonatomic, strong) NSArray *array;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
