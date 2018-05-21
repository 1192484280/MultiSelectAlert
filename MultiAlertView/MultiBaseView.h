//
//  MultiBaseView.h
//  Demoo
//
//  Created by zhangming on 2018/5/21.
//  Copyright © 2018年 zhangming. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Screen_Bounds [UIScreen mainScreen].bounds
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define iPhoneX_Top iPhoneX ? 88.0f : 64.0f
// tabBar高度
#define TAB_BAR_HEIGHT (iPhoneX ? (49.f+34.f) : 49.f)
// home indicator
#define iPhoneX_Bottom iPhoneX ? 34.0f : 0.0f

typedef void(^MultiSelectBlock)(NSArray *selectArr);
typedef void(^MultiCancleBlock)(void);

@interface MultiBaseView : UIView

/**
 *  1.显示自定义字符串多选底部弹出框
 *
 *  @param title            标题
 *  @param conditionsArr       数据源（条件数组）
 *  @param resultBlock      选择后的回调
 *  @param cancleBlock      取消后的回调
 *
 */
+ (void)showMultiSheetAlertWithTitle:(NSString *)title
                          conditions:(NSArray *)conditionsArr
                         resultBlock:(MultiSelectBlock)resultBlock
                         cancleBlock:(MultiCancleBlock)cancleBlock;

@end
