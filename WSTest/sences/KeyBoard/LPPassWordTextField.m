//
//  LPPassWordTextField.m
//  WSTest
//
//  Created by wangshen on 2017/6/19.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "LPPassWordTextField.h"

#define KPointViewSize 8


@interface LP_BlackPointView : UIView


@end

@implementation LP_BlackPointView


- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)layoutSubviews {

    [super layoutSubviews];
    if (!self.backgroundColor) {
        self.backgroundColor = [UIColor blackColor];
    }
    self.layer.cornerRadius = self.bounds.size.width/2;
    self.clipsToBounds = YES;
}

@end

#pragma mark - 分割线

@interface LPPassWordTextField ()

@property (nonatomic, strong) NSArray *pointViewArray;

@end


@implementation LPPassWordTextField

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self configUI];
        self.secureTextEntry = YES;
        self.textColor = [UIColor clearColor];
        self.tintColor = [UIColor clearColor];
        self.layer.borderColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1].CGColor;
        self.layer.borderWidth = 1.0f;
        [self addTarget:self action:@selector(passwordTextChanged:) forControlEvents:UIControlEventEditingChanged];
        
        UILongPressGestureRecognizer *ges = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longGestureAction:)];
        ges.minimumPressDuration = 0.1;
        [self addGestureRecognizer:ges];
        
//        for (UIGestureRecognizer *ges in self.gestureRecognizers) {
////            ges.enabled = NO;
//            if ([NSStringFromClass([ges class]) isEqualToString:@"_UITextSelectionForceGesture"]) {
////                ges.enabled = NO;
////                [ges removeTarget:self action:@selector(oneFingerForcePan:)];
//            }
//        }
    }
    return self;
}

- (void)configUI {

    CGFloat space = 1;
    CGFloat width = (self.bounds.size.width - space * (KTextInputCount - 1))/KTextInputCount;
    NSMutableArray *viewArray = [NSMutableArray array];
    for (NSInteger i = 0 ; i < KTextInputCount; i ++) {
        LP_BlackPointView *pView = [[LP_BlackPointView alloc] initWithFrame:CGRectMake(i * (space + width) + (width - KPointViewSize)/2,(self.bounds.size.height - KPointViewSize)/2,KPointViewSize,KPointViewSize)];
        pView.hidden = YES;
        [self addSubview:pView];
        if (i < KTextInputCount- 1) {
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(width + i * (width + space),0, space, self.bounds.size.height)];
            line.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
            [self addSubview:line];
        }
        [viewArray addObject:pView];
    }
    self.pointViewArray = [NSArray arrayWithArray:viewArray];
}


- (void)passwordTextChanged:(UITextField *)textField {

    NSString *text = textField.text;
    if (text.length > KTextInputCount) {
        text = [text substringToIndex:KTextInputCount];
        textField.text = text;
        NSLog(@"---- %@",text);
    }else {
        NSLog(@"---- %@",text);
        [self.pointViewArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            LP_BlackPointView *pView = (LP_BlackPointView *)obj;
            pView.hidden = YES;
        }];
        for (NSInteger i = 0; i < text.length; i ++) {
            LP_BlackPointView *pView = self.pointViewArray[i];
            pView.hidden = NO;
        }
        
        if (text.length == KTextInputCount) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(passWordtextField:completeInputWithText:)]) {
                id<LPPassWordTextFieldDelegate> delegate =  (id<LPPassWordTextFieldDelegate>)self.delegate;
                [delegate passWordtextField:self completeInputWithText:text];
            }
        }
    }
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {

    NSLog(@"%@",self.gestureRecognizers);
    return NO;
}

- (void)longGestureAction:(UILongPressGestureRecognizer *)ges {

}



@end
