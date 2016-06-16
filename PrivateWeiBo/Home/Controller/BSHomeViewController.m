//
//  BSHomeViewController.m
//  PrivateWeiBo
//
//  Created by 羚羊 on 16/1/7.
//  Copyright © 2016年 WBS. All rights reserved.
//

#import "BSHomeViewController.h"
#import "BSTitleButton.h"
#import "BSPopMenu.h"
#import "TestViewController.h"

@interface BSHomeViewController () <BSPopMenuDelegate>

@end

@implementation BSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏左右两边按钮
    [self initialSideNavBarButtonItem];
    // 设置导航栏中间按钮
    [self initialTitleButtonWithName:@"首页"];
    
}

/** 设置导航栏左右两边按钮 */
- (void)initialSideNavBarButtonItem
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch" highImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_pop" highImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
}

/** 设置导航栏中间按钮 */
- (void)initialTitleButtonWithName:(NSString *)titleName
{
    // 初始化中间按钮
    BSTitleButton *titleButton = [BSTitleButton titleButton];
    // 位置和尺寸
    titleButton.frame = CGRectMake(0, 0, 0, 40);
    // 图标
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    // 文字
    [titleButton setTitle:titleName forState:UIControlStateNormal];
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
}

/** 中间按钮点击事件 */
- (void)titleClick:(BSTitleButton *)titleButton
{
    // 1.更改图片
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    // 2.弹出下拉菜单
    BSPopMenu *menu = [[BSPopMenu alloc] init];
    menu.delegate = self;
    [menu showInRect:CGRectMake(15, NAVIGATION_ADD_STATUSBAR_HEIGHT - 9, 100, 240)];
    
    menu.titleSource = @[@"1f就回家yu", @"2控件", @"3"];
    menu.imageSource = @[@"navigationbar_friendsearch", @"navigationbar_friendsearch", @"navigationbar_friendsearch"];
    menu.titleFont = [UIFont systemFontOfSize:13];
    menu.cellHigh = 35;
    
    menu.backgroundType = BSPopMenuBackgroundTypeCenter;
}

#pragma mark - BSPopMenuDelegate

- (void)popMenuDidDismissed
{
    BSTitleButton *titleButton = (BSTitleButton *)self.navigationItem.titleView;
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
}

- (void)friendSearch {
    BSLog(@"friendSearch---");
}

- (void)pop {
    BSLog(@"pop---");
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 16;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"首页测试数据----%ld", (long)indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestViewController *newVc = [[TestViewController alloc] init];
    newVc.view.backgroundColor = [UIColor redColor];
    newVc.title = @"新控制器";
    [self.navigationController pushViewController:newVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
