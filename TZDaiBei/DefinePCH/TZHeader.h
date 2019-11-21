//
//  TZHeader.h
//  TZDaiBei
//
//  Created by TianZe on 2019/11/20.
//  Copyright © 2019 天泽集团. All rights reserved.
//

#ifndef TZHeader_h
#define TZHeader_h

#import "TZUserManager.h"
#import "TZTabBarController.h"
#import "TZNavigationViewController.h"
#import "AppDelegate+AppService.h"
#import "AppDelegate.h"
#import "TZUserManager.h"
//单例化一个类
#define SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;\


#endif /* TZHeader_h */
