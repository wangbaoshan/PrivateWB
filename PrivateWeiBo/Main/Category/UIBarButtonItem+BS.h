//
//  UIBarButtonItem+BS.h
//  PrivateWeiBo
//
//  Created by 羚羊 on 16/1/7.
//  Copyright © 2016年 WBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BS)

/** 返回一个自定义的UIBarButtonItem */
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action;

@end
