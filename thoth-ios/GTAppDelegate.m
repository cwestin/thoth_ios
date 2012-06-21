//
//  GTAppDelegate.m
//  thoth-ios
//
//  Created by Chris Westin on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GTAppDelegate.h"

#import "GTDeck.h"
#import "GTHand.h"
#import "GTViewController.h"

@implementation GTAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

// override from UIApplicationDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[
            [UIScreen mainScreen] bounds]];

    // Override point for customization after application launch.

    GTViewController *pGTVC =
        [[GTViewController alloc] initWithNibName:@"GTViewController"
                                           bundle:nil];
    NSLog(@"GTAppDelegate: loaded GTViewController %@", pGTVC);
    self.viewController = pGTVC;
    self.window.rootViewController = pGTVC;

    // the model data for the game
    [pGTVC setupModelsAndPScore:0 andOScore:0];

    NSLog(@"GTAppDelegate set up model");

    [self.window makeKeyAndVisible];
    return YES;
}

// override from UIApplicationDelegate
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

// override from UIApplicationDelegate
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

// override from UIApplicationDelegate
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

// override from UIApplicationDelegate
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

    GTViewController *pGTVC = self.viewController;
    [pGTVC showScores];
    [pGTVC dealHand];
}

// override from UIApplicationDelegate
- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
