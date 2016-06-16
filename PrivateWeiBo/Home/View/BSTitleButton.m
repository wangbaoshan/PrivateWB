//
//  BSTitleButton.m
//  BS_NavBar
//
//  Created by 羚羊 on 15/10/13.
//  Copyright (c) 2015年 WBS. All rights reserved.
//

#import "BSTitleButton.h"

#define BSTitleButtonImageW 20

@implementation BSTitleButton

+ (instancetype)titleButton
{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 高亮的时候不要自动调整图标
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setBackgroundImage:[UIImage resizedImage:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = BSTitleButtonImageW;
    CGFloat imageX = self.frame.size.width - imageW;
    CGFloat imageH = self.frame.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = 0;
    CGFloat titleW = self.frame.size.width - BSTitleButtonImageW;
    CGFloat titleH = self.frame.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    CGFloat titleW = [title sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].width;
    CGRect frame = self.frame;
    frame.size.width = titleW + BSTitleButtonImageW;
    self.frame = frame;
    [super setTitle:title forState:state];
}

@end
