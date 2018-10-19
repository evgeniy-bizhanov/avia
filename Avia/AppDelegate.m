//
//  AppDelegate.m
//  Avia
//
//  Created by Евгений Бижанов on 18.09.2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "PageController/PageViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate () <UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CGRect frame = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame:frame];

    UIViewController *viewController = [TabBarViewController new];
    
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    
    BOOL aboutWasShown = [NSUserDefaults.standardUserDefaults boolForKey:@"AboutWasShown"];
    if(!aboutWasShown) {
        [NSUserDefaults.standardUserDefaults setBool:true forKey:@"AboutWasShown"];
        [viewController showViewController:[PageViewController new] sender:nil];
    }
    
    [UNUserNotificationCenter.currentNotificationCenter
     requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionSound
     completionHandler:^(BOOL granted, NSError * _Nullable error) {
         if (granted) {
             UNUserNotificationCenter.currentNotificationCenter.delegate = self;
         }
     }];
    
    return YES;
}

@end
