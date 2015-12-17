//
//  ViewController.m
//  A02.核心动画-CAKeyframeAnimation
//
//  Created by apple on 15-1-5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //添加一个圆
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;

    UIView *circleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenW)];
    circleView.backgroundColor = [UIColor yellowColor];
    //设置圆角
    circleView.layer.cornerRadius = screenW * 0.5;
    
    [self.view addSubview:circleView];
    
    //把图片移到顶部
    [self.view bringSubviewToFront:self.imgView];
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //学习帧动画
    //创建一个帧动画
    CAKeyframeAnimation *animaiton = [CAKeyframeAnimation animation];
    animaiton.keyPath = @"position";
    
    //设置动画执行的路径 指定四个点
    
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(250, 50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(250, 250)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(50, 250)];
    
    //数组第一个是 “开始状态” 最后一个是 "结束状态"
    animaiton.values = @[value1,value2,value3,value4,value1];
    
    //设置时间
    animaiton.duration = 5;
    
    //设置动画节奏
    //kCAMediaTimingFunctionEaseIn 先慢后快
    //kCAMediaTimingFunctionEaseOut 先快后慢
    //kCAMediaTimingFunctionLinear 线性匀速
    //kCAMediaTimingFunctionEaseInEaseOut 中间快两边慢
    animaiton.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
#warning 内部的path的优级大小values优先级
    //设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGPathAddEllipseInRect(path, NULL, CGRectMake(0, 0, screenW, screenW));
    
    animaiton.path = path;
    //c语言的数据类型 如果create/copy/retain创建要释放
    CFRelease(path);
    
    //添加动画
    [self.imgView.layer addAnimation:animaiton forKey:nil];
    
}

@end
