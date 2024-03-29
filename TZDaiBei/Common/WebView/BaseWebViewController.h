//
//  BaseWebViewController.h
//  JingYuDaiJieKuan
//
//  Created by fireflies on 2018/4/9.
//  Copyright © 2018年 Jincaishen. All rights reserved.
//

#import "RootViewController.h"
#import <WebKit/WebKit.h>

@interface BaseWebViewController : RootViewController

@property (nonatomic,strong)WKWebView *webView;

@property(nonatomic,copy)NSString *url;

@property (copy, nonatomic)void (^testSuccssBlock)(void);

/// 加载完成的回调
@property (copy, nonatomic)void (^didFinishBlock)(void);

// 底部 返回按钮 ：nil 不显示
@property (nonatomic,copy) NSString * bottomBtnTitleStr;

@end
