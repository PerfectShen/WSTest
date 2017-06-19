//
//  LPPayError.m
//  ShuaLian
//
//  Created by wangshen on 2017/6/14.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "LPPayResult.h"

LPPayCode const LPPayCodeSuccess = 2000;      //支付成功
LPPayCode const LPPayCodeFailed = 2001;      //支付失败
LPPayCode const LPPayCodeCanceled = 2002;      //支付取消
LPPayCode const LPPayCodeTimeOut = 2003;      //超时
LPPayCode const LPPayCodeInvalidChannel = 2004;  //无效的支付通道
LPPayCode const LPPayCodeErrorParams = 2005;  //支付参数异常
LPPayCode const LPPayCodeWeChatUnInstalled = 2006;      //微信未安装
LPPayCode const LPPayCodeWeChatAuthorFailed = 2007;      //微信授权失败
LPPayCode const LPPayCodeUnKown = 2008;      //未知错误

@interface LPPayResult ()

@property (nonatomic, copy , readwrite) NSString *message;


@end

@implementation LPPayResult

+ (instancetype)payErrorWithCode:(LPPayCode )code {

    LPPayResult *error = [[LPPayResult alloc] init];
    return error;
}

- initWithCode:(LPPayCode )code {

    if (self = [self init]) {
        self.code = code;
    }
    return self;
}


- (void)setCode:(LPPayCode)code {

    switch (code) {
        case LPPayCodeSuccess:
            self.message = @"支付成功";
            break;
        case LPPayCodeFailed:
            self.message = @"支付失败";
            break;
        case LPPayCodeCanceled:
            self.message = @"支付取消";
            break;
        case LPPayCodeTimeOut:
            self.message = @"支付超时";
            break;
        case LPPayCodeInvalidChannel:
            self.message = @"无效的支付通道";
            break;
        case LPPayCodeErrorParams:
            self.message = @"支付参数异常";
            break;
        case LPPayCodeWeChatUnInstalled:
            self.message = @"未安装微信";
            break;
        case LPPayCodeWeChatAuthorFailed:
            self.message = @"微信授权失败";
            break;
        case LPPayCodeUnKown:
            self.message = @"未知错误";
            break;
        default:
            self.message = @"未知错误";
            break;
    }
}

@end
