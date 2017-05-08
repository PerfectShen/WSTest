//
//  WSLayerViewController.m
//  WSTest
//
//  Created by wangshen on 2017/5/8.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "WSLayerViewController.h"

static NSString *cellIdentifier = @"WSTestIndexLayerCell";


@interface WSLayerViewController ()<UITableViewDelegate,UITableViewDataSource>

/**
 列表
 */
@property (nonatomic, strong) UITableView *tableView;

/**
 数据源数组
 */
@property (nonatomic, strong) NSMutableArray *dataSource;



@end

@implementation WSLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"CALayer";
    [self _createDataSource];
    [self.view addSubview:self.tableView];
    
    
    

}

#pragma mark -  构造数据源

- (void)_createDataSource {
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@{@"title":@"CALayer(父类)",@"class":@"WSLayerOneViewController"},
                             @{@"title":@"CAGradientLayer",@"class":@"WSLayerTwoViewController"},
                             @{@"title":@"CATextLayer",@"class":@"WSLayerThreeViewController"},
                             @{@"title":@"CAShapeLayer",@"class":@"WSLayerFourViewController"},
                             @{@"title":@"CAEmitterLayer",@"class":@"WSLayerFiveViewController"},
                             @{@"title":@"CATransformLayer",@"class":@"WSLayerSixViewController"},nil];
    self.dataSource = array;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSDictionary *dic = self.dataSource[indexPath.row];
    cell.textLabel.text = dic[@"title"];
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = self.dataSource[indexPath.row];
    NSString *className = dic[@"class"];
    if (className && className.length) {
        Class aClass = NSClassFromString(className);
        UIViewController *vc = [[aClass alloc] init];
        if (vc) {
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}


#pragma mark - getter
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _tableView;
}


@end
