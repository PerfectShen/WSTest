//
//  LPChannelAliPay.m
//  ShuaLian
//
//  Created by wangshen on 2017/6/14.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "LPChannelAliPay.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>
#import <StoreKit/StoreKit.h>


@interface LPChannelAliPay ()

@property (nonatomic, copy) CompleteionBlock callBack;

@end

@implementation LPChannelAliPay

- (void)payOrder:(LPPayOrder *)order callBack:(CompleteionBlock)callBack {

    self.callBack = [callBack copy];
    //将商品信息拼接成字符串
    NSString *orderSpec = [order.aliPayModel description];
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner([self privateKey]);
    NSString *signedString = [signer signString:orderSpec];
    
    if (!signedString) {
        //如果签名为空 返回失败 code message
        
    }else {
        NSString *orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                                 orderSpec, signedString, @"RSA"];
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:[self appScheme] callback:^(NSDictionary *resultDic) {
            if ([[resultDic objectForKey:@"resultStatus"] integerValue] == 9000) { //支付成功
                LPPayResult *result = [LPPayResult payErrorWithCode:LPPayCodeSuccess];
                callBack(result);
            }else if ([[resultDic objectForKey:@"resultStatus"] integerValue] == 6001){
                LPPayResult *result = [LPPayResult payErrorWithCode:LPPayCodeCanceled];
                callBack(result);
            }else {//支付失败
                LPPayResult *result = [LPPayResult payErrorWithCode:LPPayCodeFailed];
                callBack(result);
            }
        }];
    }
}

- (void)payUrlOrder:(NSString *)urlString channelName:(NSString *)channelName callBack:(CompleteionBlock)callBack {

    NSString *orderInfo = [[AlipaySDK defaultService] fetchOrderInfoFromH5PayUrl:urlString];

    [[AlipaySDK defaultService]payUrlOrder:orderInfo fromScheme:[self appScheme] callback:^(NSDictionary* resultDic) {
        // 处理支付结果
        // isProcessUrlPay 代表 支付宝已经处理该URL
        if ([resultDic[@"isProcessUrlPay"] boolValue]) {
            // returnUrl 代表 第三方App需要跳转的成功页URL
            NSString* urlStr = resultDic[@"returnUrl"];
            if(!urlStr || urlStr.length) { //如果为空表示未支付或者支付失败
                LPPayResult *result = [LPPayResult payErrorWithCode:LPPayCodeFailed];
                result.content = resultDic;
                callBack(result);
            }else{
                LPPayResult *result = [LPPayResult payErrorWithCode:LPPayCodeSuccess];
                result.content = resultDic;
                callBack(result);
            }
        }else {
            LPPayResult *result = [LPPayResult payErrorWithCode:LPPayCodeFailed];
            result.content = resultDic;
            callBack(result);
        }
    }];

    
}

- (BOOL)handleOpenURL:(NSURL *)url {

    PayWeakSelf
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url
                                                  standbyCallback:^(NSDictionary *resultDic) {
                                                      //【由于在跳转支付宝客户端支付的过程中,商户 app 在后台很可能被系统 kill 了,所以 pay 接口的 callback 就会失效,请商户对 standbyCallback 返回的回调结果进行处理,就是在这个方 法里面处理跟 callback 一样的逻辑】
                                                      NSLog(@"result = %@",resultDic);
                                                      [[NSNotificationCenter defaultCenter] postNotificationName:LPAliPayPayResultNotification object:nil userInfo:resultDic];
                                                      [weakSelf _poccessResultDic:resultDic];

                                                  }];
    }
    if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回 authCode
        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中,商户 app 在后台很可能被系统 kill 了, 所以 pay 接口的 callback 就会失效,请商户对 standbyCallback 返回的回调结果进行处理,就 是在这个方法里面处理跟 callback 一样的逻辑】
            NSLog(@"result = %@",resultDic);
            [[NSNotificationCenter defaultCenter] postNotificationName:LPAliPayPayResultNotification object:nil userInfo:resultDic];
            [weakSelf _poccessResultDic:resultDic];
        }];
    }
    return YES;
}


#pragma mark - 私有方法

- (void)_poccessResultDic:(NSDictionary *)resultDic {

    LPPayResult *result = [LPPayResult payErrorWithCode:LPPayCodeSuccess];
    result.content = resultDic;
    self.callBack(result);
    self.callBack = nil;
}

- (NSString *)privateKey {
    
    NSString *privateKey = @"MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAMBpmTh9n1KjkvmFGnTw7P3Z1G9hCX00NXR58hczmtj7oxprygw8c4oprtseKac5LcGaqD5GJo3Nw+gDAHkt/20JlldCLvk+IYjzCI21DZsjwQD6Aax8KDKjBqoGSokwp7IA7x3cs3JTLYvjVdIeyZy7c1cpRwSYKA1Ngy4mVz3hAgMBAAECgYBG1dlpmZ3Q75VJNP5DdPrajZoOkvvKUzEmu0orznzASwuFy47rqEmk4KmV02nkPUGiF8y+eFbzN4Ba5tgCxLNWjlwGfQ5c03GbDkrT4UABVXn8LSeQ2h64fvUjQKOqpgE13a15MYZNofrxQh2NWU7/vQy9Jew7Y0MVRXoh/kzWUQJBAOpZdp24Z7o463u6eijPXOfLqzPNit2l1TipKscbC+V2lEAsJ5CyCkNgnbZBFxfqgHdfjO0RAW/KIK4w0Y8fnKUCQQDSMEuILVX7UJp/BSNIS2pIsryL1oEIRNE+SwLk1nmHzPcD4U8+sdNv6kQUCBPxyOQ4fE0u5r+bGqMo5286kWuNAkEAx5ImfIxk8Wa1y2lzzLtC0DdW9cet4bHu0dDmmCbFS8Ve3QN9MjEcomJuDJ6Dzx8qBf6+IckgoxXMHOuAGtV97QJBAMs3XF+uDXps5OK4EfO8zma5QKgm3RwkhPWoSoT7hAazOYPr29Uu0tFaezWu1bGn3FdsfqdA+7G3YFaU5CqJHKUCQQClD6+BYXnGGYHmQ3ZuvUnDHsjeIuQhBPnrRpvmOOIhpHyg8aIXAm9sNmAA6aypMcG5hMDdTUnqgNlIA3U1L4jE";
    return privateKey;
}


- (NSString *)appScheme {

    NSString *path =  [[NSBundle mainBundle] pathForResource:@"LPPayInfo" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *aliDic = dic[@"AliPayInfo"];
    return aliDic[@"AppScheme"];
}




@end
