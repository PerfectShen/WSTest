//
//  Student.h
//  WSTest
//
//  Created by wangshen on 2017/6/12.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Student : NSObject

@property (nonatomic, copy) NSString *Id;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) Person *child;

- (void)sayHello;


- (void)eatFood;

@end
