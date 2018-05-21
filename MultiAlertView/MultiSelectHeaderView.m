//
//  MultiSelectHeaderView.m
//  Demoo
//
//  Created by zhangming on 2018/5/21.
//  Copyright © 2018年 zhangming. All rights reserved.
//

#import "MultiSelectHeaderView.h"
#import "UIView+Extension.h"

@implementation MultiSelectHeaderView

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title{
    
    if (self = [super initWithFrame:frame]) {
        
        UILabel *la = [[UILabel alloc] initWithFrame:self.frame];
        la.textAlignment = NSTextAlignmentCenter;
        la.text = title;
        la.textColor = [UIColor darkGrayColor];
        la.font = [UIFont systemFontOfSize:13];
        [self addSubview:la];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, self.width, 0.5)];
        line.backgroundColor = [UIColor grayColor];
        line.alpha = 0.5;
        [self addSubview:line];
    }
    return self;
}

@end
