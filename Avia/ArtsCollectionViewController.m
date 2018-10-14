//
//  ArtsCollectionViewController.m
//  Avia
//
//  Created by Евгений Бижанов on 02/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "ArtsCollectionViewController.h"
#import "ApiManager.h"
#import "Entity/Art.h"
#import "Entity/Arts.h"
#import "CoreData/CoreDataManager.h"
#import "ArtCollectionViewCell.h"
#import "FavoritesCollectionViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ArtsCollectionViewController () <UISearchResultsUpdating>

@property(nonatomic, strong) Arts *arts;
@property(nonatomic, strong) NSArray *searchResult;
@property(nonatomic, strong) UISearchController *searchController;

@end

@implementation ArtsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"Search Arts";
    self.collectionView.backgroundColor = UIColor.whiteColor;
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    _searchController.obscuresBackgroundDuringPresentation = NO;
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationItem.searchController = _searchController;
    
    // Register cell classes
    [self.collectionView registerClass:[ArtCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [ApiManager.sharedInstance fetchArts:^(Arts * _Nonnull arts) {
        self->_arts = arts;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }];
    
    UIBarButtonItem *favorites = [[UIBarButtonItem alloc]
                                  initWithTitle:@"Favorites"
                                  style:UIBarButtonItemStylePlain
                                  target:self
                                  action:@selector(favorites:)];
    
    self.navigationItem.rightBarButtonItem = favorites;
}

- (void) favorites:(UIBarButtonItem *)sender {
    FavoritesCollectionViewController *favoritesController = [[FavoritesCollectionViewController alloc]
                                             initWithCollectionViewLayout:self.collectionViewLayout];
    
//    [self presentViewController:favoritesController animated:YES completion:nil];
    [self showViewController:favoritesController sender:nil];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (_searchResult) {
        return _searchResult.count;
    }
    return _arts.array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    __weak ArtCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    Art *art;
    if (_searchResult) {
        art = _searchResult[indexPath.row];
    } else {
        art = _arts.array[indexPath.row];
    }
    
    cell.title.text = art.title;
    cell.subtitle.text = art.desc;
    
    cell.isFavorite = [CoreDataManager.shared isFavorite:art];
    
    cell.markAsFavorite = ^{
        if (cell.isFavorite) {
            [CoreDataManager.shared removeFromFavorite:art];
        } else {
            [CoreDataManager.shared addToFavorite:art];
            [self scheduleNotificationWithTitle:art.title];
        }
        cell.isFavorite = !cell.isFavorite;
    };
    
    CGPoint coordinate = CGPointMake(art.latitude.doubleValue, art.longitude.doubleValue);
    cell.coordinate = &(coordinate);
    
    return cell;
}

- (void)scheduleNotificationWithTitle:(NSString *)title {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:@"Хотите добавить напоминание?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Да" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UNMutableNotificationContent *content = [UNMutableNotificationContent new];
        
        content.title = [NSString localizedUserNotificationStringForKey:title arguments:nil];
        content.body = [NSString localizedUserNotificationStringForKey:@"Добавлено в избранное" arguments:nil];
        content.sound = [UNNotificationSound defaultSound];
        
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"AddFavorite" content:content trigger:trigger];
        
        [UNUserNotificationCenter.currentNotificationCenter addNotificationRequest:request withCompletionHandler:nil];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Нет" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchString = searchController.searchBar.text;
    
    if (searchString.length <= 0) {
        _searchResult = nil;
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.title CONTAINS[cd] %@", searchString];
        _searchResult = [_arts.array filteredArrayUsingPredicate:predicate];
    }
    
    [self.collectionView reloadData];
}

@end
