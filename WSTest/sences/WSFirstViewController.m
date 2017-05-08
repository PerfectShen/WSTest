//
//  WSFirstViewController.m
//  WSTest
//
//  Created by wangshen on 2017/5/5.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "WSFirstViewController.h"


@interface WSFirstViewController ()

@property (nonatomic, strong) NSString *aString;

@property (nonatomic, copy) NSString *bString;

@property (nonatomic, strong) NSNumber *aNumber;

@property (nonatomic, copy) NSNumber *bNumber;

@end

@implementation WSFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"%@",ABC);

    
    NSMutableString *muString1 = [[NSMutableString alloc] initWithString:@"123"];
    self.aString = muString1;
    self.bString = muString1;
    //给可变字符串拼接一段字符串
//    [muString1 appendString:@"我是附加的"];
    //更改字符串的内容 重新指向新的地址
//    muString1 = @"2223".mutableCopy;
    //改变字符串的内容但不改变其指向
    [muString1 setString:@"附加"];
    
    
    NSLog(@"\naString = %@ \nbString = %@",self.aString,self.bString);
    
    
    
    
    
    
    NSNumber *number1 = [NSNumber numberWithInteger:123456];
    self.aNumber = number1;
    self.bNumber = number1;
    number1  = @0;
    NSLog(@"\naNumber = %@ \nbNumber = %@",self.aNumber,self.aNumber);
    
    NSLog(@"%@ ---- %@",NSStringFromClass([muString1 class]),NSStringFromClass([number1 class]));
    
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
