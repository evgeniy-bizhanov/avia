//
//  FavoritesCollectionViewController.m
//  Avia
//
//  Created by Евгений Бижанов on 10/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "FavoritesCollectionViewController.h"
#import "ArtCollectionViewCell.h"
#import "CoreData/CoreDataManager.h"

@interface FavoritesCollectionViewController ()

@property(nonatomic, strong) NSArray *array;

@end

@implementation FavoritesCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Favorites";
    
    self.collectionView.backgroundColor = UIColor.whiteColor;
    _array = [CoreDataManager.shared favorites];
    
    [self.collectionView registerClass:[ArtCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ArtCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    MOArt *art = _array[indexPath.row];
    // Configure the cell
    [cell.favoriteButton setHidden:YES];
    cell.title.text = art.title;
    cell.subtitle.text = art.desc;
    
    CGPoint coordinate = CGPointMake(art.latitude.doubleValue, art.longitude.doubleValue);
    cell.coordinate = &(coordinate);
    
    return cell;
}

@end
