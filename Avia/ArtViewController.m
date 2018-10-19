//
//  ArtViewController.m
//  Avia
//
//  Created by Евгений Бижанов on 30/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "ArtViewController.h"
#import "Helper/Geo.h"

@interface ArtViewController ()

@property(nonatomic, strong) Art *art;
@property(nonatomic, strong) UITextView *subtitle;

@end

@implementation ArtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _art.title;
    
    _subtitle = [[UITextView alloc] initWithFrame:self.view.frame];
    
    UIFont *font = [UIFont systemFontOfSize:15];
    _subtitle.font = font;
    
    [self.view addSubview:_subtitle];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:_art.latitude.doubleValue longitude:_art.longitude.doubleValue];
    
    [Geo addressFromLocation:location completion:^(CLPlacemark * _Nonnull placemark) {
        self->_subtitle.text = placemark.description;
    }];
}

- (instancetype)initWithArt:(Art *) art {
    self = [super init];
    
    if (self) {
        _art = art;
    }
    
    return self;
}

@end
