//
//  LPRadarChartView.m
//  WSTest
//
//  Created by wangshen on 2017/8/28.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "LPRadarChartView.h"
#import "LPRadarManager.h"

@interface LPRadarChartView ()

/**
 绘制数据的layer 的数组 二维数组
 */
@property (nonatomic, strong) NSMutableArray *valueLayerArray;

@end

@implementation LPRadarChartView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.valueLayerArray = [NSMutableArray array];
        self.isEquleRatio = YES;
    }
    return self;
}
- (void)drawBasicRadarChart {

    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    if (width < (self.maxRadius + 8 + 15) * 2) {
        width = (self.maxRadius + 8 + 15) * 2;
        height = width;
    }
    self.bounds = CGRectMake(0, 0, width, height);
    
    CGPoint center = CGPointMake(width/2, height/2);
    
    for (NSInteger i = 1; i <= self.pliesCount; i ++) {
        CGFloat length = i * self.maxRadius/(double)self.pliesCount;
        
        CGPathRef path = [LPRadarManager drawPentagonWithCenter:center Length:length];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path;
        layer.fillColor = nil;//;
        layer.lineWidth = 1/[UIScreen mainScreen].scale;
        layer.strokeColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1].CGColor;
        [self.layer addSublayer:layer];
    }
    
    //绘制射线
    CGPathRef radialPath = [LPRadarManager drawRadialWithCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) length:75.3];
    CAShapeLayer *radialLayer = [CAShapeLayer layer];
    radialLayer.path = radialPath;
    radialLayer.fillColor = nil;//;
    radialLayer.lineWidth = 1/[UIScreen mainScreen].scale;
    radialLayer.strokeColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1].CGColor;
    [self.layer addSublayer:radialLayer];
    
    NSNumber *labelRadius = [NSNumber numberWithDouble:self.maxRadius + 15];
    NSArray *points = [LPRadarManager converCoordinateFromLength:@[labelRadius,labelRadius,labelRadius,labelRadius,labelRadius] Center:center];
    NSArray *titles = self.titleArray;
    NSInteger count = points.count;
    for (NSInteger i = 0; i < count; i ++) {
        NSString *title = titles[i];
        CGPoint point = [points[i] CGPointValue];
        CATextLayer *textLayer = [[CATextLayer alloc] init];
        textLayer.frame = CGRectMake(point.x - 30, point.y - 10, 60, 20);
        textLayer.string = title;
        textLayer.fontSize = 13;
        textLayer.alignmentMode = kCAAlignmentCenter;
        textLayer.contentsScale = [UIScreen mainScreen].scale;
        textLayer.foregroundColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1].CGColor;
        [self.layer addSublayer:textLayer];
    }
}

- (void)drawValueWithstoreColor:(UIColor *)storeColor fillColor:(UIColor *)fillColor valueArray:(NSArray<NSNumber *> *)valueArray {
    
    NSMutableArray *layers = [NSMutableArray array];
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.width/2);
    NSMutableArray *radiusArray = [NSMutableArray array];
    for (NSNumber *number in valueArray) {
        double score = [number doubleValue];
        double radius = score/self.standardValue * self.maxRadius;
        NSNumber *radiusNumber = [NSNumber numberWithDouble:radius];
        [radiusArray addObject:radiusNumber];
    }
    CGPathRef path5 = [LPRadarManager drawPentagonWithCenter:center LengthArray:radiusArray];
    CAShapeLayer *layer5 = [CAShapeLayer layer];
    layer5.path = path5;
    layer5.fillColor = fillColor.CGColor;
    layer5.lineWidth = 1;
    layer5.strokeColor = storeColor.CGColor;
    [self.layer addSublayer:layer5];
    
    CGPathRef path5_1 = [LPRadarManager drawPointWithCenter:center lengthArray:radiusArray];
    CAShapeLayer *layer5_1 = [CAShapeLayer layer];
    layer5_1.path = path5_1;
    layer5_1.fillColor = storeColor.CGColor;
    layer5_1.lineWidth = 1;
    layer5_1.strokeColor = storeColor.CGColor;
    [self.layer addSublayer:layer5_1];
    
    [layers addObject:layer5];
    [layers addObject:layer5_1];
    [self.valueLayerArray addObject:layers];
}

- (void)clearValueChart {
    NSArray *tempArray = [NSArray arrayWithArray:self.valueLayerArray];
    for (NSArray *subArray in tempArray) {
        for (CALayer *tmpLayer in subArray) {
            [tmpLayer removeFromSuperlayer];
        }
    }
    [self.valueLayerArray removeAllObjects];
}

@end
