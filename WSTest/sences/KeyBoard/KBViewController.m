//
//  KBViewController.m
//  WSTest
//
//  Created by wangshen on 2017/6/16.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "KBViewController.h"
#import "KeyBoardView.h"
#import "LPPassWordTextField.h"

@interface KBViewController () <LPPassWordTextFieldDelegate>

@end

@implementation KBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];// [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    
    LPPassWordTextField *textField = [[LPPassWordTextField alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 44)];
    textField.backgroundColor = [UIColor whiteColor];
    textField.delegate = self;
//   textField.inputView = [KeyBoardView keyBoardView];
    textField.keyboardAppearance = UIKeyboardAppearanceLight;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:textField];
}

- (void)passWordtextField:(LPPassWordTextField *)textField completeInputWithText:(NSString *)text {

    NSLog(@"密码为 %@",text);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
