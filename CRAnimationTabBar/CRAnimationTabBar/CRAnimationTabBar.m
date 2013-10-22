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
        
        CGFloat bottom = CGRectGetHeight(tableView.tableHeaderView.frame) + CGRectGetHeight(tableView.tableFooterView.frame);
        if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
            bottom = 0.f;
        }
        UIEdgeInsets contentInsets = UIEdgeInsetsMake(tableView.contentInset.top, tableView.contentInset.left, bottom, tableView.contentInset.right);
        
        __block UITableView *bTableView = tableView;
        
        CGFloat duration = animated ? 0.2f : 0.001f;
        [UIView animateWithDuration:duration
                         animations:^{
                             CGRect tabFrame = _tabBar.frame;
                             tabFrame.origin.y = CGRectGetMaxY(window.bounds) + TABBAR_MARGIN;
                             _tabBar.frame = tabFrame;
                             
                             bTableView.contentInset = contentInsets;
                             bTableView.scrollIndicatorInsets = contentInsets;
                         }];
        
        
        if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_6_1) {
            [UIView animateWithDuration:0.f
                             animations:^{
                                 content.frame = window.bounds;
                             }];
        }
        
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
        
        CGFloat bottom = CGRectGetHeight(tableView.tableHeaderView.frame) + CGRectGetHeight(tableView.tableFooterView.frame);
        if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
            bottom = 0.f;
        }
        UIEdgeInsets contentInsets = UIEdgeInsetsMake(tableView.contentInset.top, tableView.contentInset.left, bottom, tableView.contentInset.right);
        
        __block UITableView *bTableView = tableView;
        
        CGFloat duration = animated ? 0.2f : 0.001f;
        [UIView animateWithDuration:duration
                         animations:^{
                             CGRect tabFrame = _tabBar.frame;
                             tabFrame.origin.y = CGRectGetMaxY(window.bounds) - CGRectGetHeight(_tabBar.frame);
                             _tabBar.frame = tabFrame;
                             
                             if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_6_1) {
                                 CGRect contentFrame = content.frame;
                                 contentFrame.size.height = CGRectGetMaxY(window.bounds) - CGRectGetHeight(_tabBar.frame);
                                 content.frame = contentFrame;
                                 
                                 bTableView.contentInset = contentInsets;
                                 bTableView.scrollIndicatorInsets = contentInsets;
                             }
                         }];
        _isTabBarHidden = NO;
    }
}

- (void)forceHideWithAnimated:(BOOL)animated tableView:(UITableView *)tableView
{
    _isTabBarHidden = NO;
    [self hideWithAnimated:animated tableView:tableView];
}

- (void)forceShowWithAnimated:(BOOL)animated tableView:(UITableView *)tableView
{
    _isTabBarHidden = YES;
    [self showWithAnimated:animated tableView:tableView];
}

@end
