//
//  BSPopMenu.h
//  PrivateWeiBo
//
//  Created by 羚羊 on 16/1/8.
//  Copyright © 2016年 WBS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    BSPopMenuBackgroundTypeCenter = 0, // 中间边框样式
    BSPopMenuBackgroundTypeLeft,
    BSPopMenuBackgroundTypeRight,
} BSPopMenuBackgroundType;

typedef enum : NSUInteger {
    BSPopMenuLineTypeExist = 0, // 有下划线
    BSPopMenuLineTypeNone, // 没有下划线
} BSPopMenuLineType;

@protocol BSPopMenuDelegate <NSObject>
@optional
- (void)popMenuDidDismissed;
@end

@interface BSPopMenu : UIView
// 设置标题
@property (nonatomic, strong) NSArray *titleSource;
// 设置图片
@property (nonatomic, strong) NSArray *imageSource;
// 设置字体
@property (nonatomic, weak) UIFont *titleFont;
// 代理
@property (nonatomic, weak) id<BSPopMenuDelegate> delegate;
// 下划线样式
@property (nonatomic, assign) BSPopMenuLineType lineType;
// 边框样式
@property (nonatomic, assign) BSPopMenuBackgroundType backgroundType;
// 设置高度
@property (nonatomic, assign) CGFloat cellHigh;
// 传入要显示的位置
- (void)showInRect:(CGRect)rect;
@end
