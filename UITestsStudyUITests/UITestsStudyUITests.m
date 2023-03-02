//
//  UITestsStudyUITests.m
//  UITestsStudyUITests
//
//  Created by Geek on 2019/12/22.
//  Copyright © 2019 Geek. All rights reserved.
//

//参考文章:https://www.jianshu.com/p/cb8d5dcb09b4
#import <XCTest/XCTest.h>

@interface UITestsStudyUITests : XCTestCase

@property(nonatomic,strong)XCUIApplication *app;

@end

@implementation UITestsStudyUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _app = [[XCUIApplication alloc]init];
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    
//    [_app launch];
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // UI tests must launch the application that they test.
    
    //获取 UITabBarController 的 Item
//    XCUIElement *tabbar = _app.tabBars.allElementsBoundByIndex[0];
//    XCUIElementQuery *tabbarItems = [tabbar childrenMatchingType:XCUIElementTypeButton];
//    XCUIElement *page0 = [tabbarItems elementBoundByIndex:0];
//    XCUIElement *page1 = [tabbarItems elementBoundByIndex:1];
//    XCUIElement *page2 = [tabbarItems elementBoundByIndex:2];
//    XCUIElement *page3 = [tabbarItems elementBoundByIndex:3];
//    [page1 tap];
//    [page2 tap];
//    [page3 tap];
//    [page0 tap];
    
    NSLog(@"GS: touchBars%@",_app.touchBars.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: groups%@",_app.groups.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: windows%@",_app.windows.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: sheets%@",_app.sheets.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: drawers%@",_app.drawers.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: alerts%@",_app.alerts.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: dialogs%@",_app.dialogs.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: dialogs%@",_app.dialogs.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: radioButtons%@",_app.radioButtons.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: radioGroups%@",_app.radioGroups.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: checkBoxes%@",_app.checkBoxes.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: disclosureTriangles%@",_app.disclosureTriangles.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: popUpButtons%@",_app.popUpButtons.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: comboBoxes%@",_app.comboBoxes.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: menuButtons%@",_app.menuButtons.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: toolbarButtons%@",_app.toolbarButtons.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: popovers%@",_app.popovers.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: keyboards%@",_app.keyboards.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: keys%@",_app.keys.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: navigationBars%@",_app.navigationBars.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: tabBars%@",_app.tabBars.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: tabGroups%@",_app.tabGroups.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: toolbars%@",_app.toolbars.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: statusBars%@",_app.statusBars.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: tables%@",_app.tables.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: tableRows%@",_app.tableRows.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: tableColumns%@",_app.tableColumns.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: outlines%@",_app.outlines.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: outlineRows%@",_app.outlineRows.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: browsers%@",_app.browsers.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: collectionViews%@",_app.collectionViews.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: sliders%@",_app.sliders.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: pageIndicators%@",_app.pageIndicators.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: progressIndicators%@",_app.progressIndicators.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: activityIndicators%@",_app.activityIndicators.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: segmentedControls%@",_app.segmentedControls.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: pickers%@",_app.pickers.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: pickerWheels%@",_app.pickerWheels.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: switches%@",_app.switches.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: toggles%@",_app.toggles.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: links%@",_app.links.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: images%@",_app.images.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: icons%@",_app.icons.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: searchFields%@",_app.searchFields.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: scrollViews%@",_app.scrollViews.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: scrollBars%@",_app.scrollBars.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: staticTexts%@",_app.staticTexts.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: textFields%@",_app.textFields.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: secureTextFields%@",_app.secureTextFields.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: datePickers%@",_app.datePickers.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: textViews%@",_app.textViews.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: menus%@",_app.menus.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: menuItems%@",_app.menuItems.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: menuBars%@",_app.menuBars.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: menuBarItems%@",_app.menuBarItems.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: maps%@",_app.maps.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: webViews%@",_app.webViews.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: steppers%@",_app.steppers.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: incrementArrows%@",_app.incrementArrows.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: decrementArrows%@",_app.decrementArrows.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: tabs%@",_app.tabs.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: timelines%@",_app.timelines.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: ratingIndicators%@",_app.ratingIndicators.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: valueIndicators%@",_app.valueIndicators.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: splitGroups%@",_app.splitGroups.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: splitters%@",_app.splitters.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: relevanceIndicators%@",_app.relevanceIndicators.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: colorWells%@",_app.colorWells.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: helpTags%@",_app.helpTags.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: mattes%@",_app.mattes.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: dockItems%@",_app.dockItems.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: rulers%@",_app.rulers.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: rulerMarkers%@",_app.rulerMarkers.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: grids%@",_app.grids.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: levelIndicators%@",_app.levelIndicators.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: cells%@",_app.cells.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: layoutAreas%@",_app.layoutAreas.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: layoutItems%@",_app.layoutItems.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: handles%@",_app.handles.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: otherElements%@",_app.otherElements.allElementsBoundByAccessibilityElement);
    NSLog(@"GS: statusItems%@",_app.statusItems.allElementsBoundByAccessibilityElement);
    
    
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

//根据在屏幕上的点击 生成对应的手势代码
-(void)testFromGesture{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *tabBar = app.tabBars[@"Tab Bar"];
    [tabBar.buttons[@"Page3"] tap];
    [app.staticTexts[@"点击跳转"] tap];
    [app.navigationBars[@"subPage"].buttons[@"Page3"] tap];
    [tabBar.buttons[@"Page2"] tap];
    
    XCUIElementQuery *tablesQuery = app.tables;
    [tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"0:4"]/*[[".cells.staticTexts[@\"0:4\"]",".staticTexts[@\"0:4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ swipeUp];
    [tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"1:4"]/*[[".cells.staticTexts[@\"1:4\"]",".staticTexts[@\"1:4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
}

-(void)testfindAllButton {
    //  打印当前界面所有的 button
    for (int i = 0; i < self.app.buttons.count; i++) {
        NSLog(@"================== start %d ==================",i);
        XCUIElement *btn = [self.app.buttons elementBoundByIndex:i];
        NSLog(@"%@",btn.debugDescription);// 打印控件的一切信息
        NSLog(@"================== end   %d ==================",i);
    }
}

-(void)testfindAllTextFilds {
    //  打印当前界面所有的 textField
    for (int i = 0; i < self.app.textFields.count; i++) {
        NSLog(@"================== start %d ==================",i);
        XCUIElement *btn = [self.app.textFields elementBoundByIndex:i];
        NSLog(@"%@",btn.debugDescription);// 打印控件的一切信息
        NSLog(@"================== end   %d ==================",i);
    }
}

-(void)testfindAllElement {
    //  打印当前界面所有的 控件
    for (int i = 0; i < self.app.otherElements.count; i++) {
        NSLog(@"================== start %d ==================",i);
        XCUIElement *element = [self.app.otherElements elementBoundByIndex:i];
        NSLog(@"%@",element.debugDescription);// 打印控件的一切信息
        NSLog(@"================== end   %d ==================",i);
    }
}

- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
        // This measures how long it takes to launch your application.
        [self measureWithMetrics:@[XCTOSSignpostMetric.applicationLaunchMetric] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end
