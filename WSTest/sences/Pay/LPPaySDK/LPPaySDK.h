//
//  LPPaySDK.h
//  ShuaLian
//
//  Created by wangshen on 2017/6/14.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LPPayOrder.h"
#import "LPPayResult.h"
#import "LPPayProtocol.h"

@interface LPPaySDK : NSObject <LPPayProtocol>


+ (instancetype)sharePaySDK;

@end
