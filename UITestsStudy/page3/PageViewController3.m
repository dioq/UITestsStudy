//
//  GSPageViewController3.m
//  GSUITestDemo
//
//  Created by gersces on 2018/8/30.
//  Copyright © 2018年 gersces. All rights reserved.
//

#import "PageViewController3.h"
#import "SubViewController.h"

@interface PageViewController3 ()

@end

@implementation PageViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(15, 100, 345, 30);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点击跳转" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)btnAction:(UIButton *)sender{
    SubViewController *vc = [[SubViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.title = @"subPage";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
