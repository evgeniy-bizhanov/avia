//
//  Source.h
//  Avia
//
//  Created by Евгений Бижанов on 26/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//NS_ROOT_CLASS // disable the root class warning

@interface Source : NSObject

@property(nonatomic, strong) NSString *identifier;
@property(nonatomic, strong) NSString *name;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
