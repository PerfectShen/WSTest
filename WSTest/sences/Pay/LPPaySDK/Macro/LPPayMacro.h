//
//  LPPayMacro.h
//  ShuaLian
//
//  Created by wangshen on 2017/6/13.
//  Copyright © 2017年 EvanCai. All rights reserved.
//


#ifndef LPPayMacro_h
#define LPPayMacro_h

#import "LPPayResult.h"


//cell的标记
#define Pay_Yue @"Pay_Yue"                  //余额支付
#define Pay_Yinhangka @"Pay_Yinhangka"      //银行卡支付
#define Pay_Weixin @"Pay_Weixin"            //微信支付
#define Pay_Zhifubao @"Pay_Zhifubao"        //支付宝支付



typedef NSString *LPPayChannelName NS_EXTENSIBLE_STRING_ENUM;


typedef void(^CompleteionBlock)(LPPayResult *);



//日志输出
#if DEBUG
#define PayLog(format,...) NSLog(@" %s+%d " format,__func__,__LINE__,##__VA_ARGS__)
#else
#define PayLog(format,...)
#endif


#define PayWeakSelf typeof(self) __weak weakSelf = self;
#define PayStrongSelf typeof(weakSelf) __strong strongSelf = weakSelf;

#endif /* LPPayMacro_h */
