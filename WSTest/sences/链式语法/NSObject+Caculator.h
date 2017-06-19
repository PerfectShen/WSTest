//
//  NSObject+Caculator.h
//  WSTest
//
//  Created by wangshen on 2017/6/1.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSCaculatorMaker.h"


@interface NSObject (Caculator)


+ (int)makeCaculators:(void(^)(WSCaculatorMaker *maker))caculatorMaker;
@end
