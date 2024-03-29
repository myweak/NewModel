//
//  UITextField+EXT.h
//  Cunpiao
//
//  Created by weibin on 2017/4/10.
//  Copyright © 2017年 cwb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (EXT)
/**
  设置TextFile Placeholder 颜色

 @param holderColor  Placeholder 颜色
 */
-(void)setPlaceholderColor:(UIColor *)holderColor;


/**
 设置最大长度
 */
@property (nonatomic, assign) IBInspectable NSUInteger maxLength;

@end
