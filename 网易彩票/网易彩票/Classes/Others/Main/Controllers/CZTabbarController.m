//
//  CZTabbarController.m
//  网易彩票
//
//  Created by apple on 15-1-5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CZTabbarController.h"

@interface CZTabbarController ()

/**
 *  当前选中的按钮
 */
@property(nonatomic,weak)UIButton *selectedBtn;

@end

@implementation CZTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%s",__func__);
    
    //自己写一个tabbar 替换 系统Tabbar
    //自定义一个tabbar
    UIView *mTabbar = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    mTabbar.backgroundColor = [UIColor redColor];
    
    //按钮宽度与高度
    CGFloat btnW = self.tabBar.bounds.size.width / 5;
    CGFloat btnH = self.tabBar.bounds.size.height;
    
    //自定义的tabbar添加5个按钮
    for (NSInteger i = 0; i < 5; i++) {
        // 获取普通状态的图片名称
        NSString *normalImg = [NSString stringWithFormat:@"TabBar%d", i+1];

        // 获取选中的图片
        NSString *selImg = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:normalImg] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:selImg] forState:UIControlStateSelected];
        
        //设置按钮的frm
        btn.frame = CGRectMake(btnW * i, 0, btnW, btnH);
        
        //监听事件
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        //绑定tag
        btn.tag = i;
        [mTabbar addSubview:btn];
        
        //默认选中第一个按钮为选中
        if (i == 0) {
            btn.selected = YES;
            self.selectedBtn = btn;
        }
        
    }
    
    //把自定义的tabbar添加到 系统的tabbar上
    [self.tabBar addSubview:mTabbar];
}


#pragma marp 自定义tabbar按钮的监听
-(void)btnClick:(UIButton *)btn{
    NSLog(@"%d",btn.tag);
    
    //取消之前选中
    self.selectedBtn.selected = NO;
    
    //设置当前选中
    btn.selected = YES;
    self.selectedBtn = btn;
    
    //切换 tabbar的子控制器
    //设置tabbar控制器的selectedIndex属性就能切换子控制器
    self.selectedIndex = btn.tag;

}
@end
