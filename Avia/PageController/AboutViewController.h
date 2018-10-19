//
//  AboutViewController.h
//  Avia
//
//  Created by Евгений Бижанов on 13/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AboutViewController : UIViewController

@property(nonatomic, strong) UILabel *aboutTitle;
@property(nonatomic, strong) UITextView *aboutDescription;
@property(nonatomic, assign) NSInteger index;

- (instancetype)initWithTitle:(NSString *)title forIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
