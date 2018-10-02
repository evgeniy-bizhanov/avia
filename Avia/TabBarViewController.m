//
//  TabBarViewController.m
//  Avia
//
//  Created by Евгений Бижанов on 02/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "TabBarViewController.h"
#import "ArtsViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ArtsViewController *artsViewController = [ArtsViewController new];
    
    self.viewControllers = @[
                             [[UINavigationController alloc] initWithRootViewController:artsViewController]
                             ];
}

@end
