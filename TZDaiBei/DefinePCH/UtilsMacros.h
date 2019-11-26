//
//  UtilsMacros.h
//  TZDaiBei
//
//  Created by TianZe on 2019/11/20.
//  Copyright © 2019 天泽集团. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h





// 圆角效果 view 10
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\

//可以使用一下语句判断是否是刘海手机：
#define kIsIphoneX ({\
BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
    if (!UIEdgeInsetsEqualToEdgeInsets([UIApplication sharedApplication].delegate.window.safeAreaInsets, UIEdgeInsetsZero)) {\
    isPhoneX = YES;\
    }\
}\
isPhoneX;\
})

/**
runtime实现通用copy
*/
#define tz_CopyWithZone \
- (id)copyWithZone:(NSZone *)zone {\
    id obj = [[[self class] allocWithZone:zone] init];\
    Class class = [self class];\
    while (class != [NSObject class]) {\
        unsigned int count;\
        Ivar *ivar = class_copyIvarList(class, &count);\
        for (int i = 0; i < count; i++) {\
            Ivar iv = ivar[i];\
            const char *name = ivar_getName(iv);\
            NSString *strName = [NSString stringWithUTF8String:name];\
            id value = [[self valueForKey:strName] copy];\
            [obj setValue:value forKey:strName];\
        }\
        free(ivar);\
        class = class_getSuperclass(class);\
    }\
    return obj;\
}\
\
-(id)mutableCopyWithZone:(NSZone *)zone{\
    id obj = [[[self class] allocWithZone:zone] init];\
    Class class = [self class];\
    while (class != [NSObject class]) {\
        unsigned int count;\
        Ivar *ivar = class_copyIvarList(class, &count);\
        for (int i = 0; i < count; i++) {\
            Ivar iv = ivar[i];\
            const char *name = ivar_getName(iv);\
            NSString *strName = [NSString stringWithUTF8String:name];\
            id value = [[self valueForKey:strName] copy];\
            [obj setValue:value forKey:strName];\
        }\
        free(ivar);\
        class = class_getSuperclass(class);\
    }\
    return obj;\
}\
\

/**
 二、runtime实现通用
 归档的实现
 */

#define tz_CodingImplementation \
- (void)encodeWithCoder:(NSCoder *)aCoder \
{ \
unsigned int outCount = 0; \
Ivar * vars = class_copyIvarList([self class], &outCount); \
for (int i = 0; i < outCount; i++) { \
    Ivar var = vars[i]; \
    const char * name = ivar_getName(var); \
    NSString * key = [NSString stringWithUTF8String:name]; \
    id value = [self valueForKey:key]; \
    if (value) { \
        [aCoder encodeObject:value forKey:key]; \
    } \
} \
} \
\
- (instancetype)initWithCoder:(NSCoder *)aDecoder \
{ \
    if (self = [super init]) { \
        unsigned int outCount = 0; \
        Ivar * vars = class_copyIvarList([self class], &outCount); \
        for (int i = 0; i < outCount; i++) { \
            Ivar var = vars[i]; \
            const char * name = ivar_getName(var); \
            NSString * key = [NSString stringWithUTF8String:name]; \
            id value = [aDecoder decodeObjectForKey:key]; \
            if (value) { \
                [self setValue:value forKey:key]; \
            } \
        } \
    } \
    return self; \
}



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
shared##className = [[super allocWithZone:NULL] init];\
}); \
return shared##className; \
}\



#endif /* UtilsMacros_h */
