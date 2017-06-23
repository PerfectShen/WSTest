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

#define KErrorColor  [UIColor redColor]
#define KNormalColor [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1]


@protocol LPPassWordTextFieldDelegate <UITextFieldDelegate>


/**
 输入框输入完成

 @param textField self
 @param text 输入框中的文字
 */
- (void)passWordtextField:(LPPassWordTextField *)textField completeInputWithText:(NSString *)text;

@end

@interface LPPassWordTextField : UITextField


/**
 <#Description#>

 @param isNormal BOOL
 */
- (void)changeBoardColorWithIsNormal:(BOOL )isNormal;

@end
