//
//  LPWeChatPayModel.h
//  ShuaLian
//
//  Created by wangshen on 2017/6/13.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LPWeChatPayModel : NSObject

@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *nonceStr;
@property (nonatomic, copy) NSString *partnerid;
@property (nonatomic, copy) NSString *paySign;
@property (nonatomic, copy) NSString *pkg;
@property (nonatomic, copy) NSString *prepayId;
@property (nonatomic, copy) NSString *signType;
@property (nonatomic, copy) NSNumber *timeStamp;
@property (nonatomic, copy) NSString *transactionSerialNumber;

- (instancetype)initWithObject:(NSDictionary *)dictionary;

@end
