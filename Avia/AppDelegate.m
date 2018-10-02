//
//  AppDelegate.m
//  Avia
//
//  Created by Евгений Бижанов on 18.09.2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CGRect frame = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame:frame];
    
    self.window.backgroundColor = UIColor.redColor;
    
    TabBarViewController *viewController = [[TabBarViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
//    self.window.rootViewController = navigationController;
    
    self.window.rootViewController = viewController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
