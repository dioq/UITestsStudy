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
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(15, 100, 345, 30);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点击跳转" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [self setImageView];
    [self setImageView2];
}

- (void)btnAction:(UIButton *)sender{
    SubViewController *vc = [[SubViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.title = @"subPage";
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)setImageView {
    UIImageView *imgV = [[UIImageView alloc] init];
//    imgV.backgroundColor = [UIColor cyanColor];
    imgV.frame = CGRectMake(100, 150, 150, 150);
//    imgV.center = self.view.center;
    
    UIImage *img = [UIImage imageNamed:@"test"];
    imgV.image = img;
    [self.view addSubview:imgV];
}

-(void)setImageView2 {
    UIImageView *imgV = [[UIImageView alloc] init];
    imgV.backgroundColor = [UIColor cyanColor];
    imgV.frame = CGRectMake(100, 350, 150, 150);
//    imgV.center = self.view.center;
    
//    UIImage *img = [UIImage imageNamed:@"test"];
//    imgV.image = img;
    [self.view addSubview:imgV];
}

@end
