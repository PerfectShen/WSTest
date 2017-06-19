//
//  WSChainViewController.m
//  WSTest
//
//  Created by wangshen on 2017/6/1.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "WSChainViewController.h"
#import "NSObject+Caculator.h"

@interface WSChainViewController ()

@end

@implementation WSChainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"链式语法";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    int result = [NSObject makeCaculators:^(WSCaculatorMaker *maker) {
        maker.add(5).muilt(2).sub(6);
    }];
    
    NSLog(@"%d",result);
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
