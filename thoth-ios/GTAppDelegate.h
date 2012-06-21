//
//  GTAppDelegate.h
//  thoth-ios
//
//  Created by Chris Westin on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GTDeck;
@class GTHand;
@class GTViewController;

@interface GTAppDelegate : UIResponder <UIApplicationDelegate>
{
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) GTViewController *viewController;

@end
