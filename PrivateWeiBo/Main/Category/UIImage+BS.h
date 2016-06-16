//
//  UIImage+BS.h
//  PrivateWeiBo
//
//  Created by 羚羊 on 16/1/7.
//  Copyright © 2016年 WBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BS)
/**
 *  根据图片名返回一张中间自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;

/**
 *  根据图片名返回一张能够自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name withLeft:(CGFloat)left andTop:(CGFloat)top;
@end
