//
//  Touch.m
//  UITestsStudyUITests
//
//  Created by Dio Brand on 2023/4/17.
//

#import <XCTest/XCTest.h>

@interface P3TouchSimulate : XCTestCase

@property(nonatomic,strong)XCUIApplication *app;

@end

@implementation P3TouchSimulate

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    NSString *bundleID = @"cn.jobs8.UITestsStudy";//@"com.tencent.xin";
    _app = [[XCUIApplication alloc] initWithBundleIdentifier:bundleID];
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

// 矢量拖动 --> 在屏幕上拖动
-(void)testDragScreen {
    CGVector point1 = CGVectorMake(0.5, 0.69);
    CGVector point2 = CGVectorMake(0.9, 0.69);
    XCUICoordinate *coord1 = [self.app coordinateWithNormalizedOffset:point1];
    XCUICoordinate *coord2 = [self.app coordinateWithNormalizedOffset:point2];
    NSTimeInterval t = 0.1;
    [coord1 pressForDuration:t thenDragToCoordinate:coord2];
}

// 矢量拖动 --> 在屏幕上拖动
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
    XCUICoordinate *coordinate1 = [app coordinateWithNormalizedOffset:CGVectorMake(0, 0)];//取从标系统(0,0)的矢量
    XCUICoordinate *coordinate2 = [coordinate1 coordinateWithOffset:CGVectorMake(point.x, point.y)];//取 point点 相对(0,0) 的矢量
    [coordinate2 pressForDuration:duration];
}

// 根据坐标点,从A点滑动到B点
-(void)testDrag {
    CGPoint startPoint = CGPointMake(80, 80);
    CGPoint endPoint = CGPointMake(300, 666);
    [self customDragElementApp:self.app startPoint:startPoint endPoint:endPoint pressDuration:2];
}

- (void)customDragElementApp:(XCUIApplication *)app startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint pressDuration:(NSTimeInterval)duration{
    //CGVectorMake(0.0, 0.0) screen origin
    //dx: 0.0, dy: 0.0 - The "-10" means scroll 10 points down.
    XCUICoordinate *zero_coordinate = [app coordinateWithNormalizedOffset:CGVectorMake(0, 0)];//取从标系统(0,0)的矢量
    XCUICoordinate *start_coordinate = [zero_coordinate coordinateWithOffset:CGVectorMake(startPoint.x, startPoint.y)];//取 point点 相对(0,0) 的矢量
    XCUICoordinate *end_coordinate = [zero_coordinate coordinateWithOffset:CGVectorMake(endPoint.x, endPoint.y)];//取 point点 相对(0,0) 的矢量
    [start_coordinate pressForDuration:duration thenDragToCoordinate:end_coordinate];
}

@end
