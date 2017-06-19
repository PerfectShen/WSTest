//
//  LPPassWordTextField.h
//  WSTest
//
//  Created by wangshen on 2017/6/19.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

//轮子 -- 支付宝 6位支付密码输入框

#import <UIKit/UIKit.h>
@class LPPassWordTextField;

#define KTextInputCount 6

@protocol LPPassWordTextFieldDelegate <UITextFieldDelegate>


/**
 输入框输入完成

 @param textField self
 @param text 输入框中的文字
 */
- (void)passWordtextField:(LPPassWordTextField *)textField completeInputWithText:(NSString *)text;

@end

@interface LPPassWordTextField : UITextField

@end
