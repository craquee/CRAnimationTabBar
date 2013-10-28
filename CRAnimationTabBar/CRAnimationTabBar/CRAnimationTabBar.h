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

- (void)hideWithAnimated:(BOOL)animated tableView:(UITableView *)tableView;
- (void)showWithAnimated:(BOOL)animated tableView:(UITableView *)tableView;

@end
