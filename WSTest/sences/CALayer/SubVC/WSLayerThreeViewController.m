//
//  WSLayerThreeViewController.m
//  WSTest
//
//  Created by wangshen on 2017/5/8.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "WSLayerThreeViewController.h"

@interface WSLayerThreeViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) CADisplayLink *link;

@property (nonatomic, strong) CATextLayer *textlayer;

@end

@implementation WSLayerThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"CATextLayer";
    
    CATextLayer *alayer = [[CATextLayer alloc] init];
    alayer.backgroundColor = [UIColor orangeColor].CGColor;
    alayer.frame = CGRectMake(0, 64,200, 300);
    [self.view.layer addSublayer:alayer];
    
    //设置文字的颜色
    alayer.foregroundColor = [UIColor blueColor].CGColor;
    //设置字体大小
    alayer.fontSize = 20;
    //默认为NO 当设置为YES的时候 文字绘制在layer的范围之内
    alayer.wrapped = YES;
    //文字的对齐方式  （目前是左右对齐）
    alayer.alignmentMode = kCAAlignmentJustified;
    alayer.allowsFontSubpixelQuantization = YES;
    alayer.contentsScale = [UIScreen mainScreen].scale;
    alayer.string = @"这是一段d文字，一段比较长ss的文d字这是一段ss文字，一段比s较长d的ss文字这是一段文s字，一段比d较长的文字";
    self.textlayer = alayer;
    
    
    //CADisplayLink是一个能让我们以和屏幕刷新率相同的频率将内容画到屏幕上的定时器。我们在应用中创建一个新的 CADisplayLink 对象，把它添加到一个runloop中，并给它提供一个 target 和selector 在屏幕刷新的时候调用。
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(linkAction:)];
    self.link.paused = NO;
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    self.link.frameInterval = 30;
    
//    CABasicAnimation *animationCircle = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
//    
//    animationCircle.delegate = self;
//    animationCircle.fromValue = (id)[UIColor orangeColor].CGColor;
//    animationCircle.toValue = (id)[UIColor grayColor].CGColor;
//    animationCircle.duration = 2;
//    animationCircle.removedOnCompletion = YES;
//    [alayer addAnimation:animationCircle forKey:@"circle"];
//    
//    [self.view.layer addSublayer:alayer];
    
}

- (void)linkAction:(CADisplayLink *)link {
    
    NSLog(@"---%f",link.duration);
    self.textlayer.string = [NSString stringWithFormat:@"%.0f",1/link.duration];
}

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
    [self.link invalidate];
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
