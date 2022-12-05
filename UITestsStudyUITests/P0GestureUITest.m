//
//  GSGestureUITest.m
//  GSUITestDemoUITests
//
//  Created by gersces on 2018/8/29.
//  Copyright © 2018年 gersces. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface P0GestureUITest : XCTestCase

@property(nonatomic,strong)XCUIApplication *app;

@end

@implementation P0GestureUITest

/*
 [UIView setAnimationsEnabled:NO]; //在待测试项目中禁止加载动画,可以让点自动化脚本更流畅。
 **/
- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    //    _app = [[XCUIApplication alloc]init];
    
    // 待测试的 app bundleID, 可以测试其他的app
    NSString *bundleID = @"cn.jobs8.UITestsStudy";//@"com.tencent.xin";
    _app = [[XCUIApplication alloc] initWithBundleIdentifier:bundleID];
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    //    [_app launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/*
 //是否存在
 BOOL exists = tabLiveButton.exists;
 //是否可见
 BOOL hittable = tabLiveButton.hittable;
 //UITesting框架中提供的wait方法
 - (void)waitForExpectationsWithTimeout:(NSTimeInterval)timeout handler:(nullable XCWaitCompletionHandler)handler;
 */
- (void)testWait {
    XCTestExpectation *exp = [self expectationWithDescription:@"超时"];
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperationWithBlock:^{
        //    double revenue = 1500;
        //    double tax = [self.revenueBL calculate:revenue];
        sleep(4);
        //    XCTAssertEqual(tax, 45.0, @"用例2测试失败");
        [exp fulfill];  // exp结束
    }];
    
    [self waitForExpectationsWithTimeout:3 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self.app launch];//启动 app
    
    //点击tabbarItem，跳转到Page0界面
    XCUIElement *tabbar = _app.tabBars.allElementsBoundByIndex[0];
    XCUIElementQuery *tabbarItems = [tabbar childrenMatchingType:XCUIElementTypeButton];
    XCUIElement *page1 = [tabbarItems elementBoundByIndex:0];
    [page1 tap];
    
    
    //获取 UILabel 的单击手势
    [_app.buttons[@"单击"] tap];
    //点击alert的确定action
    [_app.buttons[@"确定"] tap];
    
    //获取 UILabel 的双击手势
    [_app.buttons[@"双击"] doubleTap];
    //点击alert的确定action
    [_app.buttons[@"确定"] tap];
    
    //获取 UILabel 的 长按手势
    [_app.buttons[@"长按"] pressForDuration:1.5];
    //点击alert的确定action
    [_app.buttons[@"确定"] tap];
    
    //轻扫label
    XCUIElement *swiper = _app.staticTexts[@"swipeRight"];
    [swiper swipeRight];
    //    [swiper swipeLeft];
    //    [swiper swipeUp];
    //    [swiper swipeDown];
    //点击alert的确定action
    [_app.buttons[@"确定"] tap];
    
    //scrollView滑动
    XCUIElement *scroller = [_app.scrollViews elementBoundByIndex:0];
    [scroller swipeLeft];
    [scroller swipeLeft];
    [scroller swipeRight];
    
    //UIButton的点击手势
    XCUIElement *button = _app.buttons[@"按钮点击"];
    [button tap];
    [_app.buttons[@"确定"] tap];
    
    // 拖滑块
    XCUIElement *slider1 = [self.app.sliders elementBoundByIndex:0];
    // 滑动值 (0,1) 的比例
    !slider1.exists?:[slider1 adjustToNormalizedSliderPosition:1];
    !slider1.exists?:[slider1 adjustToNormalizedSliderPosition:0];
    !slider1.exists?:[slider1 adjustToNormalizedSliderPosition:0.5];
}

// 矢量拖动 --> 屏幕下滑打开通知
- (void)testopenNotification{
    //CGVectorMake(x, y) 其中 x,y取值范围(0,1) 表示所在父视图 x 轴 和 y轴 的比例
    CGVector point1 = CGVectorMake(0.5, 0);
    CGVector point2 = CGVectorMake(0.5, 0.7);
    XCUICoordinate *coord1 = [self.app coordinateWithNormalizedOffset:point1];
    XCUICoordinate *coord2 = [self.app coordinateWithNormalizedOffset:point2];
    /*
     沿着(point1,point2) 矢量方向拖动,整个过程持续 t 秒
     point1 拖动起始位置
     point2 拖动结束位置
     **/
    NSTimeInterval t = 0.1;
    [coord1 pressForDuration:t thenDragToCoordinate:coord2];
}

