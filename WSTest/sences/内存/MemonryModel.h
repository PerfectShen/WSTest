//
//  MemonryModel.h
//  WSTest
//
//  Created by wangshen on 2017/8/25.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemonryModel : NSObject <NSCopying>

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) MemonryModel *subModel;

@end
