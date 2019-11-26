//
//  TZDefine.h
//  TZDaiBei
//
//  Created by TianZe on 2019/11/20.
//  Copyright © 2019 天泽集团. All rights reserved.
//

#ifndef TZDefine_h
#define TZDefine_h


////////////////////////////////////系统/////////////////////////////////////////
#define kAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

//app 版本号
#define kApp_Version [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]






#define userManager [TZUserManager sharedTZUserManager]

//图片
#define R_ImageName(imagName)  [UIImage imageNamed:imagName]

#define Kimage_placeholder R_ImageName(@"common_image_empty")

#define kSelfWeak __weak typeof(self) weakSelf = self
#define kSelfStrong __strong __typeof__(self) strongSelf = weakSelf


#endif /* TZDefine_h */