// 矢量拖动 --> UISlider
-(void)testDragSlider {
    CGVector point1 = CGVectorMake(0.5, 0);
    CGVector point2 = CGVectorMake(0.89, 0);
    XCUIElement *slider1 = [self.app.sliders elementBoundByIndex:0];
    XCUICoordinate *coord1 = [slider1 coordinateWithNormalizedOffset:point1];
    XCUICoordinate *coord2 = [slider1 coordinateWithNormalizedOffset:point2];
    NSTimeInterval t = 0.1;
    [coord1 pressForDuration:t thenDragToCoordinate:coord2];
}

// 矢量拖动 --> 在屏幕上拖动(为了看效果专门 拖动 UISlider控件)
-(void)testDragScreen {
    CGVector point1 = CGVectorMake(0.5, 0.69);
    CGVector point2 = CGVectorMake(0.9, 0.69);
    XCUICoordinate *coord1 = [self.app coordinateWithNormalizedOffset:point1];
    XCUICoordinate *coord2 = [self.app coordinateWithNormalizedOffset:point2];
    NSTimeInterval t = 0.1;
    [coord1 pressForDuration:t thenDragToCoordinate:coord2];
}

// 矢量拖动 --> 在屏幕上拖动(
-(void)testDragScreen2 {
    CGVector point1 = CGVectorMake(0.5, 0.8);
    CGVector point2 = CGVectorMake(0.9, 0.8);
    XCUICoordinate *coord1 = [self.app coordinateWithNormalizedOffset:point1];
    XCUICoordinate *coord2 = [self.app coordinateWithNormalizedOffset:point2];
    NSTimeInterval t = 0.1;
    [coord1 pressForDuration:t thenDragToCoordinate:coord2];
}

// 点击坐标点
-(void)testPoint {
    CGPoint p = CGPointMake(100, 100);
    [self customTapElementApp:self.app Point:p pressDuration:0.5];
}

- (void)customTapElementApp:(XCUIApplication *)app Point:(CGPoint)point pressDuration:(NSTimeInterval)duration{
    //CGVectorMake(0.0, 0.0) screen origin
    //dx: 0.0, dy: 0.0 - The "-10" means scroll 10 points down.
    XCUICoordinate *coordinate = [app coordinateWithNormalizedOffset:CGVectorMake(0, 0)];
    [[coordinate coordinateWithOffset:CGVectorMake(point.x, point.y) ] pressForDuration:duration];
}

// 系统弹框
-(void)testSysAlert {
    // 点击系统弹框
    // - Parameter index: 按钮的下标.
    // 下标是从左边开始算起, 0为起始下标.   就比如通知权限, 要同意的话, 就传入 1
    XCUIApplication *sys_app = [[XCUIApplication alloc] initWithBundleIdentifier:@"com.apple.springboard"];
    XCUIElement *sureBtn = sys_app.buttons[@"不允许"];
    //    XCUIElement *sureBtn = [sys_app.alerts.firstMatch.buttons elementBoundByIndex:1];
    if (sureBtn.exists) {
        [sureBtn tap];
    }
    //    XCUIElementQuery *sys1 = [sys_app.alerts.firstMatch childrenMatchingType:XCUIElementTypeButton];
    //    XCUIElement *sysBtn = [sys1 elementMatchingType:XCUIElementTypeButton identifier:@"NotificationShortLookView"];
    //    XCUIElement *sysBtn = sys_app.buttons[@"允许"];
    //    XCUIElement *sysBtn = sys_app.windows.otherElements.alerts.otherElements.otherElements.otherElements.scrollViews.otherElements.otherElements.otherElements.buttons[@"允许"];
    //    if (sysBtn.exists) {
    //        [sysBtn pressForDuration:1];
    //    }
    //    [self customTapElementApp:wx_app Point:CGPointMake(250, 383) pressDuration:0.5];
}

@end
