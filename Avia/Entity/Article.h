//
//  Article.h
//  Avia
//
//  Created by Евгений Бижанов on 26/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Source.h"

NS_ASSUME_NONNULL_BEGIN
//NS_ROOT_CLASS // disable the root class warning

@interface Article : NSObject

@property(nonatomic, strong) Source *source;
@property(nonatomic, strong) NSString *author;
@property(nonatomic, strong) NSString *title;

// Как это обойти, не переименовывая свойство?
//
// Auto property synthesis will not synthesize property 'description' because it is 'readwrite' but it will be synthesized 'readonly' via another property
//
// Пробовал сделать root класс, но не разобрался как его инициализировать, такой вариант для Entity объекта
// кстати был бы предпочтителен, т.к. сущность должна обладать только тем, чем должна, ей не нужно наследовать
// 100500 свойств и методов от NSObject

@property(nonatomic, strong) NSString *shortDesc;
@property(nonatomic, strong) NSString *url;
@property(nonatomic, strong) NSString *urlToImage;
@property(nonatomic, strong) NSString *publishedAt;
@property(nonatomic, strong) NSString *content;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
