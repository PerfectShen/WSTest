//
//  LPPaySDK.m
//  ShuaLian
//
//  Created by wangshen on 2017/6/14.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "LPPaySDK.h"
#import "LPChannelShualian.h"
#import "LPChannelAliPay.h"
#import "LPChannelBankCard.h"
#import "LPChannelWeChat.h"

@interface LPPaySDK ()

/**
 所有的支付通道
 */
@property (nonatomic, strong) NSDictionary *payChannelDictionary;

/**
 当前选择的支付通道
 */
@property (nonatomic, strong) id<LPPayProtocol> payChannel;

@end

@implementation LPPaySDK


+ (instancetype)sharePaySDK {

    static LPPaySDK *sdk = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sdk = [[[self class] alloc] init];
    });
    return sdk;
}

- (instancetype)init {

    if (self = [super init]) {
        [self _initlizedVars];
    }
    return self;
}


- (void)_initlizedVars {

    self.payChannelDictionary = @{LPPayChannelNameShuaLian:[LPChannelShualian class],
                                  LPPayChannelNameBankCard:[LPChannelBankCard class],
                                  LPPayChannelNameWeChat:[LPChannelWeChat class],
                                  LPPayChannelNameAliPay:[LPChannelAliPay class]};
}

- (void)payOrder:(LPPayOrder *)order callBack:(CompleteionBlock)callBack {
    if (!callBack) {
        callBack = ^(LPPayResult *error) {
            PayLog(@"%@",error.message);
        };
    }
    NSString *payChannelName = order.payChannel;
    if (![self.payChannelDictionary.allKeys containsObject:payChannelName]) {
        //未找到指定的支付通道
        LPPayResult *error = [LPPayResult payErrorWithCode:LPPayCodeInvalidChannel];
        callBack(error);
        return ;
    }
    
    Class cls = [self.payChannelDictionary objectForKey:order.payChannel];
    id<LPPayProtocol> payChannel = [[cls alloc] init];
    if (!payChannel) {
        // 初始化失败
        LPPayResult *error = [LPPayResult payErrorWithCode:LPPayCodeUnKown];
        callBack(error);
        return;
    }
    self.payChannel = payChannel;
    [payChannel payOrder:order callBack:^(LPPayResult *result) {
        self.payChannel = nil;
        callBack(result);
    }];

}

- (void)payUrlOrder:(NSString *)urlString
        channelName:(NSString *)channelName
           callBack:(CompleteionBlock)callBack {
    if (!callBack) {
        callBack = ^(LPPayResult *error) {
            PayLog(@"%@",error.message);
        };
    }
    NSString *payChannelName = channelName;
    if (![self.payChannelDictionary.allKeys containsObject:payChannelName]) {
        //未找到指定的支付通道
        LPPayResult *error = [LPPayResult payErrorWithCode:LPPayCodeInvalidChannel];
        callBack(error);
        return ;
    }
    
    Class cls = [self.payChannelDictionary objectForKey:payChannelName];
    id<LPPayProtocol> payChannel = [[cls alloc] init];
    if (!payChannel) {
        // 初始化失败
        LPPayResult *error = [LPPayResult payErrorWithCode:LPPayCodeUnKown];
        callBack(error);
        return;
    }
    self.payChannel = payChannel;
    [payChannel payUrlOrder:urlString channelName:channelName callBack:^(LPPayResult *result) {
        self.payChannel = nil;
        callBack(result);
    }];

}


- (BOOL)handleOpenURL:(NSURL *)url {

    if (self.payChannel) {
      return [self.payChannel handleOpenURL:url];
    }
    return YES;
}

@end
