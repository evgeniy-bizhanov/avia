//
//  MOArt+CoreDataClass.h
//  Avia
//
//  Created by Евгений Бижанов on 09/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Art.h"

NS_ASSUME_NONNULL_BEGIN

@interface MOArt : NSManagedObject

- (instancetype) initWithArt:(Art *) art;

@end

NS_ASSUME_NONNULL_END

#import "MOArt+CoreDataProperties.h"

