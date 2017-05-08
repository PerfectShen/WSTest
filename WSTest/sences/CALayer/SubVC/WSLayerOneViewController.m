//
//  WSLayerOneViewController.m
//  WSTest
//
//  Created by wangshen on 2017/5/8.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "WSLayerOneViewController.h"

@interface WSLayerOneViewController ()

@end

@implementation WSLayerOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"CALayer";
    
    CALayer *alayer = [[CALayer alloc] init];
    alayer.frame = CGRectMake(0, 64, 100, 100);
    alayer.backgroundColor = [UIColor orangeColor].CGColor;
    alayer.drawsAsynchronously = YES;
    [self.view.layer addSublayer:alayer];

    
    //    CALayer *blayer = [alayer presentationLayer];
    //    blayer.frame = CGRectMake(101 , 64, 100, 100);
    //    blayer.backgroundColor = [UIColor greenColor].CGColor;
    //    [self.view.layer addSublayer:blayer];
    NSLog(@"%@",NSStringFromCGRect(alayer.contentsRect));
    NSLog(@"%@",alayer.style);
    NSLog(@"%@",[CALayer defaultValueForKey:@"CGPoint"]);
    
    
    
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
