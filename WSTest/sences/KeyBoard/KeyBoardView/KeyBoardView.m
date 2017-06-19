//
//  KeyBoardView.m
//  WSTest
//
//  Created by wangshen on 2017/6/16.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "KeyBoardView.h"

@implementation KeyBoardView

+ (instancetype)keyBoardView {

    KeyBoardView *view = [[KeyBoardView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 216)];
    
//    view.backgroundColor = [UIColor orangeColor];
    return view;
}

@end
