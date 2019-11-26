//
//  NSMutableDictionary+Additions.m
//  Wkkeeper
//
//  Created by 严建民 on 2019/6/3.
//  Copyright © 2019 Darcy. All rights reserved.
//

#import "NSMutableDictionary+Additions.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (Additions)

+(void)load{
    static dispatch_once_t oncnToken;
    dispatch_once(&oncnToken, ^{
        id obj = [[self alloc] init];
        [obj exchangeMethod:@selector(setObject:forKey:) withMethod:@selector(safeSetObject:forKey:)];
    });
}

- (void)safeSetObject:(id)object forKey:(id<NSCopying>)key{
    if (object == nil || object == NULL){
        NSLog(@"⚠️⚠️⚠️⚠️⚠️⚠️⚠️'-[__NSDictionaryM setObject:forKey:]: object cannot be nil (key: %@)'",key);
    }else if(key == nil || key == NULL) {
        NSLog(@"⚠️⚠️⚠️⚠️⚠️⚠️⚠️'-[__NSDictionaryM setObject:forKey:]: key cannot be nil (object: %@)'",object);
    }else{
        [self safeSetObject:object forKey:key];
    }
}

- (void)exchangeMethod:(SEL)origSelector withMethod:(SEL)newSelector
{
    Class cls = [self class];
    
    Method originalMethod = class_getInstanceMethod(cls, origSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, newSelector);
    
    BOOL didAddMethod = class_addMethod(cls,
                                        origSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(cls,
                            newSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
