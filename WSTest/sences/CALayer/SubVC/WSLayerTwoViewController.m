//
//  WSLayerTwoViewController.m
//  WSTest
//
//  Created by wangshen on 2017/5/8.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "WSLayerTwoViewController.h"

@interface WSLayerTwoViewController ()

@end

@implementation WSLayerTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"CAGradientLayer(渐变)";
    
    
    CAGradientLayer *alayer = [[CAGradientLayer alloc] init];
    CGColorRef color1 = [UIColor orangeColor].CGColor;
    CGColorRef color2 = [UIColor grayColor].CGColor;
    alayer.colors = @[(__bridge id)color1,(__bridge id)color2];
    alayer.locations = @[@0.3,@0.7];
    alayer.frame = CGRectMake(0, 64, 200, 200);
    alayer.startPoint = CGPointMake(0, 0);  //绘制颜色的起点
    alayer.endPoint = CGPointMake(1, 1); //绘制颜色的终点  决定渐变色的方向
    [self.view.layer addSublayer:alayer];
    
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
