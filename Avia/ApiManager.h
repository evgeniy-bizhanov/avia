//
//  ApiManager.h
//  Avia
//
//  Created by Евгений Бижанов on 25/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ApiManager : NSObject

+ (instancetype)sharedInstance;
- (void)country:(void (^)(NSString *countryCode)) completion;
- (void)fetchNews;

@end

NS_ASSUME_NONNULL_END
