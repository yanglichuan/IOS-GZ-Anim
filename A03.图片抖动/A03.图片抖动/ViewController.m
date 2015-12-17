//
//  ViewController.m
//  A03.图片抖动
//
//  Created by apple on 15-1-5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)start;
- (IBAction)stop;
@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start {
    
    //抖动图片 使用帧动画 设置 旋转的 路径
    
    CAKeyframeAnimation *rotationAni = [CAKeyframeAnimation animation];
    rotationAni.keyPath = @"transform.rotation";
    
    //计算好旋转的弧度
    CGFloat angle = M_PI_4;
    
    //设置 旋转的路径
    rotationAni.values = @[@(-angle),@(angle),@(-angle)];
    
    //设置动画执行的次数
    rotationAni.repeatCount = MAXFLOAT;
    
    [self.imgIcon.layer addAnimation:rotationAni forKey:@"shake"];
}

- (IBAction)stop {
    
    //通过key把动画移除,也就是把动画停止
    [self.imgIcon.layer removeAnimationForKey:@"shake"];
}
@end
