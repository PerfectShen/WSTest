//
//  MemoryViewController.m
//  WSTest
//
//  Created by wangshen on 2017/8/25.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "MemoryViewController.h"
#import "MemonryModel.h"

@interface MemoryViewController ()

@end

@implementation MemoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    MemonryModel *model = [[MemonryModel alloc] init];
    model.name = @"内存管理";
    model.subModel = [[MemonryModel alloc] init];
    
    MemonryModel *model1 = [model copy];
    
    NSLog(@"%p --- - -%p ---- %p",model,model.name,model.subModel);
    NSLog(@"%p --- - -%p ---- %p",model1,model1.name,model1.subModel);

    
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
