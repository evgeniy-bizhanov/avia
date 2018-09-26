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

#define REUSE_IDENTIFIER @"newsCell"

@interface MainViewController ()

@property(nonatomic, strong) NSArray *news;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:REUSE_IDENTIFIER];
    
    [ApiManager.sharedInstance fetchNews:^(News * _Nonnull news) {
        self->_news = news.articles;
        
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
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

@end
