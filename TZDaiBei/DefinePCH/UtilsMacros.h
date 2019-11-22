//
//  UtilsMacros.h
//  TZDaiBei
//
//  Created by TianZe on 2019/11/20.
//  Copyright © 2019 天泽集团. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h




//单例化一个类
#define SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;\

#define SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}\



#endif /* UtilsMacros_h */
