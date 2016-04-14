//
//  WYView.m
//  WYDemo
//
//  Created by 王恕 on 15/12/17.
//  Copyright © 2015年 王恕. All rights reserved.
//

#import "WYView.h"
#import "UIView+Extension.h"
@implementation WYView

//用一个与view相同大小的label和随机背景色初始化视图
- (instancetype)init
{
    self = [super init];
    if (self) {
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:65];
        label.textAlignment = NSTextAlignmentCenter;
        self.label = label;
        [self addSubview:label];
        //arc4random()%255表示0-255之间的随机数
        self.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    }
    return self;
}

//label布局
- (void)layoutSubviews{
    [super layoutSubviews];
    self.label.width = self.width;
    self.label.height = self.height;
    self.label.x = 0;
    self.label.y = 0;
}


@end
