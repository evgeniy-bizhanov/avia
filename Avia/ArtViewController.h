//
//  ArtViewController.h
//  Avia
//
//  Created by Евгений Бижанов on 30/09/2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entity/Art.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArtViewController : UIViewController

- (instancetype)initWithArt:(Art *) art;

@end

NS_ASSUME_NONNULL_END
