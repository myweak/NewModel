//
//  AppDelegate+AppService.h
//  TZDaiBei
//
//  Created by TianZe on 2019/11/20.
//  Copyright © 2019 天泽集团. All rights reserved.
//



#import "AppDelegate.h"
#import "TZMinePageViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (AppService)


//初始化服务
-(void)initService;

//初始化 window
-(void)initWindow;

//初始化 UMeng
-(void)initUMeng;

//初始化用户系统
-(void)initUserManager;

//监听网络状态
- (void)monitorNetworkStatus;

//初始化网络配置
-(void)NetWorkConfig;


@end

NS_ASSUME_NONNULL_END
