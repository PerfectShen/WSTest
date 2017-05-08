//
//  WSLayerSixViewController.m
//  WSTest
//
//  Created by wangshen on 2017/5/8.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "WSLayerSixViewController.h"

@interface WSLayerSixViewController ()

@end

@implementation WSLayerSixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"CATransformLayer";
    
    
    CATransformLayer *layer = [[CATransformLayer alloc] init];
    layer.frame = CGRectMake(100, 100, 100, 100);
    [self.view.layer addSublayer:layer];
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
