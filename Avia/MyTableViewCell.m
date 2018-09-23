//
//  MyTableViewCell.m
//  Avia
//
//  Created by Евгений Бижанов on 23.09.2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_label];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat margin = 16;
    CGSize containerSize = self.contentView.frame.size;
    
    CGFloat height = 20;
    CGRect frame = CGRectMake(
                              margin,
                              containerSize.height / 2 - height / 2,
                              containerSize.width - 2 * margin,
                              height);
    
    _label.frame = frame;
}

@end
