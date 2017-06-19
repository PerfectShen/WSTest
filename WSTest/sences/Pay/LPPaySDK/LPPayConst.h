//
//  LPPayConst.h
//  ShuaLian
//
//  Created by wangshen on 2017/6/14.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LPPayMacro.h"

@interface LPPayConst : NSObject

//支付通道
UIKIT_EXTERN LPPayChannelName const LPPayChannelNameShuaLian;
UIKIT_EXTERN LPPayChannelName const LPPayChannelNameBankCard;
UIKIT_EXTERN LPPayChannelName const LPPayChannelNameWeChat;
UIKIT_EXTERN LPPayChannelName const LPPayChannelNameAliPay;

@end
