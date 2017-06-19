//
//  WSCaculatorMaker.h
//  WSTest
//
//  Created by wangshen on 2017/6/1.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSCaculatorMaker : NSObject

@property (nonatomic, assign) int result;

- (WSCaculatorMaker *(^)(int))add;
- (WSCaculatorMaker *(^)(int))sub;
- (WSCaculatorMaker *(^)(int))muilt;
- (WSCaculatorMaker *(^)(int))divide;

@end
