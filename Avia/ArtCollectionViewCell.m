//
//  ArtCollectionViewCell.m
//  Avia
//
//  Created by Евгений Бижанов on 02/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "ArtCollectionViewCell.h"

@implementation ArtCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        _image = [[UIImageView alloc] initWithFrame:self.contentView.frame];
    }
    
    return self;
}

@end
