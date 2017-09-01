//
//  LPRadarChartView.h
//  WSTest
//
//  Created by wangshen on 2017/8/28.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPRadarChartView : UIView


/**
 维度  // 默认5
 */
@property (nonatomic, assign) NSInteger dimensionCount;

/**
 图的最大半径 中心点 到 某一个对角线之间的 距离
 */
@property (nonatomic, assign) CGFloat maxRadius;

/**
 最大长度代表的值 （基准值） 默认 1
 */
@property (nonatomic, assign) float standardValue;

/**
 蜘蛛图 每个维度划分的单位数
 */
@property (nonatomic, assign) NSInteger pliesCount;

/**
 是否等分 默认 YES
 */
@property (nonatomic, assign) BOOL isEquleRatio;

/**
 如果不等分 设置每个单位的长度  如果等分 则不用设置
 */
@property (nonatomic, strong) NSArray *subRadiusArray;


/**
 每个维度代表的含义
 */
@property (nonatomic, strong) NSArray<NSString *> *titleArray;




/**
 绘制 五维图的背景
 */
- (void)drawBasicRadarChart;


/**
 绘制数据  数组中的值 比上 standardValue  得到在图上每个维度的长度
 */
- (void)drawValueWithstoreColor:(UIColor *)storeColor fillColor:(UIColor *)fillColor valueArray:(NSArray<NSNumber *> *)valueArray;


/**
 清空
 */
- (void)clearValueChart;

@end
