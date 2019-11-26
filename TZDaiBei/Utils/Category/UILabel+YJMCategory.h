//
//  UILabel+YJMCategory.h
//  XingTu
//
//  Created by Zheng Yin on 2018/1/11.
//  Copyright © 2018年 Zheng Yin. All rights reserved.
//



@interface UILabel (YJMCategory)


/**
 设置文本,并在文本后设置标签
 
 @param text 文本
 @param imageArr 图片标签数组
 */
- (void)yjm_setText:(NSString *)text appendTagImageArr:(NSArray <UIImage *>*)imageArr;
/**
 设置文本,并在文本后设置标签
 
 @param text 文本
 @param imageArr 图片标签数组
 @param spacing 图片间距
 */
- (void)yjm_setText:(NSString *)text appendTagImageArr:(NSArray <UIImage *>*)imageArr spacing:(CGFloat)spacing;


/**
 添加图片标签
 
 @param image 图片标签
 @param range 图片添加位置
 */
- (void)yjm_setImageTag:(UIImage*)image withRange:(NSRange)range;
/**
 添加图片标签
 
 @param image 图片标签
 @param range 图片添加位置
 @param spacing 图片间距
 
 */
- (void)yjm_setImageTag:(UIImage*)image withRange:(NSRange)range spacing:(CGFloat)spacing;
@end
