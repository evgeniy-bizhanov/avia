//
//  ViewController.m
//  Avia
//
//  Created by Евгений Бижанов on 18.09.2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "MainViewController.h"
#import "ApiManager.h"
#import "NewsTableViewCell.h"
#import "Entity/Article.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define REUSE_IDENTIFIER @"newsCell"

@interface MainViewController ()

@property(nonatomic, strong) NSArray *news;
//@property(nonatomic, strong) NSMutableArray *heights;

@end

@implementation MainViewController

double heights[20];

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:REUSE_IDENTIFIER];
    
    [ApiManager.sharedInstance fetchNews:^(News * _Nonnull news) {
        self->_news = news.articles;
//        self->_heights = [[NSMutableArray alloc] initWithObjects:0 count:self->_news.count];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER forIndexPath:indexPath];
    
    Article *article = _news[indexPath.row];
    
    cell.title.text = article.title;
    
//    if (article.urlToImage != (NSString *)[NSNull null]) {
//        NSURL *url = [[NSURL alloc] initWithString:article.urlToImage];
//        [cell.articleImageView sd_setImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//            [cell.articleImageView sizeToFit];
//            CGSize size = [cell.articleImageView sizeThatFits:cell.articleImageView.frame.size];
//            CGSize size = [cell.articleImageView sizeThatFits:cell.articleImageView.image.size];
//            CGSize size = [cell.articleImageView sizeThatFits:image.size];
//
//        }];
//    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

@end
