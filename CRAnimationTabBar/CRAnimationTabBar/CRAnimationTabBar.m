//
//  CRAnimationTabBar.m
//  CRAnimationTabBar
//
//  Created by Tomoya Igarashi on 10/2/13.
//  Copyright (c) 2013 Tomoya Igarashi. All rights reserved.
//

#import "CRAnimationTabBar.h"

#import <Foundation/NSObjCRuntime.h>

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

- (void)hideWithAnimated:(BOOL)animated tableView:(UITableView *)tableView
{
    if (!_isTabBarHidden) {
        UIView *parent = _tabBar.superview; // UILayoutContainerView
        UIView *content = [parent.subviews objectAtIndex:0];  // UITransitionView
        UIView *window = parent.superview;
        if (!window) {
            return;
        }
        
        content.frame = window.frame;

        CGFloat duration = animated ? 0.2f : 0.001f;
        [UIView animateWithDuration:duration
                         animations:^{
                             CGRect tabFrame = _tabBar.frame;
                             tabFrame.origin.y = CGRectGetMaxY(window.bounds) + TABBAR_MARGIN;
                             _tabBar.frame = tabFrame;
                         }];
        
        _isTabBarHidden = YES;
    }
}

-(void)showWithAnimated:(BOOL)animated tableView:(UITableView *)tableView
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
                         }
                         completion:^(BOOL finished) {
                             CGRect contentFrame = content.frame;
                             contentFrame.size.height = CGRectGetHeight(window.frame) - CGRectGetHeight(_tabBar.frame);
                             content.frame = contentFrame;
                         }];
        _isTabBarHidden = NO;
    }
}

@end
