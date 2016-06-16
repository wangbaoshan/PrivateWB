//
//  UIImage+BS.m
//  PrivateWeiBo
//
//  Created by 羚羊 on 16/1/7.
//  Copyright © 2016年 WBS. All rights reserved.
//

#import "UIImage+BS.h"

@implementation UIImage (BS)
/**
 *  根据图片名返回一张中间自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name
{
    return [self resizedImageWithName:name withLeft:0.5 andTop:0.5];
}
/**
 *  根据图片名返回一张能够自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name withLeft:(CGFloat)left andTop:(CGFloat)top
{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}
@end
