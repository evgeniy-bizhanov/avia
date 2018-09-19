//
//  ViewController.m
//  Avia
//
//  Created by Евгений Бижанов on 18.09.2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *button = [self makeButton:@"Go to next screen"];
    [button addTarget:self action:@selector(nextScreen:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (UIButton *)makeButton:(NSString *)title {
    
    CGRect frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100,
                              [UIScreen mainScreen].bounds.size.height/2 - 25,
                              200,
                              50);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    button.frame = frame;
    button.tintColor = UIColor.whiteColor;
    
    return button;
}

- (void)nextScreen:(UIButton *)sender {
    
//    [self.navigationController pushViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#>]
}

@end
