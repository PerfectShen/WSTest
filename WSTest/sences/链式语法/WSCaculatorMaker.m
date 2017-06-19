//
//  WSCaculatorMaker.m
//  WSTest
//
//  Created by wangshen on 2017/6/1.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "WSCaculatorMaker.h"

@implementation WSCaculatorMaker

- (WSCaculatorMaker *(^)(int))add {

    return ^ WSCaculatorMaker *(int value) {
        _result += value;
        return self;
    };
}
- (WSCaculatorMaker *(^)(int))sub {
    
    return ^ WSCaculatorMaker *(int value) {
        _result -= value;
        return self;
    };
}
- (WSCaculatorMaker *(^)(int))muilt {
    return ^ WSCaculatorMaker *(int value) {
        _result *= value;
        return self;
    };
}
- (WSCaculatorMaker *(^)(int))divide {
    return ^ WSCaculatorMaker *(int value) {
        _result /= value;
        return self;
    };
}

@end
