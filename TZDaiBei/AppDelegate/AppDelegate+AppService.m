//
//  AppDelegate+AppService.m
//  TZDaiBei
//
//  Created by TianZe on 2019/11/20.
//  Copyright © 2019 天泽集团. All rights reserved.
//

#import "AppDelegate+AppService.h"


@implementation AppDelegate (AppService)


#pragma mark ————— 初始化window —————
-(void)initWindow{


    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
}


#pragma mark ————— 初始化用户系统 —————
-(void)initUserManager{
//    DLog(@"设备IMEI ：%@",[OpenUDID value]);
    if([[TZUserManager sharedTZUserManager] loadUserInfo]){
        
        //如果有本地数据，先展示TabBar 随后异步自动登录
        self.mainTabBar = [TZTabBarController new];
        [self.mainTabBar setUpTabBarItemsAttributesForController:self.mainTabBar];


        
        //自动登录
//        [userManager autoLoginToServer:^(BOOL success, NSString *des) {
//            if (success) {
//                DLog(@"自动登录成功");
//                //                    [MBProgressHUD showSuccessMessage:@"自动登录成功"];
//                KPostNotification(KNotificationAutoLoginSuccess, nil);
//            }else{
//                [MBProgressHUD showErrorMessage:NSStringFormat(@"自动登录失败：%@",des)];
//            }
//        }];
        
    }else{
        //没有登录过，展示登录页面
//        KPostNotification(KNotificationLoginStateChange, @NO)
//        [MBProgressHUD showErrorMessage:@"需要登录"];
    }
}


@end
