//
//  NSObject+Caculator.m
//  WSTest
//
//  Created by wangshen on 2017/6/1.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "NSObject+Caculator.h"

@implementation NSObject (Caculator)

+ (int)makeCaculators:(void (^)(WSCaculatorMaker *))caculatorMaker {

    WSCaculatorMaker *maker = [[WSCaculatorMaker alloc] init];
    caculatorMaker(maker);
    return maker.result;
}

@end
