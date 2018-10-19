//
//  AboutViewController.m
//  Avia
//
//  Created by Евгений Бижанов on 13/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "AboutViewController.h"
#import "../TabBarViewController.h"

@interface AboutViewController ()

@property(nonatomic, strong) UIButton *button;

@end

@implementation AboutViewController

- (instancetype)initWithTitle:(NSString *)title forIndex:(NSInteger)index {
    self = [super init];
    
    if(self) {
        [self initControls];
        
        _index = index;
        _aboutTitle.text = title;
    }
    
    return self;
}

- (void)initControls {
    CGRect frame = self.view.frame;
    self.view.backgroundColor = UIColor.orangeColor;
    
    CGFloat titleHeight = 36;
    CGRect titleFrame = CGRectMake(0, frame.size.height / 3 - titleHeight / 2, frame.size.width, titleHeight);
    _aboutTitle = [[UILabel alloc] initWithFrame:titleFrame];
    _aboutTitle.textAlignment = NSTextAlignmentCenter;
    //    _aboutTitle.text = @"hellog";
    _aboutTitle.textColor = UIColor.whiteColor;
    _aboutTitle.font = [UIFont boldSystemFontOfSize:32];
    
    
    CGFloat margin = 20;
    CGRect descriptionFrame = CGRectMake(margin, CGRectGetMaxY(titleFrame) + margin, frame.size.width - margin * 2, 246);
    _aboutDescription = [[UITextView alloc] initWithFrame:descriptionFrame];
    _aboutDescription.textAlignment = NSTextAlignmentCenter;
    _aboutDescription.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum hendrerit quam sed mauris fermentum congue. Nullam consectetur lectus semper augue efficitur, ac sollicitudin eros condimentum. In turpis nisi, efficitur eget sem vel, pulvinar tristique ante. Quisque egestas consectetur nulla, sit amet ullamcorper leo. Integer fermentum a enim ac laoreet. Nulla eget neque ipsum. Mauris pellentesque dui vitae faucibus fringilla. Interdum.";
    _aboutDescription.backgroundColor = self.view.backgroundColor;
    _aboutDescription.textColor = UIColor.lightTextColor;
    _aboutDescription.font = [UIFont systemFontOfSize:15];
    
    CGFloat width = 120;
    CGFloat height = 20;
    CGRect buttonFrame = CGRectMake(frame.size.width / 2 - width / 2, CGRectGetMaxY(descriptionFrame) + margin, width, height);
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = buttonFrame;
    [_button setTitle:NSLocalizedString(@"AboutClose", nil) forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(mainController:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_aboutTitle];
    [self.view addSubview:_aboutDescription];
    [self.view addSubview:_button];
}

- (void)mainController:(UIButton *)sender {
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
