//
//  CoreDataManager.h
//  Avia
//
//  Created by Евгений Бижанов on 09/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "../Entity/MOArt+CoreDataClass.h"
#import "../Entity/Art.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataManager : NSObject

+ (instancetype)shared;

- (BOOL) isFavorite:(Art *)art;
- (NSArray *) favorites;
- (void) addToFavorite:(Art *)art;
- (void) removeFromFavorite:(Art *)art;

@end

NS_ASSUME_NONNULL_END
