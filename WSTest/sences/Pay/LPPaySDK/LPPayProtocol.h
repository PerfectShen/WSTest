//
//  LPPayProtocol.h
//  ShuaLian
//
//  Created by wangshen on 2017/6/14.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LPPayOrder.h"
#import "LPPayMacro.h"


/**
 支付类所需要实现的方法
 */
@protocol LPPayProtocol <NSObject>

@optional

/**
 支付类所需要实现的协议方法
 
 @param order 订单信息
 @param scheme 调用支付的app注册在info.plist中的scheme
 @param callBack 支付的回调
 */
- (void)payOrder:(LPPayOrder *)order
        callBack:(CompleteionBlock )callBack;

/**
 网页端支付入口
 
 @param orderStr  格式化的订单字符串
 @param schemeStr 调用支付的app注册在info.plist中的scheme
 @param callBack  支付回调
 */
- (void)payUrlOrder:(NSString *)urlString
        channelName:(NSString *)channelName
           callBack:(CompleteionBlock )callBack;

/**
 支付结果的回调
 
 @param url 回调的URL
 @param options 可选参数
 @return 是否处理成功
 */
- (BOOL)handleOpenURL:(NSURL *)url;

@end
