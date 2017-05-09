//
//  WSLayerSevenViewController.m
//  WSTest
//
//  Created by wangshen on 2017/5/9.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "WSLayerSevenViewController.h"

@interface WSLayerSevenViewController ()

@end

@implementation WSLayerSevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"CAReplicatorLayer";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //图层容器  添加在其上面的子图层 会根据一定的规律复制出多个子图层
    CAReplicatorLayer *alayer = [[CAReplicatorLayer alloc] init];
    alayer.backgroundColor = [UIColor clearColor].CGColor;
    alayer.frame  = CGRectMake(0, 100, 300, 150);
//    alayer.masksToBounds = YES;
    [self.view.layer addSublayer:alayer];
    
    
    
    CALayer *sublayer1 = [[CALayer alloc] init];
    sublayer1.backgroundColor = [UIColor whiteColor].CGColor;
    sublayer1.frame = CGRectMake(0, 0 , 40, 40);
//    sublayer1.position = CGPointMake(10, 75);
//    sublayer1.cornerRadius = 2;
//    sublayer1.backgroundColor = [UIColor redColor].CGColor;
    [alayer addSublayer:sublayer1];
    
//    
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
//    animation.toValue = @(sublayer1.position.y - 35);
//    animation.duration = 0.5;
//    animation.autoreverses = YES;
//    animation.repeatCount = MAXFLOAT;
//    [sublayer1 addAnimation:animation forKey:@"move"];
    
//
    NSInteger count = 8;
    alayer.instanceCount = count;
//    alayer.instanceDelay = 0.33;
    alayer.instanceTransform = CATransform3DMakeTranslation(50, 0, 50);
    
    float offsetStep = - 1/ (float)count;
    alayer.instanceBlueOffset = offsetStep;
    alayer.instanceGreenOffset = offsetStep;
//    alayer.instanceRedOffset = offsetStep;
    [alayer addSublayer:sublayer1];
    
    CAReplicatorLayer *blayer = [[CAReplicatorLayer alloc] init];
    
    [blayer addSublayer:alayer];
    
    blayer.instanceCount = count;
    blayer.instanceTransform = CATransform3DMakeTranslation(0, 50, 50);
    blayer.instanceRedOffset = offsetStep;
    
    [self.view.layer addSublayer:blayer];
    
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
