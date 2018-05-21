//
//  MultiBaseView.m
//  Demoo
//
//  Created by zhangming on 2018/5/21.
//  Copyright © 2018年 zhangming. All rights reserved.
//

#import "MultiBaseView.h"

#import "MultiSelectView.h"
#import "UIView+Extension.h"

@interface MultiBaseView()
{
    NSString *_title;
    NSArray *_conditionsArr;
}

@property (strong, nonatomic) UIView *bgView;

@property (strong, nonatomic) MultiSelectView *multiSelectView;

/** 选中后的回调 */
@property (nonatomic, copy) MultiSelectBlock resultBlock;
/** 取消选择的回调 */
@property (nonatomic, copy) MultiCancleBlock cancelBlock;

@end

@implementation MultiBaseView

- (MultiSelectView *)multiSelectView{
    
    if (!_multiSelectView) {
        
        CGFloat height = _conditionsArr.count * 50 + 40 + 14 + 50;
        
        if (_conditionsArr.count > 8 ) {
            
            height = 8 * 50 + 40 + 14 + 50;
        }
        
        _multiSelectView = [[MultiSelectView alloc] initWithFrame:CGRectMake(10, kScreenHeight, kScreenWidth - 20, height) andTitle:_title andArr:_conditionsArr];
        
        __weak typeof(self) weakSelf = self;
        
        _multiSelectView.finishBlock = ^(NSArray *selectedArr) {
            
            [weakSelf remoViewSubView];
            
            if (!(selectedArr.count > 0)) {
                
                if (weakSelf.cancelBlock) {
                    
                    weakSelf.cancelBlock();
                    return ;
                }
            }
            if (weakSelf.resultBlock) {
                
                
                weakSelf.resultBlock(selectedArr);
                
            }
        };
        
        
        
    }
    
    return _multiSelectView;
}
+ (void)showMultiSheetAlertWithTitle:(NSString *)title
                          conditions:(NSArray *)conditionsArr
                         resultBlock:(MultiSelectBlock)resultBlock
                         cancleBlock:(MultiCancleBlock)cancleBlock{
    
    MultiBaseView *baseView = [[MultiBaseView alloc] initWithTitle:title conditions:conditionsArr resultBlock:resultBlock cancleBlock:cancleBlock];
    [baseView showWithAnimation:YES];
    
    
}


-(UIView *)bgView{
    
    if (!_bgView) {
        
        _bgView = [[UIView alloc] initWithFrame: Screen_Bounds];
        _bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2f];
        [_bgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didBgView)]];
        
    }
    return _bgView;
}

- (void)didBgView{
    
    if (self.cancelBlock) {
        
        self.cancelBlock();
    }
    
    [self remoViewSubView];
    
}

- (void)remoViewSubView{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.multiSelectView.y = kScreenHeight;
        self.bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}
- (instancetype)initWithTitle:(NSString *)title
                   conditions:(NSArray *)conditionsArr
                  resultBlock:(MultiSelectBlock)resultBlock
                  cancleBlock:(MultiCancleBlock)cancleBlock{
    
    if (self = [super init]) {
        
        _title = title;
        _conditionsArr = conditionsArr;
        _resultBlock = resultBlock;
        _cancelBlock = cancleBlock;
        [self initUI];
    }
    
    return self;
}

- (void)initUI{
    
    self.frame = Screen_Bounds;
    [self addSubview:self.bgView];
    [self addSubview:self.multiSelectView];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        CGFloat height = _conditionsArr.count * 50 + 40 + 14 + 50;
        
        if (_conditionsArr.count > 8 ) {
            
            height = 8 * 50 + 40 + 14 + 50;
        }
        self.multiSelectView.y = kScreenHeight - height - (iPhoneX_Bottom);
        self.bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }];
    
}

#pragma mark - 弹出视图方法
- (void)showWithAnimation:(BOOL)animation {
    //1. 获取当前应用的主窗口
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
    
}

@end
