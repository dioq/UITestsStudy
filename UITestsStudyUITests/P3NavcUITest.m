//
//  GSNavcUITest.m
//  GSUITestDemoUITests
//
//  Created by gersces on 2018/8/30.
//  Copyright © 2018年 gersces. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface P3NavcUITest : XCTestCase

@property(nonatomic,strong)XCUIApplication *app;

@end

@implementation P3NavcUITest

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _app = [[XCUIApplication alloc]init];
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [_app launch];
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    //点击tabbarItem，跳转到Page2界面
    XCUIElement *tabbar = _app.tabBars.allElementsBoundByIndex[0];
    XCUIElementQuery *tabbarItems = [tabbar childrenMatchingType:XCUIElementTypeButton];
    XCUIElement *page3 = [tabbarItems elementBoundByIndex:3];
    [page3 tap];
    
    [_app.buttons[@"点击跳转"] tap];
    
    //获取导航栏的返回按钮
    XCUIElement *navcBar = _app.navigationBars.allElementsBoundByIndex[0];
    XCUIElementQuery *navcBarItems = [navcBar childrenMatchingType:XCUIElementTypeButton];
    XCUIElement *backBtn = [navcBarItems elementBoundByIndex:0];
    [backBtn tap];
}

-(void)testImageView {
    //点击tabbarItem，跳转到Page2界面
    XCUIElement *tabbar = _app.tabBars.allElementsBoundByIndex[0];
    XCUIElementQuery *tabbarItems = [tabbar childrenMatchingType:XCUIElementTypeButton];
    XCUIElement *page3 = [tabbarItems elementBoundByIndex:3];
    [page3 tap];
    
    
//    XCUIElement *image0 = [self.app.images elementBoundByIndex:0];
//    [image0 tap];
//    NSLog(@"image0 count:%lu",image0.icons.count);
//    NSLog(@"elementType:%ld",image0.elementType);
    for (int i = 0; i < self.app.images.count; i++) {
        XCUIElement *image = [self.app.images elementBoundByIndex:i];
        [image tap];
        NSLog(@"%f %f %f %f",image.frame.origin.x,image.frame.origin.y,
              image.frame.size.width,image.frame.size.height);
//        UIImage *test = [self screenShotView:(UIView *)image];
        
        NSLog(@"value:\n%@",image.value);
        NSLog(@"image count:%lu",image.icons.count);
        NSLog(@"elementType:%ld",image.elementType);
        NSLog(@"============ %d ============", i);
    }
    
//    XCUIElement *image1 = [self.app.images elementBoundByIndex:1];
//    [image1 tap];
//    NSLog(@"elementType:%ld",image1.elementType);
//    UIImage *img = [UIImage imageNamed:@"test"];
//    [image1 setValue:img forKey:@"image"];
}

//传入需要截取的view
-(UIImage *)screenShotView:(UIView *)view{
    UIImage *imageRet = [[UIImage alloc]init];
    UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    imageRet = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageRet;
}

@end
