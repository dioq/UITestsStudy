//
//  GSTabBarViewController.m
//  GSUITestDemo
//
//  Created by gersces on 2018/8/29.
//  Copyright © 2018年 gersces. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "PageViewController0.h"
#import "PageViewController1.h"
#import "PageViewController2.h"
#import "TouchViewController.h"

@interface MyTabBarViewController ()

@end

static MyTabBarViewController *_tabbar = nil;

@implementation MyTabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildVc:[[PageViewController0 alloc]init] title:@"Page0" image:@"tab_home_normal" selectedImage:@"tab_home_50"];
    [self addChildVc:[[PageViewController1 alloc]init] title:@"Page1" image:@"tab_c2c_normal" selectedImage:@"tab_c2c_50"];
    [self addChildVc:[[PageViewController2 alloc]init] title:@"Page2" image:@"tab_team_normal" selectedImage:@"tab_team_50"];
    [self addChildVc:[[TouchViewController alloc]init] title:@"Page3" image:@"tab_mine_normal" selectedImage:@"tab_mine_50"];
    
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    childVc.title = title;
    
    childVc.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:childVc];
    [navc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [navc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    
    [self addChildViewController:navc];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
