//
//  ArtCollectionViewCell.m
//  Avia
//
//  Created by Евгений Бижанов on 02/10/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "ArtCollectionViewCell.h"
#import <MapKit/MapKit.h>

@interface ArtCollectionViewCell ()

@property(nonatomic, strong) MKMapView *mapView;
@property(nonatomic, strong) UIView *aboutView;
@property(nonatomic, strong) UIVisualEffectView *blurView;

@end

@implementation ArtCollectionViewCell

- (void)setIsFavorite:(BOOL)isFavorite {
    _isFavorite = isFavorite;
    
    [UIView animateWithDuration:.3 animations:^{
        if (isFavorite) {
            self->_favoriteButton.backgroundColor = [UIColor colorWithRed:0.35 green:0.59 blue:0.82 alpha:0.9];
            self->_favoriteButton.layer.borderColor = [[UIColor colorWithRed:0.3 green:0.5 blue:0.72 alpha:1.0] CGColor];
        } else {
            self->_favoriteButton.backgroundColor = [UIColor colorWithRed:0.95 green:0.98 blue:1.0 alpha:0.9];
            self->_favoriteButton.layer.borderColor = [[UIColor colorWithRed:0.42 green:0.72 blue:0.93 alpha:1.0] CGColor];
        }
    }];
}


// MARK: - Позиционирование карты

- (void)setCoordinate:(CGPoint *)coordinate {
    _coordinate = coordinate;
    
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(_coordinate->x, _coordinate->y);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 200, 200);
    [_mapView setRegion:region animated:NO];
    
    MKPointAnnotation *annotation = [MKPointAnnotation new];
    annotation.coordinate = CLLocationCoordinate2DMake(
                                                       _coordinate->x,
                                                       _coordinate->y);
    
    [_mapView addAnnotation:annotation];
}


// MARK: - Настройка UI компонентов

- (void)setupSelf {
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = true;
    self.layer.borderColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0].CGColor;
    self.layer.borderWidth = 0.5f;
}

- (void)setupMapView {
    _mapView = [[MKMapView alloc] initWithFrame:self.contentView.frame];
    _mapView.zoomEnabled = false;
    _mapView.scrollEnabled = false;
    _mapView.userInteractionEnabled = false;
}

- (void)setupBlurView:(const CGRect *)aboutFrame {
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    _blurView = [[UIVisualEffectView alloc] initWithFrame:*aboutFrame];
    _blurView.effect = blurEffect;
}

- (void)setupTitle:(const CGRect *)aboutFrame {
    CGFloat height = 12;
    CGFloat titleMargins = 5;
    
    CGRect frame = CGRectMake(titleMargins, titleMargins, aboutFrame->size.width - 2 * titleMargins, height);
    _title = [[UILabel alloc] initWithFrame:frame];
    _title.textAlignment = NSTextAlignmentLeft;
    _title.font = [UIFont boldSystemFontOfSize:height];
}

- (void)setupSubtitle:(const CGRect *)aboutFrame {
    CGFloat height = 12;
    CGFloat titleMargins = 5;
    
    CGRect subtitleFrame = *aboutFrame;
    subtitleFrame.origin.y = height;
    subtitleFrame.size.height -= height + titleMargins;
    
    _subtitle = [[UITextView alloc] initWithFrame:subtitleFrame];
    _subtitle.backgroundColor = UIColor.clearColor;
    _subtitle.userInteractionEnabled = false;
}

- (CGRect)calculateAboutFrame {
    CGFloat aboutX = 0;
    CGFloat aboutY = ceil(0.6 * CGRectGetMaxY(self.contentView.frame));
    CGFloat aboutWidth = CGRectGetMaxX(self.contentView.frame);
    CGFloat aboutHeight = floor(0.4 * CGRectGetMaxY(self.contentView.frame));
    
    CGRect aboutFrame = CGRectMake(aboutX, aboutY, aboutWidth, aboutHeight);
    return aboutFrame;
}


- (void)setupFavoriteButton {
    CGRect frame = CGRectMake(10, 10, 30, 30);
    _favoriteButton = [[UIView alloc] initWithFrame:frame];
    _favoriteButton.layer.cornerRadius = 15;
    _favoriteButton.layer.borderWidth = 1;
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addFavorite:)];
    [_favoriteButton addGestureRecognizer:recognizer];
}

- (void)addFavorite:(UITapGestureRecognizer *)sender {
    _markAsFavorite();
}

// MARK: - Инициализатор

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        CGRect aboutFrame = [self calculateAboutFrame];
        
        [self setupSelf];
        [self setupMapView];
        [self setupBlurView:&aboutFrame];
        [self setupTitle:&aboutFrame];
        [self setupSubtitle:&aboutFrame];
        [self setupFavoriteButton];
        
        [_blurView.contentView addSubview:_title];
        [_blurView.contentView addSubview:_subtitle];
        
        [self.contentView addSubview:_mapView];
        [self.contentView addSubview:_blurView];
        [self.contentView addSubview:_favoriteButton];
    }
    
    return self;
}

@end
