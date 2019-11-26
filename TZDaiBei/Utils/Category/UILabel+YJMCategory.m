//
//  UILabel+YJMCategory.m
//  XingTu
//
//  Created by Zheng Yin on 2018/1/11.
//  Copyright © 2018年 Zheng Yin. All rights reserved.
//

#import "UILabel+YJMCategory.h"

@implementation UILabel (YJMCategory)

/**
 设置文本,并在文本后设置标签
 
 @param text 文本
 @param imageArr 图片标签数组
 */
- (void)yjm_setText:(NSString *)text appendTagImageArr:(NSArray <UIImage *>*)imageArr{
    
    [self yjm_setText:text appendTagImageArr:imageArr spacing:2];
}

/**
 设置文本,并在文本后设置标签
 
 @param text 文本
 @param imageArr 图片标签数组
 @param spacing 图片间距
 */
- (void)yjm_setText:(NSString *)text appendTagImageArr:(NSArray <UIImage *>*)imageArr spacing:(CGFloat)spacing{
    
    if (!text) {
        text = @"";
    }
    self.text = text;
  
    for (UIImage * image in imageArr) {
        //图片前后都会有间距所以 spacing * 0.5
        [self yjm_setImageTag:image withRange:NSMakeRange(self.text.length, 0) spacing:spacing * 0.5];
    }
}


/**
 添加图片标签
 
 @param image 图片标签
 @param range 图片添加位置
 */
- (void)yjm_setImageTag:(UIImage*)image withRange:(NSRange)range{
    
    [self yjm_setImageTag:image withRange:range spacing:2];
}
/**
 添加图片标签
 
 @param image 图片标签
 @param range 图片添加位置
 @param spacing 图片间距

 */
- (void)yjm_setImageTag:(UIImage*)image withRange:(NSRange)range spacing:(CGFloat)spacing{
    
    NSMutableAttributedString * mAtr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //图片上下各忽略的距离
    CGFloat ignoreTop = 1;
    //图片高度
    CGFloat imageH = self.font.lineHeight - ignoreTop * 2;
    if (imageH > image.size.height) {
        imageH = image.size.height;
    }
    //图片宽度
    CGFloat imageW = image.size.width / image.size.height * imageH;
    
    //附件
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [image scaleToSize:CGSizeMake(imageW, imageH)];
//    attachment.bounds=CGRectMake(0, self.font.descender + ignoreTop, imageW, imageH );
    CGFloat Y = (self.font.capHeight - imageH) / 2;
    attachment.bounds=CGRectMake(0, Y, imageW, imageH );

    //添加图片
    [mAtr replaceCharactersInRange:range withAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
    
    //设置间距图片(因为默认是没有间距的,但设置bounds.x又影响文本宽带计算,最后一张图片可能被切割)
    
    if (range.location + range.length < mAtr.length) {
        //图片刚好添加到尾部时，后面不用加间距
        NSTextAttachment *spacingAttachment = [[NSTextAttachment alloc] init];
        spacingAttachment.image = [UIImage new];
        spacingAttachment.bounds=CGRectMake(0, 0 , spacing, 1);
        NSRange spacingRang = NSMakeRange(range.location + 1, 0);
        [mAtr replaceCharactersInRange:spacingRang withAttributedString:[NSAttributedString attributedStringWithAttachment:spacingAttachment]];
    }
    
    if (range.location != 0) {
        //图片刚好添加到头部时，前面不用加间距
        NSTextAttachment *spacingAttachment = [[NSTextAttachment alloc] init];
        spacingAttachment.image = [UIImage new];
        spacingAttachment.bounds=CGRectMake(0, 0 , spacing, 1);
        NSRange spacingRang = NSMakeRange(range.location, 0);
        [mAtr replaceCharactersInRange:spacingRang withAttributedString:[NSAttributedString attributedStringWithAttachment:spacingAttachment]];
    }

    
    self.attributedText = mAtr;
}
@end
