//
//  ArtCollectionViewCell.h
//  Avia
//
//  Created by Евгений Бижанов on 02/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArtCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong) UILabel *title;
@property(nonatomic, strong) UITextView *subtitle;
@property(nonatomic, assign) CGPoint *coordinate;
@property(nonatomic, strong) UIView *favoriteButton;
@property(nonatomic, assign) BOOL isFavorite;
@property (nonatomic, copy) void (^markAsFavorite)(void);

@end

NS_ASSUME_NONNULL_END
