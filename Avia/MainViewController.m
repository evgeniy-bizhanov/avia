//
//  ViewController.m
//  Avia
//
//  Created by Евгений Бижанов on 18.09.2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "MainViewController.h"
#import "SecondTableViewController.h"

@interface MainViewController () <UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIButton *button;
@property(nonatomic, strong) NSMutableArray *data;

@end

@implementation MainViewController

- (CGRect)safeAreaFrame {
    
    CGRect frame = self.view.frame;
    
    UIEdgeInsets insets = UIApplication.sharedApplication.keyWindow.safeAreaInsets;
    frame.origin.x += insets.left;
    frame.origin.y += insets.top;
    frame.size.width -= insets.left + insets.right;
    frame.size.height -= insets.top + insets.bottom;
    
    return frame;
}

- (void)fillData {
    _data = [[NSMutableArray alloc] initWithCapacity:30];
    
    for (int i = 0; i < 50; i++) {
        _data[i] = [[NSString alloc] initWithFormat:@"cell %d", i + 1];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fillData];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.46 green:0.84 blue:1.0 alpha:1.0];
    self.title = @"UIView";
    
    // tableView
    
    CGRect tableFrame = [self safeAreaFrame];
    tableFrame.size.height = tableFrame.size.height - 44;

    _tableView = [self createTableView:tableFrame];
    
    // button
    
    CGRect buttonFrame = [self safeAreaFrame];
    buttonFrame.origin.y = CGRectGetMaxY(buttonFrame) - 44;
    buttonFrame.size.height = 44;
    
    _button = [self createNextButton:buttonFrame];
    [_button addTarget:self action:@selector(nextScreen:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_tableView];
    [self.view addSubview:_button];
}


// MARK: - Transitions

- (void)nextScreen:(UIButton *)sender {
    SecondTableViewController *secondController = [[SecondTableViewController alloc] init];
    [self.navigationController pushViewController:secondController animated:YES];
}


// MARK: - Create UI elements

- (UITableView *)createTableView:(CGRect)frame {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    return tableView;
}

- (UIButton *) createNextButton:(CGRect)frame {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Go to Next" forState:UIControlStateNormal];
    button.frame = frame;
    button.tintColor = UIColor.whiteColor;
    
    return button;
}


// MARK: - DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = _data[indexPath.row];
    
    return cell;
}

@end
