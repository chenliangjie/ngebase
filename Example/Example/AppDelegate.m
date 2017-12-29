//
//  AppDelegate.m
//  Example
//
//  Created by chenliangjie on 2017/12/28.
//  Copyright © 2017年 nge. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Routable.h"
#import "ECSPHTTPSession.h"
#import "ECSPRequestSerializer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 模块注册
    [self registerModules];

    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navController.navigationBar.translucent = NO;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    
    // 网络模块初始化
    [ECSPHTTPSession setGlobalDefaultDomain:@"http://www.uq861.cn"];
    [ECSPRequestSerializer setGlobalUserAgent:[self customerInfo]];
    [ECSPRequestSerializer setLoginInfo:nil];
    
    // Routable初始化
    [[Routable sharedRouter] setIgnoresExceptions:YES];
    [[Routable sharedRouter] setNavigationController:navController];

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

#pragma mark - register all modules

- (void)registerModules {
    [[Routable sharedRouter] registerModule:@"NWTestModule"];
    [[Routable sharedRouter] registerModule:@"TestModule"];
}

#pragma mark -

- (NSString *)customerInfo {
    NSString *customerInfo = [NSString stringWithFormat:@" %@/%@ (%@)", [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleExecutableKey] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleIdentifierKey], [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey],@"APP_CUR_CODE"];
    return customerInfo;
}

@end
