//
//  SecondTableViewController.m
//  Avia
//
//  Created by Евгений Бижанов on 23.09.2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "SecondTableViewController.h"

@interface SecondTableViewController ()

@property(nonatomic, strong) NSMutableArray *data;

@end

@implementation SecondTableViewController

- (void)fillData {
    _data = [[NSMutableArray alloc] initWithCapacity:30];
    
    for (int i = 0; i < 50; i++) {
        _data[i] = [[NSString alloc] initWithFormat:@"second %d", i + 1];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UITableView";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self fillData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = _data[indexPath.row];
    
    return cell;
}

@end
