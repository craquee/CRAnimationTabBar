//
//  AppDelegate.h
//  CRAnimationTabBarDemo
//
//  Created by Tomoya Igarashi on 10/2/13.
//  Copyright (c) 2013 Tomoya Igarashi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CRAnimationTabBar/CRAnimationTabBar.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CRAnimationTabBar *animTabBar;

@end
