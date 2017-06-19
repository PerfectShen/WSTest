//
//  AlipayModel.h
//  ShuaLian
//
//  Created by apple on 15/10/13.
//  Copyright © 2015年 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LPAliPayModel : NSObject

@property(nonatomic, copy) NSString * partner;
@property(nonatomic, copy) NSString * seller;
@property(nonatomic, copy) NSString * tradeNO;
@property(nonatomic, copy) NSString * productName;
@property(nonatomic, copy) NSString * productDescription;
@property(nonatomic, copy) NSString * amount;
@property(nonatomic, copy) NSString * notifyURL;

@property(nonatomic, copy) NSString * service;
@property(nonatomic, copy) NSString * paymentType;
@property(nonatomic, copy) NSString * inputCharset;
@property(nonatomic, copy) NSString * itBPay;
@property(nonatomic, copy) NSString * showUrl;


@property(nonatomic, copy) NSString * rsaDate;//可选
@property(nonatomic, copy) NSString * appID;//可选

@property(nonatomic, readonly) NSMutableDictionary * extraParams;

//@property (nonatomic, copy)


+ (instancetype)modelWithOrderNo:(NSString *)orderNo amount:(NSString *)amount productName:(NSString *)productName;


@end
