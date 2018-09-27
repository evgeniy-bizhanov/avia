//
//  NewsTableViewCell.m
//  Avia
//
//  Created by Евгений Бижанов on 26/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "NewsTableViewCell.h"

@interface NewsTableViewCell()



@end

@implementation NewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _title = [[UILabel alloc] initWithFrame:CGRectZero];
        [_title setFont:[UIFont boldSystemFontOfSize:15]];
        
        [self.contentView addSubview:_title];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat margin = 16;
    CGSize containerSize = self.contentView.frame.size;

//    CGFloat height = 20;
    CGRect frame = CGRectMake(
                              margin,
                              0,
                              containerSize.width - 2 * margin,
                              containerSize.height);

    _title.frame = frame;
}

@end
