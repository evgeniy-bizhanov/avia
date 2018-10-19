//
//  TabBarViewController.m
//  Avia
//
//  Created by Евгений Бижанов on 02/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "TabBarViewController.h"
#import "ArtsViewController.h"
#import "ArtsCollectionViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

// MARK: - Фабрики табов

- (ArtsViewController *)resolveArtsController {
    ArtsViewController *controller = [ArtsViewController new];
    controller.title = NSLocalizedString(@"ArtTitle", nil);
    return controller;
}

- (ArtsCollectionViewController *)resolveArtsCollectionController {
    double cellSpacing = 10;
    double cellMargin = 10;
    
    double width = floor(self.view.frame.size.width / 2 - cellSpacing / 2 - cellMargin);
    double height = width;
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(width, height);
    layout.minimumLineSpacing = cellSpacing;
    layout.minimumInteritemSpacing = cellSpacing;
    layout.sectionInset = UIEdgeInsetsMake(cellMargin, cellMargin, cellMargin, cellMargin);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    ArtsCollectionViewController *controller = [[ArtsCollectionViewController alloc] initWithCollectionViewLayout:layout];
    controller.title = NSLocalizedString(@"ArtSearch", nil);
    
    return controller;
}


// MARK: - Инициализатор

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ArtsViewController * artsViewController = [self resolveArtsController];
    ArtsCollectionViewController * artsCollection = [self resolveArtsCollectionController];
    
    self.viewControllers = @[
                             [[UINavigationController alloc] initWithRootViewController:artsViewController],
                             [[UINavigationController alloc] initWithRootViewController:artsCollection]
                             ];
}

@end
