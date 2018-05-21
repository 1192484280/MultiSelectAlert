//
//  MultiSelectCell.h
//  Demoo
//
//  Created by zhangming on 2018/5/21.
//  Copyright © 2018年 zhangming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiSelectCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLa;
@property (strong, nonatomic) IBOutlet UIButton *selectBtn;

+ (instancetype)tempWithTableView:(UITableView *)tableView;

- (void)setTitle:(NSString *)title andSelectArr:(NSArray *)listArr;

@end
