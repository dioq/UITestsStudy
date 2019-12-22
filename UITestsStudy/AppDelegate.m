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
    
    return YES;
}

@end
