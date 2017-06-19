//
//  LPWeChatPayModel.m
//  ShuaLian
//
//  Created by wangshen on 2017/6/13.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "LPWeChatPayModel.h"

@implementation LPWeChatPayModel

- (instancetype)initWithObject:(NSDictionary *)dictionary {

    if (self = [self init]) {
        _appId = dictionary[@"appId"];
        _nonceStr = dictionary[@"nonceStr"];
        _partnerid = dictionary[@"partnerid"];
        _paySign = dictionary[@"paySign"];
        _pkg = dictionary[@"pkg"];
        _prepayId = dictionary[@"prepayId"];
        _signType = dictionary[@"signType"];
        _timeStamp = dictionary[@"timeStamp"];
        _transactionSerialNumber = dictionary[@"transactionSerialNumber"];
    }
    return self;
}

@end
