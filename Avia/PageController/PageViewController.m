//
//  PageViewController.m
//  Avia
//
//  Created by Евгений Бижанов on 14/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "PageViewController.h"
#import "AboutViewController.h"

@interface PageViewController ()

@property(nonatomic, strong) NSArray *contentArray;

@end

@implementation PageViewController

- (instancetype) init {
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                    navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                  options:nil];
    
    if(self) {
        _contentArray = @[
                          NSLocalizedString(@"AboutHello", nil),
                          NSLocalizedString(@"AboutWorld", nil),
                          @"!"
                          ];
        self.dataSource = self;
        
        AboutViewController *firstController = [self aboutViewControllerAtIndex:0];
        [self setViewControllers:@[firstController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
    
    return self;
}

- (AboutViewController *) aboutViewControllerAtIndex:(NSInteger) index {
    if (index < 0 || index >=_contentArray.count) {
        return nil;
    }
    
    
    return [[AboutViewController alloc] initWithTitle:_contentArray[index] forIndex:index];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.orangeColor;
}

// MARK: - UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = ((AboutViewController *)viewController).index + 1;
    return [self aboutViewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = ((AboutViewController *)viewController).index - 1;
    return [self aboutViewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return _contentArray.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

@end
