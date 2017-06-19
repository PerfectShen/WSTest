//
//  LPPayOrder.m
//  ShuaLian
//
//  Created by wangshen on 2017/6/14.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "LPPayOrder.h"

@interface LPPayOrder ()
{
    LPWeChatPayModel *_weChatPayModel;
    LPAliPayModel *_aliPayModel;
}

@end

@implementation LPPayOrder

- (void)setWeChatPayModel:(LPWeChatPayModel *)weChatPayModel {

    _weChatPayModel = weChatPayModel;
}

- (LPWeChatPayModel *)weChatPayModel {

    return _weChatPayModel;
}

- (void)setAliPayModel:(LPAliPayModel *)aliPayModel {

    _aliPayModel = aliPayModel;
}

- (LPAliPayModel *)aliPayModel {

    return _aliPayModel;
}

@end
