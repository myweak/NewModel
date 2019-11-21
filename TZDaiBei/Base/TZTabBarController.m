//
//  RootTabBarController.m
//  TZDaiBei
//
//  Created by TianZe on 2019/11/20.
//  Copyright © 2019 天泽集团. All rights reserved.
//

#import "TZTabBarController.h"

@interface TZTabBarController ()

@end

@implementation TZTabBarController



- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    [self becomeFirstResponder];
//       [self customizeInterface];
//    [self setUpTabBarItemsAttributesForController];
    [self viewControllersForTabBar];
}


- (void)customizeInterface {
    //设置导航栏
    //    [self setUpNavigationBarAppearance];
//        [self hideTabBarShadowImageView];
    //    if (@available(iOS 13.0, *)) {
    //        tabBarController.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    //    }
    //添加小红点
    //添加提示动画，引导用户点击
    [self setViewDidLayoutSubViewsBlockInvokeOnce:YES block:^(CYLTabBarController *tabBarController) {
        NSUInteger delaySeconds = 1.5;
        dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaySeconds * NSEC_PER_SEC));
        dispatch_after(when, dispatch_get_main_queue(), ^{
            @try {
                UIViewController *viewController0 = tabBarController.viewControllers[0];
                // UIControl *tab0 = viewController0.cyl_tabButton;
                // [tab0 cyl_showBadge];
                [viewController0 cyl_setBadgeBackgroundColor:RANDOM_COLOR];
                [viewController0 cyl_setBadgeCenterOffset:CGPointMake(-5, 3)];
                //                [viewController0 cyl_setBadgeRadius:11/2];
                //以上对Badge的参数设置，需要在 cyl_showBadgeValue 调用之前执行。
                [viewController0 cyl_showBadge];
                
                //                [tabBarController.viewControllers[1] cyl_setBadgeMargin:5];
                //                [tabBarController.viewControllers[2] cyl_setBadgeMargin:5];
                //                [tabBarController.viewControllers[3] cyl_setBadgeMargin:5];
                //                [tabBarController.viewControllers[4] cyl_setBadgeMargin:5];
                [tabBarController.viewControllers[1] cyl_setBadgeBackgroundColor:RANDOM_COLOR];
                [tabBarController.viewControllers[1] cyl_showBadgeValue:@"" animationType:CYLBadgeAnimationTypeScale];
                [tabBarController.viewControllers[2] cyl_showBadgeValue:@"" animationType:CYLBadgeAnimationTypeShake];
                
                NSString *testBadgeString = @"100";
                //                [tabBarController.viewControllers[3] cyl_setBadgeMargin:-5];
                //                CGSize size = [testBadgeString sizeWithAttributes:
                //                               @{NSFontAttributeName:
                //                                     tabBarController.viewControllers[3].cyl_badgeFont}];
                //                float labelHeight = ceilf(size.height);
                //                [tabBarController.viewControllers[3] cyl_setBadgeCornerRadius:(labelHeight+ tabBarController.viewControllers[3].cyl_badgeMargin)/2];
                [tabBarController.viewControllers[3] cyl_showBadgeValue:testBadgeString animationType:CYLBadgeAnimationTypeBounce];
                
                [tabBarController.viewControllers[4] cyl_showBadgeValue:@"NEW" animationType:CYLBadgeAnimationTypeBreathe];
            } @catch (NSException *exception) {}
            
            //添加仿淘宝tabbar，第一个tab选中后有图标覆盖
            if (self.selectedIndex != 0) {
                return;
            }
            // tabBarController.selectedIndex = 1;
        });
    }];
}


- (NSArray *)viewControllersForTabBar {
    
    TZHomePageViewController *firstViewController = [[TZHomePageViewController alloc] init];
    TZNavigationViewController *firstNavigationController = [[TZNavigationViewController alloc]
                                                   initWithRootViewController:firstViewController];
    [firstViewController cyl_setHideNavigationBarSeparator:YES];
    // [firstViewController cyl_setNavigationBarHidden:YES];
    TZProductPageViewController *secondViewController = [[TZProductPageViewController alloc] init];
    TZNavigationViewController *secondNavigationController = [[TZNavigationViewController alloc]
                                                    initWithRootViewController:secondViewController];
    [secondViewController cyl_setHideNavigationBarSeparator:YES];
    // [secondViewController cyl_setNavigationBarHidden:YES];

    TZMinePageViewController *thirdViewController = [[TZMinePageViewController alloc] init];
    TZNavigationViewController *thirdNavigationController = [[TZNavigationViewController alloc]
                                                   initWithRootViewController:thirdViewController];
    [thirdViewController cyl_setHideNavigationBarSeparator:YES];
    
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController,
                                 ];
//    self.viewControllers = viewControllers;
    return viewControllers;
}

- (void)setUpTabBarItemsAttributesForController:(CYLTabBarController *)tabBarController

{
    
    NSDictionary * homeDictionary = @{CYLTabBarItemTitle : @"首页",
                                      CYLTabBarItemImage : @"icon_首页未选中",
                                      CYLTabBarItemSelectedImage : @"icon_首页选中",
                                      };
    NSDictionary * productDictionary = @{CYLTabBarItemTitle : @"产品大全",
                                       CYLTabBarItemImage : @"ic_find",
                                       CYLTabBarItemSelectedImage : @"ic_find_select",
                                       };
    NSDictionary * mineDictionary = @{CYLTabBarItemTitle : @"出诊",
                                      CYLTabBarItemImage : @"ic_visit",
                                      CYLTabBarItemSelectedImage : @"ic_visit_select",
                                      };
    NSArray * TabBarItemsAttributes = @[homeDictionary,
                                        productDictionary,
                                        mineDictionary,
                                      ];
    
    tabBarController.tabBarItemsAttributes = TabBarItemsAttributes;
}


@end
