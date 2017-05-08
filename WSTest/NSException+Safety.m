//
//  NSException+Safety.m
//  WSTest
//
//  Created by wangshen on 17/1/24.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "NSException+Safety.h"

@implementation NSException (Safety)

- (void)raise{
    NSLog(@"拦截掉 所有的 异常 -- ");
}

+ (void)raise:(NSExceptionName)name format:(NSString *)format, ...{

    NSLog(@"拦截掉 所有的 异常 -- 1");
}


+ (void)raise:(NSExceptionName)name format:(NSString *)format arguments:(va_list)argList{

    NSLog(@"拦截掉 所有的 异常 -- 2");
}
@end
