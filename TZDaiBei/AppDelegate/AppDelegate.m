//
//  AppDelegate.m
//  TZDaiBei
//
//  Created by TianZe on 2019/11/19.
//  Copyright © 2019 天泽集团. All rights reserved.
//

#import "AppDelegate.h"
#import "LLDebugTool.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    #ifdef DEBUG
    [[LLDebugTool sharedTool] startWorkingWithConfigBlock:^(LLConfig * _Nonnull config) {
    }];
    #else
    #endif
    
    //初始化window
       [self initWindow];
       
       //初始化网络请求配置
//       [self NetWorkConfig];
       
       //UMeng初始化
//       [self initUMeng];
       
       //初始化app服务
//       [self initService];
       
       //初始化IM
//       [[IMManager sharedIMManager] initIM];
       
       //初始化用户系统
       [self initUserManager];
       
       //网络监听
//       [self monitorNetworkStatus];
       
       //广告页
//       [AppManager appStart];

    return YES;
}


@end
