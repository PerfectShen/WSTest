//
//  RLViewController.m
//  WSTest
//
//  Created by wangshen on 2017/6/23.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "RLViewController.h"

@interface RLViewController ()

@end

@implementation RLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Runloop";
    
    NSLog(@"currentRunLoop :%@ ---- mainRunLoop :%@   ---- %@",[NSRunLoop currentRunLoop],[NSRunLoop mainRunLoop],[NSRunLoop currentRunLoop].currentMode);
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
