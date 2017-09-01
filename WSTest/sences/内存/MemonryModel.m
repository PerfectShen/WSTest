
//
//  MemonryModel.m
//  WSTest
//
//  Created by wangshen on 2017/8/25.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "MemonryModel.h"

@implementation MemonryModel

- (id)copyWithZone:(NSZone *)zone {
    MemonryModel *model = [[self class] allocWithZone:zone];
    model.name = [_name copy];//[NSString stringWithFormat:@"%@",_name];
    model.subModel = [_subModel copy];
    return model;
}

@end
