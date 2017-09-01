//
//  RadarChartViewController.m
//  WSTest
//
//  Created by wangshen on 2017/8/28.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "RadarChartViewController.h"
#import "LPRadarChartView.h"

@interface RadarChartViewController ()

@end

@implementation RadarChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"雷达图";
    self.view.backgroundColor = [UIColor whiteColor];
    
    LPRadarChartView *view = [[LPRadarChartView alloc] init];
    view.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    view.pliesCount = 5;
    view.maxRadius = 100;
    view.standardValue = 10;
    view.titleArray = @[@"攻击",@"防御",@"难度",@"速度",@"力量"];
    [view drawBasicRadarChart];
    [view drawValueWithstoreColor:[UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1] fillColor:[UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:0.2] valueArray:@[@1,@5,@9,@3,@6]];
    [self.view addSubview:view];
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
