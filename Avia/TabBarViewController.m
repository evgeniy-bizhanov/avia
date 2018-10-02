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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ArtsViewController *artsViewController = [ArtsViewController new];
    
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(50, 50);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    ArtsCollectionViewController *artsCollection = [[ArtsCollectionViewController alloc] initWithCollectionViewLayout:layout];
    
    self.viewControllers = @[
                             [[UINavigationController alloc] initWithRootViewController:artsViewController],
                             [[UINavigationController alloc] initWithRootViewController:artsCollection]
                             ];
}

@end
