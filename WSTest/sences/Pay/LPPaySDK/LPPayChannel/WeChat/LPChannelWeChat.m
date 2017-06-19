//
//  LPLChannelWeChat.m
//  ShuaLian
//
//  Created by wangshen on 2017/6/14.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "LPChannelWeChat.h"
#import "WXApi.h"
#import "LPWeChatPayModel.h"


@interface LPChannelWeChat ()

@property (nonatomic, copy) CompleteionBlock callBack;

@end

@implementation LPChannelWeChat

- (void)payOrder:(LPPayOrder *)order callBack:(CompleteionBlock)callBack {

    self.callBack = [callBack copy];
    PayReq* req    = [[PayReq alloc] init];
    req.openID     = order.weChatPayModel.appId;
    req.partnerId  = order.weChatPayModel.partnerid;
    req.prepayId   = order.weChatPayModel.prepayId;
    req.nonceStr   = order.weChatPayModel.nonceStr;
    req.timeStamp  = [order.weChatPayModel.timeStamp intValue];
    req.package    = order.weChatPayModel.pkg;
    req.sign       = order.weChatPayModel.signType;
    [WXApi registerApp:req.openID];
    [WXApi sendReq:req];
}


- (BOOL)handleOpenURL:(NSURL *)url {
    
    [WXApi handleOpenURL:url delegate:(id<WXApiDelegate>)self];
    return YES;
}


#pragma mark - WXApiDelegate


- (void)onResp:(BaseResp *)resp {
       LPPayCode code;
        switch (resp.errCode) {
            case WXSuccess:
                code = LPPayCodeSuccess;
                break;
            case WXErrCodeCommon:
                code = LPPayCodeFailed;
                break;
            case WXErrCodeUserCancel:
                code = LPPayCodeCanceled;
                break;
            case WXErrCodeSentFail:
                code = LPPayCodeFailed;
                break;
            case WXErrCodeAuthDeny:
                code = LPPayCodeWeChatAuthorFailed;
                break;
            case WXErrCodeUnsupport:
                code = LPPayCodeWeChatUnInstalled;
                break;
            default:
                code = LPPayCodeUnKown;
                break;
        }
    LPPayResult *result = [LPPayResult payErrorWithCode:code];
    self.callBack(result);
    self.callBack = nil;
}




@end
