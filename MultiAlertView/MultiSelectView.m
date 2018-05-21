//
//  MultiSelectView.m
//  Demoo
//
//  Created by zhangming on 2018/5/21.
//  Copyright © 2018年 zhangming. All rights reserved.
//

#import "MultiSelectView.h"
#import "MultiSelectHeaderView.h"
#import "MultiSelectCell.h"
#import "UIView+Extension.h"

@interface MultiSelectView()<UITableViewDataSource,UITableViewDelegate>
{
    NSString *_title;
    NSArray *_listArr;
}
@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UIView *bodyView;

@property (strong, nonatomic) MultiSelectHeaderView *headerView;

@property (strong, nonatomic) UIButton *footerBtn;

@property (strong, nonatomic) NSMutableArray *selectArr;

@end

@implementation MultiSelectView

- (NSMutableArray *)selectArr{
    
    if (!_selectArr) {
        
        _selectArr = [NSMutableArray array];
    }
    
    return _selectArr;
}

- (UIView *)bodyView{
    
    if (!_bodyView) {
        
        _bodyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height - 65)];
        _bodyView.backgroundColor = [UIColor whiteColor];
        _bodyView.layer.cornerRadius = 10;
        
        [_bodyView addSubview:self.headerView];
        
        [_bodyView addSubview:self.tableView];
        
    }
    
    return _bodyView;
}
- (UIButton *)footerBtn{
    
    if (!_footerBtn) {
        
        _footerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.bodyView.frame) + 5, self.width, 50)];
        _footerBtn.layer.cornerRadius = 10;
        _footerBtn.backgroundColor = [UIColor whiteColor];
        [_footerBtn addTarget:self action:@selector(onSureBtn) forControlEvents:UIControlEventTouchUpInside];
        [_footerBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_footerBtn setTitleColor:[UIColor colorWithRed:19.0/255.0 green:112.0/255.0 blue:222.0/255.0 alpha:1] forState:UIControlStateNormal];
        _footerBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    }
    
    return _footerBtn;
}

- (void)onSureBtn{
    
    if (_finishBlock) {
        
        _finishBlock(self.selectArr);
    }
}
- (MultiSelectHeaderView *)headerView{
    
    if (!_headerView) {
        
        _headerView = [[MultiSelectHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.width, 40) andTitle:_title];
    }
    
    return _headerView;
}

- (UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, self.width, self.bodyView.height - 40) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.layer.cornerRadius = 10;
        //_tableView.separatorColor = [DetailColor];
        //_tableView.bounces = NO;//取消弹性
    }
    
    return _tableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _listArr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    MultiSelectCell *cell = [MultiSelectCell tempWithTableView:tableView];
    [cell setTitle:_listArr[indexPath.row] andSelectArr:self.selectArr];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MultiSelectCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    cell.selectBtn.selected = !cell.selectBtn.selected;
    
    if (cell.selectBtn.selected) {
        
        [self.selectArr addObject:_listArr[indexPath.row]];
    }else{
        
        [self.selectArr removeObject:_listArr[indexPath.row]];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}

#pragma mark - 分割线顶到边
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath: (NSIndexPath *)indexPat{
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title andArr:(NSArray *)listArr{
    
    if (self = [super initWithFrame:frame]) {
        
        _title = title;
        _listArr = listArr;
        [self setUI];
    }
    
    return self;
}

- (void)setUI{
    
    
    [self addSubview:self.bodyView];
    
    
    [self addSubview:self.footerBtn];
}

@end
