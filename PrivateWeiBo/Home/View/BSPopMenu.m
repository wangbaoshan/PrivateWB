//
//  BSPopMenu.m
//  PrivateWeiBo
//
//  Created by 羚羊 on 16/1/8.
//  Copyright © 2016年 WBS. All rights reserved.
//

#import "BSPopMenu.h"

@interface BSPopMenu ()<UITableViewDataSource, UITableViewDelegate>
/**
 *  最底部的遮盖 ：屏蔽除菜单以外控件的事件
 */
@property (nonatomic, weak) UIButton *cover;
/**
 *  容器 ：容纳具体要显示的内容contentView
 */
@property (nonatomic, weak) UIImageView *container;
/**
 *  显示在容器内部的view
 */
@property (nonatomic, weak) UIView *containerView;
/**
 *  tableView显示在容器内部的view上的数据
 */
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation BSPopMenu
- (void)dealloc
{
    self.cover = nil;
    self.container = nil;
    self.containerView = nil;
    self.tableView = nil;
    self.titleFont = nil;
}

#pragma mark - 初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        /** 添加菜单内部的子控件 **/
        // 添加一个遮盖按钮
        UIButton *cover = [[UIButton alloc] init];
        [cover addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        self.cover = cover;
        
        // 添加带箭头的菜单图片
        UIImageView *container = [[UIImageView alloc] init];
        container.userInteractionEnabled = YES;
        container.image = [UIImage resizedImage:@"popover_background"];
        [self addSubview:container];
        self.container = container;
        
        // 显示在容器内部的view
        UIView *containerView = [[UIView alloc] init];
        containerView.backgroundColor = [UIColor whiteColor];
        [container addSubview:containerView];
        self.containerView = containerView;
        
        // 初始化tableView
        [self initialTableView];
    }
    return self;
}

- (void)showInRect:(CGRect)rect
{
    // 添加菜单整体到主窗口身上
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    [window addSubview:self];
    
    // 设置容器的frame
    self.container.frame = rect;
    
    // 设置容器里面内容的frame
    CGFloat topMargin = 12;
    CGFloat leftMargin = 5;
    CGFloat rightMargin = 5;
    CGFloat bottomMargin = 8;
    
    self.containerView.y = topMargin;
    self.containerView.x = leftMargin;
    self.containerView.width = self.container.width - leftMargin - rightMargin;
    self.containerView.height = self.container.height - topMargin - bottomMargin;
    
    self.tableView.frame = self.containerView.bounds;
}

- (void)setTitleSource:(NSArray *)titleSource
{
    _titleSource = titleSource;
    [self.tableView reloadData];
}
- (void)setImageSource:(NSArray *)imageSource
{
    _imageSource = imageSource;
    [self.tableView reloadData];
}

/** 创建tableView */
- (void)initialTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.tableFooterView = [[UIView alloc] init];
    [self.containerView addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"menuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.titleSource[indexPath.row];
    cell.textLabel.font = self.titleFont;
    UIImage *img = [UIImage imageNamed:self.imageSource[indexPath.row]];
    if (img != nil) {
        cell.imageView.image = img;
    }
    return cell;
}
/**
 *  补全左侧的分割线
 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellHigh) {
        return self.cellHigh;
    } else {
        return 44;
    }
}
/**
 *  设置分割线样式
 */
- (void)setLineType:(BSPopMenuLineType)lineType
{
    _lineType = lineType;
    
    switch (lineType) {
        case BSPopMenuLineTypeNone:
            self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            break;
        default:
            break;
    }
}
/**
 *  设置边框样式
 */
- (void)setBackgroundType:(BSPopMenuBackgroundType)backgroundType
{
    _backgroundType = backgroundType;
    
    switch (backgroundType) {
        case BSPopMenuBackgroundTypeCenter:
            break;
        case BSPopMenuBackgroundTypeLeft:
            self.container.image = [UIImage resizedImageWithName:@"popover_background_left" withLeft:0.5 andTop:0.5];
            break;
        case BSPopMenuBackgroundTypeRight:
            self.container.image = [UIImage resizedImageWithName:@"popover_background_right" withLeft:0.5 andTop:0.5];
            break;
        default:
            break;
    }
}

- (void)dismiss
{
    if ([self.delegate respondsToSelector:@selector(popMenuDidDismissed)]) {
        [self.delegate popMenuDidDismissed];
    }
    // 移除控件
    [self removeFromSuperview];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.cover.frame = self.bounds;
}


@end
