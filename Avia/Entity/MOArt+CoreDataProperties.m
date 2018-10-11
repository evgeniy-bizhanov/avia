//
//  MOArt+CoreDataProperties.m
//  Avia
//
//  Created by Евгений Бижанов on 10/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//
//

#import "MOArt+CoreDataProperties.h"

@implementation MOArt (CoreDataProperties)

+ (NSFetchRequest<MOArt *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Art"];
}

@dynamic title;
@dynamic desc;
@dynamic creator;
@dynamic date;
@dynamic discipline;
@dynamic imagefile;
@dynamic latitude;
@dynamic longitude;
@dynamic location;
@dynamic isFavorite;

@end
