//
//  ViewController.m
//  B02.动画总结
//
//  Created by apple on 15-1-5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //打印中心点 position anchorPoint
#warning 默认情况，"图层的position" 就是 "控件的中心点"
    NSLog(@"中心点 %@",NSStringFromCGPoint(self.imageView.center));
    NSLog(@"position %@",NSStringFromCGPoint(self.imageView.layer.position));
    NSLog(@"anchorPoint %@",NSStringFromCGPoint(self.imageView.layer.anchorPoint));
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //动画总结
    

    [self test4];
    
    
}

//4.核心动画
-(void)test4{
    
//    self.imageView.image = [UIImage imageNamed:@"2.jpg"];
//    
//    //转场动画
//    CATransition *animation = [CATransition animation];
//    animation.type = @"push";
//    
//    [self.imageView.layer addAnimation:animation forKey:nil];
    
    //核心动画是一个假象
    //平移动画
    CABasicAnimation *positionAni = [CABasicAnimation animation];
    positionAni.keyPath = @"position";
    
    
    NSLog(@"核心动画执行之前的positon %@",NSStringFromCGPoint(self.imageView.layer.position));
    positionAni.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    
    //核心动画　要监听动画完成　设置代理
#warning 核心动画的代理是 NSObject的分类，所以不需要遵守协议
    positionAni.delegate = self;
    [self.imageView.layer addAnimation:positionAni forKey:nil];
}

#pragma mark 核心动画的代理
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //NSLog(@"动画执行完成");
    NSLog(@"核心动画执行之后的positon %@",NSStringFromCGPoint(self.imageView.layer.position));

}

//3.UIView的转场动画
-(void)test3{

//    UIViewAnimationOptionTransitionFlipFromLeft    = 1 << 20,
//    UIViewAnimationOptionTransitionFlipFromRight   = 2 << 20,
//    UIViewAnimationOptionTransitionCurlUp          = 3 << 20,
//    UIViewAnimationOptionTransitionCurlDown        = 4 << 20,
//    UIViewAnimationOptionTransitionCrossDissolve   = 5 << 20,
//    UIViewAnimationOptionTransitionFlipFromTop     = 6 << 20,
//    UIViewAnimationOptionTransitionFlipFromBottom  = 7 << 20,
    [UIView transitionWithView:self.imageView duration:3 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        //更改image的图片
        self.imageView.image = [UIImage imageNamed:@"2.jpg"];
    } completion:^(BOOL finished) {
        NSLog(@"动画执行完成");
    }];
    
    
    
}

//2.UIView的block动画
-(void)test2{
    
    [UIView animateWithDuration:3 animations:^{
        self.imageView.center = CGPointMake(200, 280);
    } completion:^(BOOL finished) {
        NSLog(@"动画完成");
    }];

}

//1.UIView动画
-(void)test1{
    [UIView beginAnimations:nil context:nil];
    //设置时间
    [UIView setAnimationDuration:3];
    
    //监听动画的完成
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(stop)];
    
    //实现动画代码
    self.imageView.center = CGPointMake(200, 280);
    [UIView commitAnimations];
}
-(void)stop{
    NSLog(@"%s",__func__);
}
@end
