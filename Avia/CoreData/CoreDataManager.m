//
//  CoreDataManager.m
//  Avia
//
//  Created by Евгений Бижанов on 09/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataManager()

@property(nonatomic, strong) NSPersistentContainer *persistentContainer;

@end

@implementation CoreDataManager

+ (instancetype)shared {
    static CoreDataManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [CoreDataManager new];
        [instance setup];
    });
    return instance;
}

- (void) setup {
    _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Model"];
    [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *description, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
            abort();
        }
    }];
}

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

- (BOOL) isFavorite:(Art *)art {
    return [self favoriteFromArt:art] != nil;
}


- (NSArray *) favorites {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MOArt"];
    return [_persistentContainer.viewContext executeFetchRequest:request error:nil];
}


- (void) addToFavorite:(Art *)art {
    MOArt *favorite = [NSEntityDescription
                       insertNewObjectForEntityForName:@"MOArt"
                       inManagedObjectContext:_persistentContainer.viewContext];
    
    favorite.title = art.title;
    favorite.desc = art.desc;
    favorite.creator = art.creator;
    favorite.date = art.date;
    favorite.discipline = art.discipline;
    favorite.imagefile = art.imagefile;
    favorite.latitude = art.latitude;
    favorite.longitude = art.longitude;
    favorite.location = art.location;
    
    [self saveContext];
}

- (MOArt *)favoriteFromArt:(Art *)art {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MOArt"];
    request.predicate = [NSPredicate
                         predicateWithFormat:@"title == %@ AND latitude == %@ AND longitude == %@",
                         art.title, art.latitude, art.longitude];
    
    return [[_persistentContainer.viewContext executeFetchRequest:request error:nil] firstObject];
}

- (void) removeFromFavorite:(Art *)art {
    MOArt *favorite = [self favoriteFromArt:art];
    
    if (favorite) {
        [_persistentContainer.viewContext deleteObject:favorite];
        [self saveContext];
    }
}

@end
