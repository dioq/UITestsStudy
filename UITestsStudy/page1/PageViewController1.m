//
//  GSPageViewController1.m
//  GSUITestDemo
//
//  Created by gersces on 2018/8/29.
//  Copyright © 2018年 gersces. All rights reserved.
//

#import "PageViewController1.h"

@interface PageViewController1 ()<UISearchBarDelegate>

@end

@implementation PageViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.accessibilityIdentifier = @"pageView1";
    
    UITextField *nameText = [[UITextField alloc]initWithFrame:CGRectMake(15, 100, 345, 25)];
    nameText.placeholder = @"name";
    nameText.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:nameText];
    
    
    UITextField *passWordText = [[UITextField alloc]initWithFrame:CGRectMake(15, 140, 345, 25)];
    passWordText.placeholder = @"passWord";
    passWordText.borderStyle = UITextBorderStyleRoundedRect;
    passWordText.keyboardType = UIKeyboardTypeNumberPad;
    passWordText.secureTextEntry = YES;
    [self.view addSubview:passWordText];
    
    
    UITextView *tipText = [[UITextView alloc]initWithFrame:CGRectMake(15, 180, 345, 50)];
    tipText.backgroundColor = [UIColor colorWithRed:240/255.f green:240/255.f blue:240/255.f alpha:1];
    tipText.text = @"提示：这是textView，上面两个是textFiled";
    [self.view addSubview:tipText];
    tipText.accessibilityIdentifier = @"tipText";
    
    
    UISearchBar *search = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 280, 375, 56)];
    search.placeholder = @"search content";
    search.delegate = self;
    search.returnKeyType = UIReturnKeySearch;
    [self.view addSubview:search];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];//点击页面其他地方 回收键盘
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"search" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
