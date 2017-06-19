//
//  RTViewController.m
//  WSTest
//
//  Created by wangshen on 2017/6/12.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "RTViewController.h"
#import "Student.h"
#import <objc/runtime.h>
#import "Person.h"

@interface RTViewController ()

@end

@implementation RTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    Student *st = [[Student alloc] init];
    //获取某一个对象所属的类
    Class c = object_getClass(st);
    NSString *string = NSStringFromClass(c);
    NSLog(@"%@",string);
    
    //设置某一个对象为另一个类
//    object_setClass(st, [Person class]);
//    st.name = @"2"; //调用此方法会导致崩溃
    NSLog(@"%@",NSStringFromClass([st class]));
    
    //判断某一变量 是不是类
    NSLog(@"%zd ---- %zd",object_isClass(st),object_isClass(c));
    
    //获取到某一个对象所属的类名
    const char *cName = object_getClassName(st);
    printf("%s",cName);
    
    unsigned int outCount;
    objc_property_t *arr = class_copyPropertyList([Student class],&outCount);
    
    for (int i = 0; i < outCount; i ++) {
        const char *name = property_getName(arr[i]);
        const char *att = property_getAttributes(arr[i]);
        NSLog(@"%@ ---- %@",[NSString stringWithUTF8String:name],[NSString stringWithUTF8String:att]);
    }
    NSLog(@"%zd",outCount);
    
    [st sayHello];
    [st eatFood];
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
