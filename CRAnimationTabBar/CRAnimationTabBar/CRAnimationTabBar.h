//
//  CRAnimationTabBar.h
//  CRAnimationTabBar
//
//  Created by Tomoya Igarashi on 10/2/13.
//  Copyright (c) 2013 Tomoya Igarashi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface CRAnimationTabBar : NSObject

@property (unsafe_unretained, nonatomic) BOOL isTabBarHidden;

- (id)initWithTabBar:(UITabBar *)tabBar;

- (void)hideWithAnimated:(BOOL)animated tableView:(UITableView *)tableView;
- (void)showWithAnimated:(BOOL)animated tableView:(UITableView *)tableView;

@end
