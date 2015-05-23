//
//  JunkballerAppDelegate.m
//  Junkballer_app02
//
//  Created by CR Beasley on 6/4/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import "JunkballerAppDelegate.h"
#import <Parse/Parse.h>
#import "AppboyKit.h"

@implementation JunkballerAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:31/255.0f green:129/255.0f blue:233/255.0f alpha:1.0f]];
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    //if ([self.window respondsToSelector:@selector(setTintColor:)]) self.window.tintColor = [UIColor whiteColor];
    
   
    
    
    [Parse setApplicationId:@"NwBp45qxdk5yx8oK7gVm75JKtmFfg5LPbJcqphuQ"
                  clientKey:@"8KBcYvUjtOxXcaa3RHJuE0GsOKcsZSklpe3zj2Mx"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    return YES;
    
    Kiip *kiip = [[Kiip alloc] initWithAppKey:@"b25e785083b5df983efae6be07896f8f" andSecret:@"c5c73bb5ed5819a73bc8f931b5e35ac4"];
    kiip.delegate = self;
    [Kiip setSharedInstance:kiip];
    return YES;
    
    


    
//    [Appboy startWithApiKey:@"dfd4266f-e304-4a86-a555-1f745e6d5596"
//              inApplication:application
//          withLaunchOptions:launchOptions];
    
   
    
    
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
