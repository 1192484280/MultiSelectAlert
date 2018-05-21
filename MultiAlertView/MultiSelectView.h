//
//  MultiSelectView.h
//  Demoo
//
//  Created by zhangming on 2018/5/21.
//  Copyright © 2018年 zhangming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiSelectView : UIView

@property (nonatomic, copy)  void(^finishBlock)(NSArray *selectedArr);

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title andArr:(NSArray *)listArr;

@end
