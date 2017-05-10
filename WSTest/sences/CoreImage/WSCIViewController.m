//
//  WSCIViewController.m
//  WSTest
//
//  Created by wangshen on 2017/5/10.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "WSCIViewController.h"

@interface WSCIViewController ()

@end

@implementation WSCIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"CoreImage";
    CIColor *color = [CIColor colorWithString:@"0.9,0.9,0.9,1"];
    UIColor *ucolor = [UIColor colorWithCIColor:color];
    NSLog(@"%zd ---- --- %@",color.numberOfComponents,color.stringRepresentation);
    self.view.backgroundColor = ucolor;
    
    //CIDetector  
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
