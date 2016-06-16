//
//  BSTabBarController.m
//  PrivateWeiBo
//
//  Created by 羚羊 on 16/1/7.
//  Copyright © 2016年 WBS. All rights reserved.
//

#import "BSTabBarController.h"
#import "BSHomeViewController.h"
#import "BSMessageViewController.h"
#import "BSDiscoverViewController.h"
#import "BSMeViewController.h"

#import "BSNavigationController.h"

@interface BSTabBarController () <UITabBarControllerDelegate>

@end

@implementation BSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
    BSHomeViewController *homeVC = [[BSHomeViewController alloc] init];
    [self addOneChlildVc:homeVC title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    BSMessageViewController *messageVC = [[BSMessageViewController alloc] init];
    [self addOneChlildVc:messageVC title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    BSDiscoverViewController *discoverVC = [[BSDiscoverViewController alloc] init];
    [self addOneChlildVc:discoverVC title:@"发现" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    BSMeViewController *meVC = [[BSMeViewController alloc] init];
    [self addOneChlildVc:meVC title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}

- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *selectedImg = [UIImage imageNamed:selectedImageName];
    if (iOS7) { // iOS7不渲染，显示原来图片
        selectedImg = [selectedImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectedImg;
    BSNavigationController *navVC = [[BSNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:navVC];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"%@", viewController.tabBarController.tabBar.subviews);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
