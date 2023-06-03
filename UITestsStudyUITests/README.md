# UITests 整理

## 控件对应的 element
UITextFiled                                         textFields
UITextField (secureTextEntry = YES 的密码形态)        secureTextFields
UITextView                                          textViews
UISearchTextField                                   searchFields
UIButton                                            buttons
UITableView                                         tables
UIScrollView                                        scrollViews
UISteper                                            steppers
KeyBoard                                            keyboards


## 常用方法
/*!
@discussion
Provides debugging information about the query. The data in the string will vary based on the time
at which it is captured, but it may include any of the following as well as additional data:
• A description of each step of the query.
• Information about the inputs and matched outputs of each step of the query.
This data should be used for debugging only - depending on any of the data as part of a test is unsupported.
*/
@property (readonly, copy) NSString *debugDescription;


/*! Test to determine if the element exists. */
@property (readonly) BOOL exists;

/*! Whether or not a hit point can be computed for the element for the purpose of synthesizing events. */
@property (readonly, getter = isHittable) BOOL hittable;

/*!
* @method -waitForExpectationsWithTimeout:handler:
*
* @param timeout
* The amount of time within which all expectations must be fulfilled.
*
* @param handler
* If provided, the handler will be invoked both on timeout or fulfillment of all
* expectations. Timeout is always treated as a test failure.
*
* @discussion
* -waitForExpectationsWithTimeout:handler: creates a point of synchronization in the flow of a
* test. Only one -waitForExpectationsWithTimeout:handler: can be active at any given time, but
* multiple discrete sequences of { expectations -> wait } can be chained together.
*
* -waitForExpectationsWithTimeout:handler: runs the run loop while handling events until all expectations
* are fulfilled or the timeout is reached. Clients should not manipulate the run
* loop while using this API.
*/
- (void)waitForExpectationsWithTimeout:(NSTimeInterval)timeout handler:(nullable XCT_SWIFT_SENDABLE XCWaitCompletionHandler)handler;

/*! Returns an element that will use the index into the query's results to determine which underlying accessibility element it is matched with. */
- (XCUIElement *)elementBoundByIndex:(NSUInteger)index;

/*! Returns an element that matches the type and identifier. */
- (XCUIElement *)elementMatchingType:(XCUIElementType)elementType identifier:(nullable NSString *)identifier;

/*! Immediately evaluates the query and returns an array of elements bound by the index of each result. */
@property (readonly, copy) NSArray<XCUIElement *> *allElementsBoundByIndex;

/*! 
取某种类型的元素以及它的子类集合
Returns a query for all descendants of the element matching the specified type. 
*/
- (XCUIElementQuery *)descendantsMatchingType:(XCUIElementType)type;

/*! 
取某种类型的元素集合，不包含它的子类
Returns a query for direct children of the element matching the specified type. 
*/
- (XCUIElementQuery *)childrenMatchingType:(XCUIElementType)type;

/*!
* Launches the application synchronously. On return the application ready to handle events. If the
* application is already running, the existing instance will be terminated to ensure a clean state
* for the launched instance.
*
* Any failure in the launch sequence will be reported as a test failure and the test will be halted
* at that point.
*/
- (void)launch;

/*!
* Activates the application synchronously. On return the application is ready to handle events.
* If the application was not running prior, it will be launched automatically. If the application
* would be launched as a result of this method and was previously launched via -launch, the launch
* arguments and environment variables that were used then will be supplied again for the new launch.
*
* Unlike -launch, if the application is already running this call will not terminate the existing
* instance.
*
* Any failure in the activation or launch sequence will be reported as a test failure and the test
* will be halted at that point.
*/
- (void)activate;

/*!
* Terminates any running instance of the application. If the application has an existing debug session
* via Xcode, the termination is implemented as a halt via that debug connection. Otherwise, a SIGKILL
* is sent to the process.
*/
- (void)terminate;

/*!
* Sends a tap event to a hittable point computed for the element.
*/
- (void)tap API_UNAVAILABLE(tvos);

/*!
* Sends a double tap event to a hittable point computed for the element.
*/
- (void)doubleTap API_UNAVAILABLE(tvos);

/*!
* Sends a long press gesture to a hittable point computed for the element, holding for the specified duration.
*
* @param duration
* Duration in seconds.
*/
- (void)pressForDuration:(NSTimeInterval)duration API_UNAVAILABLE(tvos);

/*!
* Initiates a press-and-hold gesture that then drags to another element, suitable for table cell reordering and similar operations.
* @param duration
* Duration of the initial press-and-hold.
* @param otherElement
* The element to finish the drag gesture over. In the example of table cell reordering, this would be the reorder element of the destination row.
*/
- (void)pressForDuration:(NSTimeInterval)duration thenDragToElement:(XCUIElement *)otherElement API_UNAVAILABLE(tvos);

/*!
* Initiates a press-and-hold gesture that then drags to another element with a custom velocity and then holds, suitable for table cell reordering and similar operations.
* @param duration
* Duration of the initial press-and-hold.
* @param otherElement
* The element to finish the drag gesture over. In the example of table cell reordering, this would be the reorder element of the destination row.
* @param velocity
* The velocity pixels per second at which to drag the element.
* @param holdDuration
* The duration of the final hold.
*/
- (void)pressForDuration:(NSTimeInterval)duration thenDragToElement:(XCUIElement *)otherElement withVelocity:(XCUIGestureVelocity)velocity thenHoldForDuration:(NSTimeInterval)holdDuration API_UNAVAILABLE(tvos);


/*!
* Sends a swipe-up gesture.
*/
- (void)swipeUp;

/*!
* Sends a swipe-down gesture.
*/
- (void)swipeDown;

/*!
* Sends a swipe-left gesture.
*/
- (void)swipeLeft;

/*!
* Sends a swipe-right gesture.
*/
- (void)swipeRight;

/*! Manipulates the UI to change the displayed value of the slider to one based on a normalized position. 0 corresponds to the minimum value of the slider, 1 corresponds to its maximum value. The adjustment is a "best effort" to move the indicator to the desired position; absolute fidelity is not guaranteed. */
- (void)adjustToNormalizedSliderPosition:(CGFloat)normalizedSliderPosition;


## 注意:待测试项目中禁止播放动画,可以让点自动化脚本更流畅
[UIView setAnimationsEnabled:NO];
