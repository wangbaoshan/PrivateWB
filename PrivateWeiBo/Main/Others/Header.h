//
//  Header.h
//  微博_BS
//
//  Created by 羚羊 on 15/8/4.
//  Copyright (c) 2015年 WBS. All rights reserved.
//

#ifndef ___BS_Header_h
#define ___BS_Header_h

/**
 *  状态栏+导航栏高度
 */
#define NAVIGATION_ADD_STATUSBAR_HEIGHT 64

/**
 *  屏幕宽度
 */
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

/**
 *  屏幕高度
 */
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

/**
 *  屏幕宽度的中间 W*0.5
 */
#define SCREEN_WIDTH_MID SCREEN_WIDTH * 0.5

/**
 *  屏幕高度的中间 H*0.5
 */
#define SCREEN_HEIGHT_MID SCREEN_HEIGHT * 0.5

/**
 *  TabBar高度
 */
#define TabBarHeight 49


// 导航栏标题的字体
#define BSNavigationTitleFont [UIFont boldSystemFontOfSize:20]


// RGB颜色
#define BS_RGBA_Color(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a] 
// 随机色
#define BS_Random_Color BS_RGBA_Color(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1.0)

#endif
