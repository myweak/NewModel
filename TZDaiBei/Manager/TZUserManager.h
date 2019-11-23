//
//  UserManager.h
//  TZDaiBei
//
//  Created by TianZe on 2019/11/23.
//  Copyright © 2019 天泽集团. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TZUserManager : NSObject

SINGLETON_FOR_HEADER(TZUserManager)


@property (nonatomic, assign) BOOL isLogined;

/**
 加载缓存用户数据

 @return 是否成功
 */
-(BOOL)loadUserInfo;
@end

