//
//  ViewController.m
//  Avia
//
//  Created by Евгений Бижанов on 18.09.2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "SomeViewController.h"

@interface SomeViewController ()

@end

@implementation SomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.cyanColor;
    
    UILabel *label = [self makeLabel:@"Another screen"];
    [self.view addSubview:label];
}

- (UILabel *)makeLabel:(NSString *)text {
    
    CGRect frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100,
                              [UIScreen mainScreen].bounds.size.height/2 - 25,
                              200,
                              50);
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:24 weight:UIFontWeightBold];
    label.textColor = UIColor.blueColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = text;
    
    return label;
}

@end
