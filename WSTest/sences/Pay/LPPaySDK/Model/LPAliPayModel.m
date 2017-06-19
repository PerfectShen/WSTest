//
//  AlipayModel.m
//  ShuaLian
//
//  Created by apple on 15/10/13.
//  Copyright © 2015年 EvanCai. All rights reserved.
//

#import "LPAliPayModel.h"

@implementation LPAliPayModel

- (NSString *)description {
    NSMutableString * discription = [NSMutableString string];
    if (self.partner) {
        [discription appendFormat:@"partner=\"%@\"", self.partner];
    }
    
    if (self.seller) {
        [discription appendFormat:@"&seller_id=\"%@\"", self.seller];
    }
    if (self.tradeNO) {
        [discription appendFormat:@"&out_trade_no=\"%@\"", self.tradeNO];
    }
    if (self.productName) {
        [discription appendFormat:@"&subject=\"%@\"", self.productName];
    }
    
    if (self.productDescription) {
        [discription appendFormat:@"&body=\"%@\"", self.productDescription];
    }
    if (self.amount) {
        [discription appendFormat:@"&total_fee=\"%@\"", self.amount];
    }
    if (self.notifyURL) {
        [discription appendFormat:@"&notify_url=\"%@\"", self.notifyURL];
    }
    
    if (self.service) {
        [discription appendFormat:@"&service=\"%@\"",self.service];//mobile.securitypay.pay
    }
    if (self.paymentType) {
        [discription appendFormat:@"&payment_type=\"%@\"",self.paymentType];//1
    }
    
    if (self.inputCharset) {
        [discription appendFormat:@"&_input_charset=\"%@\"",self.inputCharset];//utf-8
    }
    if (self.itBPay) {
        [discription appendFormat:@"&it_b_pay=\"%@\"",self.itBPay];//30m
    }
    if (self.showUrl) {
        [discription appendFormat:@"&show_url=\"%@\"",self.showUrl];//m.alipay.com
    }
    if (self.rsaDate) {
        [discription appendFormat:@"&sign_date=\"%@\"",self.rsaDate];
    }
    if (self.appID) {
        [discription appendFormat:@"&app_id=\"%@\"",self.appID];
    }
    for (NSString * key in [self.extraParams allKeys]) {
        [discription appendFormat:@"&%@=\"%@\"", key, [self.extraParams objectForKey:key]];
    }
    return discription;
}


+ (instancetype)modelWithOrderNo:(NSString *)orderNo amount:(NSString *)amount productName:(NSString *)productName {
    LPAliPayModel *order = [[LPAliPayModel alloc] init];
    NSDictionary *dic = [self plistDictionary];
    /*
     *商户的唯一的parnter和seller。
     *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
     */
    //需要填写商户app申请的
    NSString *partner = dic[@"partner"];
    NSString *seller =dic[@"seller_id"];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = orderNo; //订单ID（由商家自行制定）
    order.productName = productName; //商品标题
    order.productDescription = productName; //商品描述
    order.amount = [NSString stringWithFormat:@"%.2f",[amount floatValue]]; //商品价格
    order.notifyURL = [HttpClient getResourceUrl:dic[@"notify_url"]]; //回调URL
    order.service = dic[@"service"];
    order.paymentType = dic[@"payment_type"];
    order.inputCharset = dic[@"_input_charset"];
    order.itBPay = dic[@"it_b_pay"];
    order.showUrl = dic[@"show_url"];
    return order;
    
}

+ (NSDictionary *)plistDictionary {

    NSString *path =  [[NSBundle mainBundle] pathForResource:@"LPPayInfo" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *aliDic = dic[@"AliPayInfo"];
    return aliDic;
}

@end
