//
//  GSPageViewController0.m
//  GSUITestDemo
//
//  Created by gersces on 2018/8/29.
//  Copyright © 2018年 gersces. All rights reserved.
//

#import "PageViewController0.h"
#import "NextViewController.h"

@interface PageViewController0 ()

@end

@implementation PageViewController0

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"点击跳转" style:UIBarButtonItemStylePlain target:self action:@selector(jumpNextPage)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    UILabel *tapLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 100, 345, 30)];
    tapLabel.backgroundColor = [UIColor redColor];
    tapLabel.textAlignment = NSTextAlignmentCenter;
    tapLabel.text = @"单击";
    [self.view addSubview:tapLabel];
    tapLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [tapLabel addGestureRecognizer:tap];
    
    
    UILabel *doubleTapLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 150, 345, 30)];
    doubleTapLabel.backgroundColor = [UIColor orangeColor];
    doubleTapLabel.textAlignment = NSTextAlignmentCenter;
    doubleTapLabel.text = @"双击";
    [self.view addSubview:doubleTapLabel];
    doubleTapLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapAction:)];
    doubleTap.numberOfTapsRequired = 2;
    [doubleTapLabel addGestureRecognizer:doubleTap];
    
    
    UILabel *longLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 200, 345, 30)];
    longLabel.backgroundColor = [UIColor yellowColor];
    longLabel.textAlignment = NSTextAlignmentCenter;
    longLabel.text = @"长按";
    [self.view addSubview:longLabel];
    longLabel.userInteractionEnabled = YES;
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressAction:)];
    longPress.minimumPressDuration = 1.0;
    [longLabel addGestureRecognizer:longPress];
    
    
    UILabel *swipeLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 250, 345, 30)];
    swipeLabel.backgroundColor = [UIColor greenColor];
    swipeLabel.textAlignment = NSTextAlignmentCenter;
    swipeLabel.text = @"轻扫(right)";
    [self.view addSubview:swipeLabel];
    swipeLabel.userInteractionEnabled = YES;
    swipeLabel.accessibilityIdentifier = @"swipeRight";
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [swipeLabel addGestureRecognizer:swipe];
    
    
    UIScrollView *scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(15, 300, 345, 80)];
    scroller.pagingEnabled = YES;
    scroller.contentSize = CGSizeMake(345*3, 80);
    [self.view addSubview:scroller];
    NSArray *colors = @[[UIColor blueColor],[UIColor cyanColor],[UIColor purpleColor]];
    for (int i = 0; i < 3; i ++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(345*i, 0, 345, 80)];
        view.backgroundColor = colors[i];
        [scroller addSubview:view];
    }
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"按钮点击" forState:UIControlStateNormal];
    button.frame = CGRectMake(15, 400, 345, 30);
    [button setBackgroundColor:[UIColor purpleColor]];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self setSlider];
}

-(void)jumpNextPage {
    NextViewController *vc = [[NextViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.title = @"subPage";
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)setSlider {
    //初始化方法
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 460, self.view.frame.size.width, 30)];
    [self.view addSubview:slider];
    
    //指定附加到滑块断点的值,最小值表示滑块的前端,最大值表示滑块的尾端
    slider.maximumValue = 100;
    slider.minimumValue = 0;
    
    //设置滑块的初始值,该值必须位于最大值和最小值之间
    slider.value = 50;
    //设置滑块滑动到最小值时的图像，如果空白，则不显示图像
//    slider.minimumValueImage = [UIImage imageNamed:@"tab_mine_50"];
    //设置滑块滑动到最大值时的图像，如果空白，则不显示图像
//    slider.maximumValueImage = [UIImage imageNamed:@"tab_team_50"];
    //设置最小值前端滑杆的颜色
    slider.minimumTrackTintColor = [UIColor yellowColor];
    //    设置最大值右端的滑杆的颜色
    slider.maximumTrackTintColor = [UIColor greenColor];
    //设置滑块值的更改是否是连续事件,该值默认为YES
    [slider setContinuous:NO];
    
    //添加触发事件
    [slider addTarget:self action:@selector(sliderValurChanged:) forControlEvents:(UIControlEventValueChanged)];
}

// 获取滑块数值
- (void)sliderValurChanged:(UISlider*)sender {
    NSString *value = [NSString stringWithFormat:@"%f",sender.value];
    NSLog(@"%@",value);
    [self showAlertWithTitle:value];
}

- (void)tapAction:(UITapGestureRecognizer *)sender{
    [self showAlertWithTitle:@"单击"];
}

- (void)doubleTapAction:(UITapGestureRecognizer *)sender{
    [self showAlertWithTitle:@"双击"];
}

- (void)longPressAction:(UILongPressGestureRecognizer *)sender{
    [self showAlertWithTitle:@"长按"];
}

- (void)swipeAction:(UISwipeGestureRecognizer *)sender{
    [self showAlertWithTitle:@"轻扫"];
}

-(void)click:(UIButton *)sender {
    [self showAlertWithTitle:@"按钮点击"];
}

- (void)showAlertWithTitle:(NSString *)title{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
