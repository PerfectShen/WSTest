//
//  LPRadarBezierPath.h
//  WSTest
//
//  Created by wangshen on 2017/8/28.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPRadarManager : NSObject

/**
 绘制等边五边形的边

 @param center 中心点
 @param length 半径
 @return path
 */
+ (CGPathRef)drawPentagonWithCenter:(CGPoint)center Length:(double)length;

/**
 区域边界线

 @param center 中心点
 @param lengths 半径数组
 @return path
 */
+ (CGPathRef)drawPentagonWithCenter:(CGPoint)center LengthArray:(NSArray *)lengths;

/**
 绘制 顶点实心圆

 @param center 中心点
 @param lengths 半径数组
 @return path
 */
+ (CGPathRef)drawPointWithCenter:(CGPoint )center lengthArray:(NSArray *)lengths;

/**
 根据距离获取 对应的点的数组

 @param lengthArray 长度数组
 @param center 中心点
 @return 点的数组 

 */
+ (NSArray *)converCoordinateFromLength:(NSArray *)lengthArray Center:(CGPoint)center;


/**
 绘制射线

 @param center 中心点
 @param length 半径
 @return 路径
 */
+ (CGPathRef )drawRadialWithCenter:(CGPoint )center length:(double )length;

@end
