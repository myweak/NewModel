//
//  APPFontSize.h
//  TZDaiBei
//
//  Created by TianZe on 2019/11/23.
//  Copyright © 2019 天泽集团. All rights reserved.
//

#ifndef APPFontSize_h
#define APPFontSize_h




//状态栏高度
#define kStatusBarH  (kIsIphoneX ? 44.0 : 20.0)
//导航栏➕状态栏高度
#define kNavBarH     (kStatusBarH + 44)

#define kScreenWidth        [UIScreen mainScreen].bounds.size.width
#define kScreenHeight       [UIScreen mainScreen].bounds.size.height
// bodyView 的高
#define kViewHeight         ([UIScreen mainScreen].bounds.size.height - kNavBarH)

//以iphone6适配
#define iPH(asd) ((asd/667.0f)*[UIScreen mainScreen].bounds.size.height)
#define iPW(asd) ((asd/375.0f)*[UIScreen mainScreen].bounds.size.width)



// 字体适配
#pragma mark 大小-细体

#define KFont(a)        [UIFont systemFontOfSize:iPH(a)]


/// 9号字体
#define kFontSize9 [UIFont systemFontOfSize:iPH(9.0)]

/// 10号字体
#define kFontSize10 [UIFont systemFontOfSize:iPH(10.0)]

/// 11号字体
#define kFontSize11 [UIFont systemFontOfSize:iPH(11.0)]

/// 12号字体
#define kFontSize12 [UIFont systemFontOfSize:iPH(12.0)]

/// 13号字体
#define kFontSize13 [UIFont systemFontOfSize:iPH(13.0)]

/// 14号字体
#define kFontSize14 [UIFont systemFontOfSize:iPH(14.0)]

/// 15号字体
#define kFontSize15 [UIFont systemFontOfSize:iPH(15.0)]

/// 16号字体
#define kFontSize16 [UIFont systemFontOfSize:iPH(16.0)]

/// 17号字体
#define kFontSize17 [UIFont systemFontOfSize:iPH(17.0)]

/// 18号字体
#define kFontSize18 [UIFont systemFontOfSize:iPH(18.0)]

/// 19号字体
#define kFontSize19 [UIFont systemFontOfSize:iPH(19.0)]

/// 20号字体
#define kFontSize20 [UIFont systemFontOfSize:iPH(20.0)]

/// 21号字体
#define kFontSize21 [UIFont systemFontOfSize:iPH(21.0)]

/// 22号字体
#define kFontSize22 [UIFont systemFontOfSize:iPH(22.0)]

/// 23号字体
#define kFontSize23 [UIFont systemFontOfSize:iPH(23.0)]

/// 24号字体
#define kFontSize24 [UIFont systemFontOfSize:iPH(24.0)]

/// 25号字体
#define kFontSize25 [UIFont systemFontOfSize:iPH(25.0)]

/// 27号字体
#define kFontSize27 [UIFont systemFontOfSize:iPH(27.0)]


#pragma mark 大小-粗体



#import "TZTabBarController.h"
static inline CGFloat iPhoneXDiffHeight() {
    
    if (kIsIphoneX) {
        return 24;
    }
    return 0;
}

#endif /* APPFontSize_h */
