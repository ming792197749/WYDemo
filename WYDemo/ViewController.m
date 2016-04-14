//
//  ViewController.m
//  WYDemo
//
//  Created by 王恕 on 15/12/16.
//  Copyright © 2015年 王恕. All rights reserved.
//

#import "ViewController.h"
#import "HACursor.h"
#import "UIView+Extension.h"
#import "WYView.h"
#import "webView.h"
@interface ViewController ()

@property (nonatomic,strong) NSArray *titles;
@property (nonatomic,strong) NSMutableArray *pageView;

@end

@implementation ViewController
@synthesize titles,pageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    titles = @[@"网易",@"新浪",@"腾讯",@"苹果",@"搜狐",@"淘宝",@"京东",@"百度",@"有道",@"小米",@"华为",@"三星"];
    HACursor *cursor = [[HACursor alloc]init];
    cursor.frame = CGRectMake(0,20, self.view.width, 45);
    cursor.titles = titles;
    cursor.backgroundColor = [UIColor cyanColor];
    //每个子视图显示的内容
    cursor.pageViews = [self createPageViews];
    //设置根滚动视图的高度
    cursor.rootScrollViewHeight = self.view.frame.size.height - 109;
    //默认值是白色
    cursor.titleNormalColor = [UIColor blackColor];
    //默认值是白色
    cursor.titleSelectedColor = [UIColor redColor];
    cursor.showSortbutton = YES;
    //默认的最小值是5，小于默认值的话按默认值设置
    cursor.minFontSize = 14;
    cursor.maxFontSize = 16;
    //cursor.defFontSize = 13;
    
    [self.view addSubview:cursor];
    
}

- (NSMutableArray *)createPageViews{
    NSMutableArray *pageViews = [NSMutableArray array];
    NSArray *webViewArray = @[@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com",@"http://www.baidu.com"];
   //分别展示每个page下面的webView
    for (NSInteger i = 0; i < self.titles.count; i++) {
        
        webView *web = [[webView alloc]init];
        NSString *str = [NSString stringWithFormat:@"%@",[webViewArray objectAtIndex:i]];
        NSURL *url = [NSURL URLWithString:str];
        NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
        [web loadRequest:urlRequest];
        
        [pageViews addObject:web];
    }
    return pageViews;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
