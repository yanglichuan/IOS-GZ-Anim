//
//  ViewController.m
//  A05.核心动画-CAAnimationGroup
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
  }

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // 有一张图片，同时可以有平移、旋转、缩放的效果
    // 实现这个效果 使用组动画[CAAnimationGroup]
    
    //组动画怎么使用
    //1.创建对象
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    //2.往里面添加多个动画
    //2.1平移动画
    CABasicAnimation *positionAni = [CABasicAnimation animation];
    positionAni.keyPath = @"position";
    positionAni.toValue = [NSValue valueWithCGPoint:CGPointMake(250, 250)];
    
    //2.2旋转效果
    CABasicAnimation *rotationAni = [CABasicAnimation animation];
    rotationAni.keyPath = @"transform.rotation";
    rotationAni.toValue = @(M_PI_2);
    
    
    //2.3缩放效果
    CABasicAnimation *scaleAni = [CABasicAnimation animation];
    scaleAni.keyPath = @"transform.scale";
    scaleAni.toValue = @(0.5);
    
    group.duration = 3;
    group.animations = @[positionAni,rotationAni,scaleAni];
    
    //3.把组动画添加到图层上
    [self.imgView.layer addAnimation:group forKey:nil];
    

    
}
@end
