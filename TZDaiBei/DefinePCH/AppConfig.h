//
//  AppConfig.h
//  TZDaiBei
//
//  Created by TianZe on 2019/11/23.
//  Copyright © 2019 天泽集团. All rights reserved.
//

#ifndef AppConfig_h
#define AppConfig_h

#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif

#endif /* AppConfig_h */
