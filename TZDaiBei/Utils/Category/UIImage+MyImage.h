//
//  UIImage+MyImage.h
//  KinHop
//
//  Created by weibin on 14/11/25.
//  Copyright (c) 2014年 cwb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIImage (MyImage)

@property (nonatomic, strong) NSString *isCircle;

+ (UIImage *)imageWithName:(NSString *)name;
+ (UIImage *)imageLocalizedNamed:(NSString *)name;
+ (UIImage *)colorImage:(UIImage *)img withColor:(UIColor *)color;
+ (UIImage *)imageNamed:(NSString *)name withColor:(UIColor *)color;
+ (UIImage *)imageLocalizedNamed:(NSString *)name withColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)cropImageInRect:(CGRect )rect;
- (UIImage *)resizeImageToWidth:(float )width;
- (UIImage *) rotateImage:(UIImage *)img angle:(int)angle;
- (UIImage *) maskImage:(UIImage *)image withMask:(UIImage *)maskImage;

+ (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize;
+ (UIImage *)tempImageScaled:(UIImage*)im;


// 把Image置为灰色
+ (UIImage *)grayscaleImageForImage:(UIImage *)image ;

// 设置透明度
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image;

// 通过链接获取二维码
+ (UIImage *)qrCodeImageWithUrl:(NSString *)url; // 默认大小 100
+ (UIImage *)qrCodeImageWithUrl:(NSString *)url size:(CGFloat)size;
//获取图片某一点的颜色
- (UIColor *)colorAtPixel:(CGPoint)point;
/**
 根据大小重新绘制图片
 
 @param size 大小
 @return 图片
 */
-(UIImage*)scaleToSize:(CGSize)size;
@end
