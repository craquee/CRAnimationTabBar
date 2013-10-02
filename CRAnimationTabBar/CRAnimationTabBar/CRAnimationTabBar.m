//
//  CRAnimationTabBar.m
//  CRAnimationTabBar
//
//  Created by Tomoya Igarashi on 10/2/13.
//  Copyright (c) 2013 Tomoya Igarashi. All rights reserved.
//

#import "CRAnimationTabBar.h"

@interface CRAnimationTabBar ()

@property (strong, nonatomic) UITabBar *tabBar;

@end

#define TABBAR_MARGIN 20.f

@implementation CRAnimationTabBar

- (id)initWithTabBar:(UITabBar *)tabBar
{
    self = [super init];
    if (self) {
        _tabBar = tabBar;
        _isTabBarHidden = NO;
    }
    
    return self;
}

- (void)hideWithAnimated:(BOOL)animated
{
    if (!_isTabBarHidden) {
        UIView *parent = _tabBar.superview; // UILayoutContainerView
        UIView *content = [parent.subviews objectAtIndex:0];  // UITransitionView
        UIView *window = parent.superview;
        if (!window) {
            return;
        }
        
        CGFloat duration = animated ? 0.2f : 0.001f;
        [UIView animateWithDuration:duration
                         animations:^{
                             CGRect tabFrame = _tabBar.frame;
                             tabFrame.origin.y = CGRectGetMaxY(window.bounds) + TABBAR_MARGIN;
                             _tabBar.frame = tabFrame;
                         }];
        [UIView animateWithDuration:0.f
                         animations:^{
                             content.frame = window.bounds;
                         }];
        _isTabBarHidden = YES;
    }
}

-(void)showWithAnimated:(BOOL)animated
{
    if (_isTabBarHidden) {
        UIView *parent = _tabBar.superview; // UILayoutContainerView
        UIView *content = [parent.subviews objectAtIndex:0];  // UITransitionView
        UIView *window = parent.superview;
        if (!window) {
            return;
        }
        
        CGFloat duration = animated ? 0.2f : 0.001f;
        [UIView animateWithDuration:duration
                         animations:^{
                             CGRect tabFrame = _tabBar.frame;
                             tabFrame.origin.y = CGRectGetMaxY(window.bounds) - CGRectGetHeight(_tabBar.frame);
                             _tabBar.frame = tabFrame;
                             
                             CGRect contentFrame = content.frame;
                             contentFrame.size.height = CGRectGetMaxY(window.bounds) - TABBAR_MARGIN;
                             content.frame = contentFrame;
                         }];
        _isTabBarHidden = NO;
    }
}

- (void)forceHideWithAnimated:(BOOL)animated
{
    _isTabBarHidden = NO;
    [self hideWithAnimated:animated];
}

- (void)forceShowWithAnimated:(BOOL)animated
{
    _isTabBarHidden = YES;
    [self showWithAnimated:animated];
}

@end
