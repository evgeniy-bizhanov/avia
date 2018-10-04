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
#import "ArtCollectionViewCell.h"

@interface ArtsCollectionViewController () <UISearchResultsUpdating>

@property(nonatomic, strong) Arts *arts;
@property(nonatomic, strong) NSArray *searchResult;
@property(nonatomic, strong) UISearchController *searchController;

@end

@implementation ArtsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Search Arts";
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
    ArtCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    Art *art;
    if (_searchResult) {
        art = _searchResult[indexPath.row];
    } else {
        art = _arts.array[indexPath.row];
    }
    
    cell.title.text = art.title;
    cell.subtitle.text = art.desc;
    
    CGPoint coordinate = CGPointMake(art.latitude.doubleValue, art.longitude.doubleValue);
    cell.coordinate = &(coordinate);
    
    return cell;
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
