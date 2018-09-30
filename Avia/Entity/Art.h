//
//  Art.h
//  Avia
//
//  Created by Евгений Бижанов on 29/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Art : NSObject

@property(nonatomic, strong) NSString *creator;
@property(nonatomic, strong) NSString *date;
@property(nonatomic, strong) NSString *desc;
@property(nonatomic, strong) NSString *discipline;
@property(nonatomic, strong) NSString *imagefile;
@property(nonatomic, strong) NSString *latitude;
@property(nonatomic, strong) NSString *longitude;
@property(nonatomic, strong) NSString *location;
@property(nonatomic, strong) NSString *title;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
