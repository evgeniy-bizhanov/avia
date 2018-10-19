//
//  MOArt+CoreDataProperties.h
//  Avia
//
//  Created by Евгений Бижанов on 10/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//
//

#import "MOArt+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MOArt (CoreDataProperties)

+ (NSFetchRequest<MOArt *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *creator;
@property (nullable, nonatomic, copy) NSString *date;
@property (nullable, nonatomic, copy) NSString *discipline;
@property (nullable, nonatomic, copy) NSString *imagefile;
@property (nullable, nonatomic, copy) NSString *latitude;
@property (nullable, nonatomic, copy) NSString *longitude;
@property (nullable, nonatomic, copy) NSString *location;
@property (nonatomic) BOOL isFavorite;

@end

NS_ASSUME_NONNULL_END
