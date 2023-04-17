//
//  AppDelegate.m
//  UITestsStudy
//
//  Created by Geek on 2019/12/22.
//  Copyright © 2019 Geek. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    MyTabBarViewController *tabBarController = [MyTabBarViewController new];
    self.window.rootViewController = tabBarController;
    
    [UIView setAnimationsEnabled:NO]; //禁掉动画,可以让点自动化脚本更流畅
    return YES;
}

@end
