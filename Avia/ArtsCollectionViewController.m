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

@interface ArtsCollectionViewController ()

@property(nonatomic, strong) Arts *arts;

@end

@implementation ArtsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Table Arts";
    self.collectionView.backgroundColor = UIColor.whiteColor;
    
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
    return _arts.array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ArtCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    Art *art = _arts.array[indexPath.row];
    
    cell.title.text = art.title;
    cell.subtitle.text = art.desc;
    
    CGPoint coordinate = CGPointMake(art.latitude.doubleValue, art.longitude.doubleValue);
    cell.coordinate = &(coordinate);
    
    return cell;
}

@end
