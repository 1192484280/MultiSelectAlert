//
//  MultiSelectCell.m
//  Demoo
//
//  Created by zhangming on 2018/5/21.
//  Copyright © 2018年 zhangming. All rights reserved.
//

#import "MultiSelectCell.h"

@implementation MultiSelectCell

+ (instancetype)tempWithTableView:(UITableView *)tableView{
    
    MultiSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    
    NSString *className = NSStringFromClass([self class]);
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] objectAtIndex:0];
    }
    return cell;
}


- (void)setTitle:(NSString *)title andSelectArr:(NSArray *)listArr{
    
    self.titleLa.text = title;
    
//    __block BOOL isExist = NO;
//    
//    
//    for (NSString *str in listArr) {
//        
//        if ([title isEqual:str]) {
//            
//            isExist = YES;
//            
//        }
//    }
//    //重复则跳过
//    if (!isExist) {
//        
//        self.selectBtn.selected = NO;
//    }else{
//        self.selectBtn.selected = YES;
//    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
