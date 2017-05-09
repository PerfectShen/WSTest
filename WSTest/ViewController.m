//
//  ViewController.m
//  WSTest
//
//  Created by wangshen on 17/1/21.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "ViewController.h"
#define ABC  @"3"
#import "FViewController.h"
#import "AppDelegate.h"
#import "WSFirstViewController.h"





static NSString *cellIdentifier = @"WSTestIndexCell";

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UIView *aView;

/**
 列表
 */
@property (nonatomic, strong) UITableView *tableView;

/**
 数据源数组
 */
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self _createDataSource];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    
    
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti:) name:@"test" object:nil];
//    });
//    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        self.aView = [[UIView alloc] init];
//        self.aView.backgroundColor = [UIColor blueColor];
//        self.aView.frame = CGRectMake(0, 100, 100, 100);
//        [self.view addSubview:self.aView];
//        NSLog(@"%@",[NSThread currentThread]);
//    });
//   
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"跳转" style:UIBarButtonItemStylePlain target:self action:@selector(itemAction:)];
//    self.navigationItem.rightBarButtonItem = item;
    

    
}

- (void)viewWillAppear:(BOOL)animated {

    NSLog(@"%@",ABC);

}

//- (void)itemAction:(UIBarButtonItem *)sender{
//
//    FViewController *vc = [[FViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//}
//- (void)noti:(NSNotification *)noti{
//
//    NSLog(@"%@",[NSThread currentThread]);
//    NSLog(@"shoudao  tongzhi ");
//    self.view.backgroundColor = [UIColor orangeColor];
//}

#pragma mark -  构造数据源

- (void)_createDataSource {

    NSMutableArray *array = [NSMutableArray arrayWithObjects:@{@"title":@"NSString和NSMutableString",@"class":@"WSFirstViewController"},
                             @{@"title":@"线程同步",@"class":@"FViewController"},
                             @{@"title":@"CALayer",@"class":@"WSLayerViewController"},
                             @{@"title":@"CoreGraphics",@"class":@"WSCGViewController"}, nil];
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
