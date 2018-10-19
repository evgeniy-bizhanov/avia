//
//  ApiManager.m
//  Avia
//
//  Created by Евгений Бижанов on 25/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

// Name             learning-app
// Description      learning app
//
// App Token        tcEJZw0kRyhY0aK1RsFxodLMB
// Secret Token     5SIt6zYnC9IV5vip2rR26YHd3agDeoNurwH3

#import "ApiManager.h"
#import "Entity/Arts.h"

#define WHERE_AM_I @"https://ipinfo.io"
#define API_URL @"https://data.honolulu.gov/resource/csir-pcj2.json"

@implementation ApiManager

+ (instancetype)sharedInstance {
    static ApiManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ApiManager alloc] init];
    });
    
    return instance;
}

- (void)fetchArts:(void (^)(Arts *arts)) completion {
    [self country:^(NSString * _Nonnull countryCode) {
        [self load:API_URL withCompletion:^(id  _Nullable result) {
            Arts *arts = [[Arts alloc] initWithDictionary:result];
            completion(arts);
        }];
    }];
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
