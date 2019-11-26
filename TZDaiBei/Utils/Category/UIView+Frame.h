//
//  UIView+Frame.h
//  Journey
//
//  Created by liuxhui on 15/7/27.
//  Copyright (c) 2015年 liuxhui. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  此扩展用于方便的修改控件的frame  获取控件的各个属性
 */
@interface UIView (Frame)
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;


@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;


- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

@end
