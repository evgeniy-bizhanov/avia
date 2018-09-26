//
//  ApiManager.m
//  Avia
//
//  Created by Евгений Бижанов on 25/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "ApiManager.h"

#define WHERE_AM_I @"https://ipinfo.io"

#define API_TOKEN @"771f778018c44722ab3af6c282ff74bf"
#define API_URL @"https://newsapi.org/v2/top-headlines?country=%@&apiKey=%@";

@implementation ApiManager

+ (instancetype)sharedInstance {
    static ApiManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ApiManager alloc] init];
    });
    
    return instance;
}

- (void)fetchNews {
    
}

- (void)country:(void (^)(NSString *countryCode)) completion {

    [self load:WHERE_AM_I withCompletion:^(id  _Nullable result) {
        NSDictionary *json = result;
        
        NSString *countryCode = [json valueForKey:@"country"];
        if (countryCode) {
            completion(countryCode);
        }
    }];
}

- (void)load:(NSString *)urlString withCompletion:(void (^)(id _Nullable result))completion {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    });
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
        
        completion(
                   [NSJSONSerialization
                    JSONObjectWithData:data
                    options:NSJSONReadingMutableContainers
                    error:nil]
                   );
    }] resume];
}

@end
