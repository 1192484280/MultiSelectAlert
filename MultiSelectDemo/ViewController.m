//
//  ViewController.m
//  MultiSelectDemo
//
//  Created by zhangming on 2018/5/21.
//  Copyright © 2018年 zhangming. All rights reserved.
//

#import "ViewController.h"
#import "MultiBaseView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 30)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(onBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)onBtn{
    
    NSArray *arr = @[@"北京",@"上海",@"大连"];
    
    [MultiBaseView showMultiSheetAlertWithTitle:@"选择" conditions:arr resultBlock:^(NSArray *selectArr) {
    
        NSLog(@"选中:----------------");
        for (NSString *str in selectArr) {
            
            NSLog(@"%@",str);
        }
    } cancleBlock:^{
        NSLog(@"取消");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
