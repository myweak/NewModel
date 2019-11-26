//
//  WKWebView+Extension.m
//  WYBasisKit
//
//  Created by jacke-xu on 2017/6/6.
//  Copyright © 2017年 jacke-xu. All rights reserved.
//

#import "WKWebView+Extension.h"
#include <objc/runtime.h>

@interface WKWebView ()<WKNavigationDelegate,WKUIDelegate>

@property (nonatomic, strong) UIProgressView *progressView;

@property (nonatomic, strong) UIBarButtonItem *backBarItem;
@property (nonatomic, strong) UIBarButtonItem *closeBarItem;
@property (nonatomic, weak)   UIViewController *currentVC;
@end

@implementation WKWebView (Extension)


- (void)addBackBarItem {
  
    if (self.backBarItem == nil) {
        UIImage *img = R_ImageName(@"wkkeeper_pubilc_back_black");
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];;
        [button setImage:img forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [button sizeToFit];
        button.width = 20.f;
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -5.f, 0, 0);
        button.height = 44.f;
        self.backBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
}

- (void)addCloseBarItem {
    if (self.closeBarItem == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitle:@"关闭" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(closeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [button sizeToFit];
        button.width = 44.f;
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -30.f, 0, 0);
        button.height = 44.f;
        self.closeBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
}

- (void)closeButtonPressed:(UIButton *)button {
    
    [self.currentVC.navigationController popViewControllerAnimated:YES];
}

- (void)backBarButtonPressed:(UIButton *)button {
    
    if ([self canGoBack]) {
        [self goBack];
    }
    else {
        [self.currentVC.navigationController popViewControllerAnimated:YES];
    }
}


- (void)updateBarButtons {
    
    if ([self canGoBack]) {
        self.currentVC.navigationItem.leftBarButtonItems = @[self.backBarItem,self.closeBarItem];
    } else {
        self.currentVC.navigationItem.leftBarButtonItems = @[self.backBarItem];
    }
}



- (void)showProgressWithColor:(UIColor *)color {
    
    self.currentVC = [UIViewController visibleViewController];
    [self addBackBarItem];
    [self addCloseBarItem];
    
    [self updateBarButtons];
    //进度条初始化
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1)];
    //设置进度条上进度的颜色
    self.progressView.progressTintColor = (color != nil) ? color : [UIColor blueColor];
    //设置进度条背景色
    self.progressView.trackTintColor = [UIColor clearColor];
    //设置进度条的高度，下面这句代码表示进度条的宽度变为原来的1倍，高度变为原来的1倍.
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    [self addSubview:self.progressView];
    
    [self addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    [self addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];

    
    self.navigationDelegate = self;
    self.UIDelegate = self;

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if (object == self && [keyPath isEqualToString:@"title"]) {
        [UIViewController visibleViewController].title = self.title;
    }
    
    if(self.progressView != nil) {
        
        if (object == self && [keyPath isEqualToString:@"estimatedProgress"])
        {
            CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
            if (newprogress == 1)
            {
                self.progressView.hidden = YES;
                [self.progressView setProgress:0 animated:NO];
            }
            else
            {
                self.progressView.hidden = NO;
                [self.progressView setProgress:newprogress animated:YES];
            }
        }
    }
}

//开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {

    //开始加载网页时展示出progressView
    if(self.progressView != nil) {
        
        self.progressView.hidden = NO;
        //开始加载网页的时候将progressView的Height恢复为1.5倍
        self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        //防止progressView被网页挡住
        [self bringSubviewToFront:self.progressView];
    }
}

//加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self updateBarButtons];
    //加载完成后隐藏progressView
    if(self.progressView != nil) {
        
        self.progressView.hidden = YES;
    }
}

//加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {

    //加载失败同样需要隐藏progressView
    if(self.progressView != nil) {
        
        self.progressView.hidden = YES;
    }
}

- (void)setProgressView:(UIProgressView *)progressView {
    
    objc_setAssociatedObject(self, &@selector(progressView), progressView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIProgressView *)progressView {
    
    UIProgressView *obj = objc_getAssociatedObject(self, &@selector(progressView));
    return obj;
}


- (void)setBackBarItem:(UIBarButtonItem *)backBarItem{
    
    objc_setAssociatedObject(self, &@selector(backBarItem), backBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIBarButtonItem *)backBarItem{
    UIBarButtonItem *obj = objc_getAssociatedObject(self, &@selector(backBarItem));
    return obj;
}

- (void)setCloseBarItem:(UIBarButtonItem *)closeBarItem{
    objc_setAssociatedObject(self, &@selector(closeBarItem), closeBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIBarButtonItem *)closeBarItem{
    UIBarButtonItem *obj = objc_getAssociatedObject(self, &@selector(closeBarItem));
    return obj;
}

- (void)setCurrentVC:(UIViewController *)currentVC{
    objc_setAssociatedObject(self, &@selector(currentVC), currentVC, OBJC_ASSOCIATION_ASSIGN);
}
- (UIViewController *)currentVC{
    UIViewController *obj = objc_getAssociatedObject(self, &@selector(currentVC));
    return obj;

}


- (void)dealloc {
    if(self.progressView != nil) {
        [self removeObserver:self forKeyPath:@"title"];
        [self removeObserver:self forKeyPath:@"estimatedProgress"];
    }
}

@end
