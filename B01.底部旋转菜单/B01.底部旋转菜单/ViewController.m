//
//  ViewController.m
//  B01.底部旋转菜单
//
//  Created by apple on 15-1-5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "CZBottomMenu.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //添加底部View
    CZBottomMenu *menu = [CZBottomMenu buttomMenu];

    CGFloat menuX = 0;
    CGFloat menuY = self.view.bounds.size.height - menu.bounds.size.height;
    CGFloat menuW = self.view.bounds.size.width;
    CGFloat menuH = menu.bounds.size.height;
    menu.frame = CGRectMake(menuX, menuY, menuW, menuH);
    
    [self.view addSubview:menu];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
