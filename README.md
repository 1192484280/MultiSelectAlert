# MultiSelectAlert
底部弹出多选alert

项目需要一个多选alert，为了和其他alert样式保持一致，我封装了一个。

demo里面我只是展示的单纯一个字符串数组，也可以换成model数组，只需要修改一些内容即可，不难操作

![image](https://github.com/1192484280/MultiSelectAlert/blob/master/QQ20180522-092321-HD.gif)


使用方法：

将MultiAlertView导入项目，在需要的页面#import "MultiBaseView.h"，

在需要弹出多选框的点击方法里：

NSArray *arr = @[@"北京",@"上海",@"大连"];

[MultiBaseView showMultiSheetAlertWithTitle:@"选择" conditions:arr resultBlock:^(NSArray *selectArr) {

NSLog(@"选中:----------------");
for (NSString *str in selectArr) {

NSLog(@"%@",str);
}
} cancleBlock:^{
NSLog(@"取消");
}];
