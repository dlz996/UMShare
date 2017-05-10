//
//  AppDelegate.m
//  shareModule
//
//  Created by 董立峥 on 2017/5/9.
//  Copyright © 2017年 芦苇科技. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <UMSocialCore/UMSocialCore.h>

#define UMKEY @"591073577666137a8e000353"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ViewController * vc = [[ViewController alloc]init];
    
    UINavigationController * nag = [[UINavigationController alloc]initWithRootViewController:vc];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = nag;
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];

    
    
    [[UMSocialManager defaultManager] setUmSocialAppkey:UMKEY];

    [self registerUMKey];
    
    return YES;
}

/** 注册平台 */
- (void)registerUMKey{
    
    
    /* 微信 */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxdc1e388c3822c80b" appSecret:@"3baf1193c85774b3fd9d18447d76cab0" redirectURL:@"http://mobile.umeng.com/social"];
    

    
    /*QQ*/
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1106152098"/*设置QQ平台的appID*/  appSecret:@"KexLaOiU6VVzxgQb" redirectURL:@"http://mobile.umeng.com/social"];
   
    /*
     注**
     
     redirectURL必须要和微博设置的回调一致
     */
    
    /* 新浪 */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"1234957746"  appSecret:@"b3564b393bfcb42672d8e84f084ea550" redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
    
    
}

// 支持所有iOS系统版本回调
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
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
