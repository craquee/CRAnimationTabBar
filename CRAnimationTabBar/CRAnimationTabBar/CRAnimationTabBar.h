//
//  CRAnimationTabBar.h
//  CRAnimationTabBar
//
//  Created by Tomoya Igarashi on 10/2/13.
//  Copyright (c) 2013 Tomoya Igarashi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRAnimationTabBar : NSObject

@property (unsafe_unretained, nonatomic) BOOL isTabBarHidden;

- (id)initWithTabBar:(UITabBar *)tabBar;

- (void)hideWithAnimated:(BOOL)animated;
- (void)showWithAnimated:(BOOL)animated;

- (void)forceHideWithAnimated:(BOOL)animated;
- (void)forceShowWithAnimated:(BOOL)animated;

@end
