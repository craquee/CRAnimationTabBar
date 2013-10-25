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
        
        UIEdgeInsets contentInsets = UIEdgeInsetsZero;
        UIEdgeInsets scrollIndicatorInsets = UIEdgeInsetsZero;
        if (tableView != nil) {
            CGFloat bottom = CGRectGetHeight(_tabBar.frame) + CGRectGetHeight(tableView.tableFooterView.frame);
            if (IS_WIDESCREEN) {
                // TODO:微調整して算出した。固定値の元になった値を調べる。
                bottom = 4.f;
            }
            contentInsets = UIEdgeInsetsMake(tableView.contentInset.top, tableView.contentInset.left, bottom, tableView.contentInset.right);
            scrollIndicatorInsets = UIEdgeInsetsMake(tableView.scrollIndicatorInsets.top, tableView.scrollIndicatorInsets.left, contentInsets.bottom, tableView.scrollIndicatorInsets.right);
            
            tableView.contentInset = contentInsets;
            tableView.scrollIndicatorInsets = scrollIndicatorInsets;
        }
        
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
        
        UIEdgeInsets contentInsets = UIEdgeInsetsZero;
        UIEdgeInsets scrollIndicatorInsets = UIEdgeInsetsZero;
        if (tableView != nil) {
            CGFloat bottom = 0.f;
            // TODO:tableFooterView.frame.height?
            if (tableView.contentInset.bottom >= 49.f) {
                bottom = 49.f;
            }
            contentInsets = UIEdgeInsetsMake(tableView.contentInset.top, tableView.contentInset.left, bottom, tableView.contentInset.right);
            scrollIndicatorInsets = UIEdgeInsetsMake(tableView.scrollIndicatorInsets.top, tableView.scrollIndicatorInsets.left, contentInsets.bottom, tableView.scrollIndicatorInsets.right);
            tableView.contentInset = contentInsets;
            tableView.scrollIndicatorInsets = scrollIndicatorInsets;
        }
        
        CGFloat duration = animated ? 0.2f : 0.001f;
        [UIView animateWithDuration:duration
                         animations:^{
                             CGRect tabFrame = _tabBar.frame;
                             tabFrame.origin.y = CGRectGetMaxY(window.bounds) - CGRectGetHeight(_tabBar.frame);
                             _tabBar.frame = tabFrame;
                         }
                         completion:^(BOOL finished) {
                             if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_6_1) {
                                 CGRect contentFrame = content.frame;
                                 contentFrame.size.height = CGRectGetMaxY(window.bounds) - CGRectGetHeight(_tabBar.frame);
                                 content.frame = contentFrame;
                             } else {
                                 content.frame = window.frame;
                             }
                         }];
        _isTabBarHidden = NO;
    }
}

@end
