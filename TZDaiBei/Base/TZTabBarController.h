//
//  RootTabBarController.h
//  TZDaiBei
//
//  Created by TianZe on 2019/11/20.
//  Copyright © 2019 天泽集团. All rights reserved.
//

#define RANDOM_COLOR [UIColor colorWithHue: (arc4random() % 256 / 256.0) saturation:((arc4random()% 128 / 256.0 ) + 0.5) brightness:(( arc4random() % 128 / 256.0 ) + 0.5) alpha:1]


#import "CYLTabBarController.h"
#import "TZHomePageViewController.h"
#import "TZProductPageViewController.h"
#import "TZMinePageViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface TZTabBarController : CYLTabBarController

//- (NSArray *)viewControllersForTabBar;
//- (void)setUpTabBarItemsAttributesForController;
@end

NS_ASSUME_NONNULL_END
