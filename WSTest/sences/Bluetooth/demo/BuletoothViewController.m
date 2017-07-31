//
//  BuletoothViewController.m
//  WSTest
//
//  Created by wangshen on 2017/7/31.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "BuletoothViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface BuletoothViewController ()<CBCentralManagerDelegate>

@property (nonatomic ,strong) CBCentralManager *bleManager;

@end

@implementation BuletoothViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"蓝牙";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"搜索蓝牙" forState:UIControlStateNormal];
    button.frame = CGRectMake(20, 100, self.view.frame.size.width - 40, 44);
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //创建蓝牙
    self.bleManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
}

- (void)buttonAction:(UIButton *)sender {

    [self.bleManager scanForPeripheralsWithServices:nil options:nil];
}

#pragma mark - CBCentralManagerDelegate
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {

//    central.state
    
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *, id> *)advertisementData RSSI:(NSNumber *)RSSI {
    NSLog(@"%@ ---  %@ ---- advertisementData:%@",peripheral.name,RSSI,advertisementData);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
