//
//  TZUserManager.h
//  TZDaiBei
//
//  Created by TianZe on 2019/11/20.
//  Copyright © 2019 天泽集团. All rights reserved.
//

#import "UtilsMacros.h"
#import <Foundation/Foundation.h>


@interface TZUserManager : NSObject

//单例
//+ (id)sharedTZUserManager;
//SINGLETON_FOR_HEADERw(TZUserManager)
SINGLETON_FOR_HEADER(TZUserManager)


@property (nonatomic, assign) BOOL isLogined;


/**
 加载缓存用户数据

 @return 是否成功
 */
-(BOOL)loadUserInfo;

@end

