//
//  AppDelegate.m
//  SUYanXuan
//
//  Created by He on 2017/8/22.
//  Copyright © 2017年 sevenuncle. All rights reserved.
//

#import "AppDelegate.h"
#import "SUHomeNavigationVC.h"
#import "SUHomeVC.h"
#import "SURecommendVC.h"
#import "SUCatagoriesVC.h"
#import "SUCartVC.h"
#import "SUProfileVC.h"
#import "SUThemeVC.h"
#import "UIImage+Size.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    NSMutableArray *controllers = [NSMutableArray array];
    
    {
        UIViewController *vc = [[SUHomeVC alloc] init];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
        tabBarItem.image = [[UIImage imageNamed:@"home_tab_normal"] imageWithSize:CGSizeMake(25, 25)];
        tabBarItem.selectedImage = [[UIImage imageNamed:@"home_tab_selected"] imageWithSize:CGSizeMake(25, 25)];
        tabBarItem.title = @"首页";
        vc.tabBarItem = tabBarItem;
        
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
        [controllers addObject:navi];
    }
    {
        UIViewController *vc = [[SUThemeVC alloc] init];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
        tabBarItem.image = [[UIImage imageNamed:@"theme_tab_normal"] imageWithSize:CGSizeMake(25, 25)];
        tabBarItem.selectedImage = [[UIImage imageNamed:@"theme_tab_selected"] imageWithSize:CGSizeMake(25, 25)];
        tabBarItem.title = @"专题";
        vc.tabBarItem = tabBarItem;
        
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
        [controllers addObject:navi];
    }
    {
        UIViewController *vc = [[SUCatagoriesVC alloc] init];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
        tabBarItem.image = [[UIImage imageNamed:@"cata_tab_normal"] imageWithSize:CGSizeMake(25, 25)];
        tabBarItem.selectedImage = [[UIImage imageNamed:@"cata_tab_selected"] imageWithSize:CGSizeMake(25, 25)];
        tabBarItem.title = @"分类";
        vc.tabBarItem = tabBarItem;
        
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
        [controllers addObject:navi];
    }
    {
        UIViewController *vc = [[SUCartVC alloc] init];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
        tabBarItem.image = [[UIImage imageNamed:@"cart_tab_normal"] imageWithSize:CGSizeMake(25, 25)];
        tabBarItem.selectedImage = [[UIImage imageNamed:@"cart_tab_selected"] imageWithSize:CGSizeMake(25, 25)];
        tabBarItem.title = @"专题";
        vc.tabBarItem = tabBarItem;
        
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
        [controllers addObject:navi];
    }
    {
        UIViewController *vc = [[SUProfileVC alloc] init];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
        tabBarItem.image = [[UIImage imageNamed:@"prof_tab_normal"] imageWithSize:CGSizeMake(25, 25)];
        tabBarItem.selectedImage = [[UIImage imageNamed:@"prof_tab_selected"] imageWithSize:CGSizeMake(25, 25)];
        tabBarItem.title = @"个人";
        vc.tabBarItem = tabBarItem;
        
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
        [controllers addObject:navi];
    }

    
    UITabBarController *tabBarConroller = [[UITabBarController alloc] init];
    tabBarConroller.viewControllers = controllers.copy;
    tabBarConroller.view.tintColor = [UIColor colorWithRed:0.8 green:0 blue:0 alpha:1];
    SUHomeNavigationVC *homeNavigationVC = [[SUHomeNavigationVC alloc] initWithRootViewController:tabBarConroller];
    self.window.rootViewController = homeNavigationVC;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
