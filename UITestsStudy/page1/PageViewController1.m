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
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"弹框" style:UIBarButtonItemStylePlain target:self action:@selector(alertShow)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
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

//消息权限弹窗
- (void)showUserNotificationAlert {
    //弹窗提示，是否开通通知权限
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"是否允许微信给你发送推送消息" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"不允许" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"允许" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *opt = [[NSDictionary alloc] init];
                [[UIApplication sharedApplication] openURL:url options:opt completionHandler:nil];
            }
        });
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)alertShow {
    [self showUserNotificationAlert];
    return;
    /*
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Hello" message:@"good luck" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *btn1 = [UIAlertAction actionWithTitle:@"sure 1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"sure 1");
    }];
    UIAlertAction *btn2 = [UIAlertAction actionWithTitle:@"sure 2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"sure 2");
    }];
    UIAlertAction *btn3 = [UIAlertAction actionWithTitle:@"sure 3" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"sure 3");
    }];
    UIAlertAction *btn4 = [UIAlertAction actionWithTitle:@"sure 4" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"sure 4");
    }];
    UIAlertAction *btn5 = [UIAlertAction actionWithTitle:@"Destructive" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Destructive");
    }];
    UIAlertAction *btn6 = [UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancle");
    }];
    [alert addAction:btn1];
    [alert addAction:btn2];
    [alert addAction:btn3];
    [alert addAction:btn4];
    [alert addAction:btn5];
    [alert addAction:btn6];

    [self presentViewController:alert animated:YES completion:nil];
     */
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
