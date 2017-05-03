//
//  AppDelegate.m
//  TestAppSegmentObjC
//
//  Created by Maxim Shoustin on 2/19/17.
//  Copyright © 2017 Maxim Shoustin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    SEGAnalyticsConfiguration *config = [SEGAnalyticsConfiguration configurationWithWriteKey:@"GRN6QWnSb8tbDETvKXwLQDEVomHmHuDO"];
    
    //[config use:[SEGAppsFlyerIntegrationFactory instance]];

    [config use:[SEGAppsFlyerIntegrationFactory createWithLaunchDelegate:self]];
    
    config.enableAdvertisingTracking = YES;
    config.trackApplicationLifecycleEvents = YES;
    config.trackDeepLinks = YES;
    config.trackPushNotifications = YES;
    config.trackAttributionData = YES;
    
    [SEGAnalytics debug:YES];
    
    [SEGAnalytics setupWithConfiguration:config];
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

-(void)onConversionDataReceived:(NSDictionary*) installData {
    
    NSLog(@"FESS :: onConversionDataReceived is called");
    
    id status = [installData objectForKey:@"af_status"];
    
    if([status isEqualToString:@"Non-organic"]) {
        
        id sourceID = [installData objectForKey:@"media_source"];
        
        id campaign = [installData objectForKey:@"campaign"];
        
        NSLog(@"This is a none organic install. Media source: %@  Campaign: %@",sourceID,campaign);
        
    } else if([status isEqualToString:@"Organic"]) {
        
        NSLog(@"This is an organic install.");
        
    }
    
}

-(void)onConversionDataRequestFailure:(NSError *) error {
    
    NSLog(@"%@",error);
}


- (void) onAppOpenAttribution:(NSDictionary*) attributionData {
    
    NSLog(@"attribution data: %@", attributionData);
}

- (void) onAppOpenAttributionFailure:(NSError *)error {
    NSLog(@"%@",error);
    
}



@end
