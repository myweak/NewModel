//
//  RootTabBarController.m
//  TZDaiBei
//
//  Created by TianZe on 2019/11/20.
//  Copyright © 2019 天泽集团. All rights reserved.
//

#import "TZTabBarController.h"
#import "UIView+Frame.h"
@interface TZTabBarController ()

@end

@implementation TZTabBarController



- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
//    [self becomeFirstResponder];
//       [self customizeInterface];
    [self setUpTabBarItemsAttributesForController];
    [self viewControllersForTabBar];
    [self customizeTabBarAppearance];
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
     [thirdViewController cyl_setNavigationBarHidden:YES];

    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController,
                                 ];
    self.viewControllers = viewControllers;
    return viewControllers;
}

- (void)setUpTabBarItemsAttributesForController
{
    
    NSDictionary * homeDictionary = @{CYLTabBarItemTitle : @"首页",
                                      CYLTabBarItemImage : @"btn_home_nor",
                                      CYLTabBarItemSelectedImage : @"btn_home_pre",
                                      };
    NSDictionary * productDictionary = @{CYLTabBarItemTitle : @"产品大全",
                                       CYLTabBarItemImage : @"btn_pro_nor",
                                       CYLTabBarItemSelectedImage : @"btn_pro_pre",
                                       };
    NSDictionary * mineDictionary = @{CYLTabBarItemTitle : @"我的",
                                      CYLTabBarItemImage : @"btn_per_nor",
                                      CYLTabBarItemSelectedImage : @"btn_per_pre",
                                      };
    NSArray * TabBarItemsAttributes = @[homeDictionary,
                                        productDictionary,
                                        mineDictionary,
                                      ];
    
    self.tabBarItemsAttributes = TabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance {
    // Customize UITabBar height
    // 自定义 TabBar 高度
    // tabBarController.tabBarHeight = CYL_IS_IPHONE_X ? 65 : 40;
    
    [self rootWindow].backgroundColor = [UIColor cyl_systemBackgroundColor];
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor cyl_systemGrayColor];
//    norMalAttrs[NSFontAttributeName] = [uifont];

    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor cyl_labelColor];
    
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

@end
