//
//  TouchViewController.m
//  UITestsStudy
//
//  Created by Dio Brand on 2023/4/17.
//

#import "TouchViewController.h"

@interface TouchViewController ()

@property (weak, nonatomic) IBOutlet UILabel *startPoint;
@property (weak, nonatomic) IBOutlet UILabel *currentPoint;
@property (weak, nonatomic) IBOutlet UILabel *endPoint;

@end

@implementation TouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setImageView];
    [self setImageView2];
}

-(void)setImageView {
    UIImageView *imgV = [[UIImageView alloc] init];
//    imgV.backgroundColor = [UIColor cyanColor];
    imgV.frame = CGRectMake(100, 250, 150, 150);
//    imgV.center = self.view.center;
    
    UIImage *img = [UIImage imageNamed:@"test"];
    imgV.image = img;
    [self.view addSubview:imgV];
}

-(void)setImageView2 {
    UIImageView *imgV = [[UIImageView alloc] init];
    imgV.backgroundColor = [UIColor cyanColor];
    imgV.frame = CGRectMake(100, 400, 150, 150);
    [self.view addSubview:imgV];
}

//滑动开始事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"触摸开始了");
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];//获得初始的接触点
    //以字符的形式输出触摸起始点
    NSString *tip = [NSString stringWithFormat:@"起始点的坐标:(%f,%f)", point.x, point.y];
    [self.startPoint setText:tip];
    NSLog(@"%@", tip);
}

// 滑动过程中的坐标
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"触摸过程中....");
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];//获得初始的接触点
    //以字符的形式输出触摸起始点
    NSString *tip = [NSString stringWithFormat:@"当前的坐标:(%f,%f)", point.x, point.y];
    [self.currentPoint setText:tip];
    NSLog(@"%@", tip);
}

//滑动结束处理事件
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"触摸结束了");
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];  //获得滑动后最后接触屏幕的点
    //以字符的形式输出触结束摸点
    NSString *tip = [NSString stringWithFormat:@"结束点的坐标:(%f,%f)", point.x, point.y];
    [self.endPoint setText:tip];
    NSLog(@"%@", tip);
}

@end
