//
//  LPPayOrder.h
//  ShuaLian
//
//  Created by wangshen on 2017/6/14.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LPPayConst.h"
#import "LPAliPayModel.h"
#import "LPWeChatPayModel.h"

@protocol LPPayOrderParamsProtocol <NSObject>

@optional
/**
 *  如果使用支付宝通道 需要配置 支付宝的model
 */
@property (nonatomic, strong) LPAliPayModel *aliPayModel;
/**
 *  如果使用微信支付通道 需要配置微信支付model
 */
@property (nonatomic, strong) LPWeChatPayModel *weChatPayModel;

@end

@interface LPPayOrder : NSObject <LPPayOrderParamsProtocol>

/**
 *  订单号
 */
@property (nonatomic, copy) NSString *orderNo;

/**
 购买产品的名字
 */
@property (nonatomic, copy) NSString *productName;

/**
 *  需要支付的金额 （单位为 人民币 分）
 */
@property (nonatomic, copy) NSString *payAmount;

/**
 *  支付通道
 */
@property (nonatomic, copy) NSString *payChannel;




@end
