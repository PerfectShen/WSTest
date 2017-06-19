//
//  Student.m
//  WSTest
//
//  Created by wangshen on 2017/6/12.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>

void eatsomeVagetablesIMP(id self,SEL _cmd) {

    NSLog(@"吃了一些蔬菜");
}

@implementation Student

+ (BOOL)instancesRespondToSelector:(SEL)aSelector {
    NSLog(@"%s",__FUNCTION__);
   return  [super instancesRespondToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%s",__FUNCTION__);
   return [super forwardingTargetForSelector:aSelector];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%s",__FUNCTION__);
//    return [super resolveInstanceMethod:sel];
    if (sel == @selector(eatFood)) {
        
        class_addMethod([self class], sel, (IMP)eatsomeVagetablesIMP, "@v:");
        return YES;
    }
    BOOL is = [super resolveInstanceMethod:sel];
    return is;
}

+ (BOOL)resolveClassMethod:(SEL)sel {

    NSLog(@"%s",__FUNCTION__);
    return [super resolveClassMethod:sel];
}

- (void)sayHello {
    NSLog(@"hello");
}
@end
