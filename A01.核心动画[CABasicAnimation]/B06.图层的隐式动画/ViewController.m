//
//  ViewController.m
//  B06.图层的隐式动画
//
//  Created by apple on 15-1-4.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
   
    
    [self testTransformScaleAnnimation];
    
}

#pragma mark 测试形变的 "缩放" 的动画
-(void)testTransformScaleAnnimation{
    //核心动画使用步骤
    //1.创建一个动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    //设置动画类型 -》 keyPath设置图层的属性 bounds/position/transform。。。。
    animation.keyPath = @"transform.scale.x";
    
    // 设置动画的时间
    animation.duration = 3;
    
    //动画执行的 "初始状态"
    
    
    //动画执行的 "最终状态"
    
    
    
    //每次动画执行的  "增加值"
    //byValue的数据类型 由 keyPath 决定
    animation.byValue = @1.5;
    
    
    //保存动画执行状态
    //解决方案2：使动画保存执行之后的状态，只要设置动画的两个属性
    animation.removedOnCompletion = NO;//动画对象不要移除
    animation.fillMode = kCAFillModeForwards;//保存当前的状态
    
    
    //2.往控件的图层添加动画
    [self.imageView.layer addAnimation:animation forKey:nil];
}

#pragma mark 测试形变的 "旋转" 的动画
-(void)testTransformRoationAnnimation{
    //核心动画使用步骤
    //1.创建一个动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    //设置动画类型
    animation.keyPath = @"transform.rotation.x";
    
    //动画执行的 "初始状态"
    
    
    //动画执行的 "最终状态"
    
    
    
    //每次动画执行的  "增加值"
    //byValue的数据类型 由 keyPath 决定
    animation.byValue = @(M_PI_4);
    
    
    //保存动画执行状态
    //解决方案2：使动画保存执行之后的状态，只要设置动画的两个属性
    animation.removedOnCompletion = NO;//动画对象不要移除
    animation.fillMode = kCAFillModeForwards;//保存当前的状态
    
    
    //2.往控件的图层添加动画
    [self.imageView.layer addAnimation:animation forKey:nil];
}

#pragma mark 测试形变的 "平移" 的动画
-(void)testTransformTranslationAnnimation{
    //核心动画使用步骤
    //1.创建一个动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    //设置动画类型
    //animation.keyPath = @"transform.translation";
    animation.keyPath = @"transform.translation.x";
    
    //动画执行的 "初始状态"
   
    
    //动画执行的 "最终状态"
   
    
    
    //每次动画执行的  "增加值"
    //animation.byValue = [NSValue valueWithCGPoint:CGPointMake(10, 10)];
    //byValue的数据类型 由 keyPath 决定
    animation.byValue = @10;
   
    
    //保存动画执行状态
    //解决方案2：使动画保存执行之后的状态，只要设置动画的两个属性
    animation.removedOnCompletion = NO;//动画对象不要移除
    animation.fillMode = kCAFillModeForwards;//保存当前的状态
    
    
    //2.往控件的图层添加动画
    [self.imageView.layer addAnimation:animation forKey:nil];
}


#pragma mark 测试位置的动画
-(void)testPositionAnnimation{
    //核心动画使用步骤
    //1.创建一个动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    //设置动画类型
    animation.keyPath = @"position";
    
    //动画执行的 "初始状态"
    //animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    
    //动画执行的 "最终状态"
    //animation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 250)];
    
    
    //每次动画执行的  "增加值"
    animation.byValue = [NSValue valueWithCGPoint:CGPointMake(10, 10)];
    
    //保存动画执行状态
    //解决方案2：使动画保存执行之后的状态，只要设置动画的两个属性
    animation.removedOnCompletion = NO;//动画对象不要移除
    animation.fillMode = kCAFillModeForwards;//保存当前的状态
    
    
    //2.往控件的图层添加动画
    [self.imageView.layer addAnimation:animation forKey:nil];
}

#pragma mark 测试尺寸的动画
-(void)testBoundsAnnimation{
    //核心动画使用步骤
    //1.创建一个动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    
#warning 核心动画，只是一个假象，真实的大小是没有变化，
    /*
     *解决方案1：如果想控件的大小真实改变，要在动画结束之后设置控件的尺寸
     *解决方案2：使动画保存执行之后的状态，默认动画执行完后，会返回原来的状态
     */
    
    
    //设置图层的 "属性"来 决定 "动画类型"
    //bounds 图层的尺寸动画
    animation.keyPath = @"bounds";
    
    //设置bounds尺寸变化后的大小
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 150, 150)];
    
    //解决方案1： 动画的代理
    //animation.delegate = self;
    
    //解决方案2：使动画保存执行之后的状态，只要设置动画的两个属性
    animation.removedOnCompletion = NO;//动画对象不要移除
    animation.fillMode = kCAFillModeForwards;//保存当前的状态
    
    
    //2.往控件的图层添加动画
    [self.imageView.layer addAnimation:animation forKey:nil];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.imageView.bounds = CGRectMake(0, 0, 150, 150);
}
@end
