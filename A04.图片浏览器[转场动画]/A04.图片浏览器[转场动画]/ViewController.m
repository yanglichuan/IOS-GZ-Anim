//
//  ViewController.m
//  A04.图片浏览器[转场动画]
//
//  Created by apple on 15-1-5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

#define AnimationDuration 2

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
- (IBAction)tapView:(UITapGestureRecognizer *)sender;

@property(nonatomic,strong)NSMutableArray *imgs;

@property(nonatomic,assign)NSInteger currentImgIndex;//当前图片的索引

@end

@implementation ViewController


-(NSMutableArray *)imgs{
    if (!_imgs) {
        _imgs = [NSMutableArray array];
        for (NSInteger i = 1; i < 10; i++) {
            NSString *imgName = [NSString stringWithFormat:@"%ld.jpg",i];
            [_imgs addObject:imgName];
        }
    }
    
    return _imgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",self.imgs);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapView:(UITapGestureRecognizer *)tap {
    
    // 实现判断图片的左半边还是右半边点击
    
    //获取触摸点
    CGPoint point = [tap locationInView:tap.view];
    NSLog(@"%@",NSStringFromCGPoint(point));
    
    if (point.x <= tap.view.bounds.size.width * 0.5) {
        NSLog(@"上一张");
        [self previous];
    }else{
        NSLog(@"下一张");
        [self next];
    }
}


-(void)previous{
    //判断当前图片是不是第一张
    if(self.currentImgIndex == 0){
        NSLog(@"已经是第一张");
        return;
    }
    
    //减索引 改图片
    self.currentImgIndex --;
    
    self.imgView.image = [UIImage imageNamed:self.imgs[self.currentImgIndex]];
    
    //转场动画
    CATransition *animation = [CATransition animation];
    animation.type = @"push";
    //默认就是fromLeft
    animation.subtype = @"fromLeft";
    
    animation.duration = AnimationDuration;
    
    [self.imgView.layer addAnimation:animation forKey:nil];


}

/**
 * 提示:转场的动画的类型（type）和子头型(subtype) 能用字符串常量就用字符常量
 */


/**
 *******************************************************
 type:动画类型(比如：滴水效果，翻转效果...)
 -------------------------------------------------------
 fade kCATransitionFade 交叉淡化过渡
 moveIn kCATransitionMoveIn 新视图移到旧视图上面
 push kCATransitionPush 新视图把旧视图推出去
 reveal kCATransitionReveal 将旧视图移开,显示下面的新视图
 pageCurl               向上翻一页
 pageUnCurl             向下翻一页
 rippleEffect             滴水效果
 suckEffect 收缩效果，如一块布被抽走
 cube                   立方体效果
 oglFlip              上下左右翻转效果
 rotate     旋转效果
 cameraIrisHollowClose 相机镜头关上效果(不支持过渡方向)
 cameraIrisHollowOpen 相机镜头打开效果(不支持过渡方向)
 
 *******************************************************
 subtype: 动画方向(比如说是从左边进入，还是从右边进入...)
 ------------------------------------------------------
 kCATransitionFromRight;
 kCATransitionFromLeft;
 kCATransitionFromTop;
 kCATransitionFromBottom;
 
 当 type 为@"rotate"(旋转)的时候,它也有几个对应的 subtype,分别为:
 90cw 逆时针旋转 90°
 90ccw 顺时针旋转 90°
 180cw 逆时针旋转 180°
 180ccw  顺时针旋转 180°
 **/
-(void)next{
    
    //判断当前图片是不是最后一张
    if (self.currentImgIndex == self.imgs.count - 1) {
        NSLog(@"已经是最后一张");
        return;
    }
    
    //加索引 改图片
    self.currentImgIndex ++;
    
    self.imgView.image = [UIImage imageNamed:self.imgs[self.currentImgIndex]];
    
    //切换图片的时候，使用转场动画
    CATransition *annimation = [CATransition animation];
    
    //设置转场动画的类型
    //`fade', 渐变
    //`moveIn', `push' and `reveal'
    annimation.type = @"rotate";
    
    //设置转卖动画的子类型
//    fromLeft', 动画由左边开始
//    `fromRight', 动画由右边开始
//`fromTop' and
//    * `fromBottom'
    annimation.subtype = @"90cw";
    
    annimation.duration = 3;
    
    [self.imgView.layer addAnimation:annimation forKey:nil];
    
    
    
}
@end
