//
//  LPPayError.h
//  ShuaLian
//
//  Created by wangshen on 2017/6/14.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSInteger LPPayCode NS_EXTENSIBLE_STRING_ENUM;


UIKIT_EXTERN LPPayCode const LPPayCodeSuccess;      //支付成功
UIKIT_EXTERN LPPayCode const LPPayCodeFailed;      //支付失败
UIKIT_EXTERN LPPayCode const LPPayCodeCanceled;      //支付取消
UIKIT_EXTERN LPPayCode const LPPayCodeTimeOut;      //支付超时
UIKIT_EXTERN LPPayCode const LPPayCodeInvalidChannel;  //无效的支付通道
UIKIT_EXTERN LPPayCode const LPPayCodeErrorParams;  //支付参数异常
UIKIT_EXTERN LPPayCode const LPPayCodeWeChatUnInstalled;      //微信未安装
UIKIT_EXTERN LPPayCode const LPPayCodeWeChatAuthorFailed;      //微信授权失败
UIKIT_EXTERN LPPayCode const LPPayCodeUnKown;      //未知错误



@interface LPPayResult : NSObject

@property (nonatomic, assign) LPPayCode code;

@property (nonatomic, copy , readonly) NSString *message;

@property (nonatomic, strong) NSDictionary *content;

+ (instancetype)payErrorWithCode:(LPPayCode )code;

@end
