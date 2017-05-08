//
//  WSLayerFiveViewController.m
//  WSTest
//
//  Created by wangshen on 2017/5/8.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "WSLayerFiveViewController.h"

@interface WSLayerFiveViewController ()

@end

@implementation WSLayerFiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"CAEmitterLayer";
    
    CAEmitterLayer *layer = [CAEmitterLayer layer];
    layer.frame = self.view.bounds;
    
    layer.renderMode = kCAEmitterLayerAdditive;
    layer.emitterPosition = CGPointMake(100, 100);
    
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"image.png"].CGImage; // 粒子中的图片
    cell.yAcceleration = 30.f;     // 粒子的初始加速度
    cell.xAcceleration = 10.f;
    cell.zAcceleration =50.f;
    cell.birthRate = 5.f;           // 每秒生成粒子的个数
    cell.lifetime = 6.f;            // 粒子存活时间
    cell.alphaSpeed = -0.3f;        // 粒子消逝的速度
    cell.velocity = 30.f;           // 粒子运动的速度均值
    cell.velocityRange = 30.f;      // 粒子运动的速度扰动范围
    cell.emissionRange = M_PI * 10.f; // 粒子发射角度, 这里是一个扇形.
    cell.scale = 0.1;   //粒子的缩放
        
    
    // add particle template to emitter
    layer.emitterCells = @[cell]; // 将粒子组成的
    layer.lifetime = 10;
    
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
