//
//  FirstViewController.m
//  CRAnimationTabBarDemo
//
//  Created by Tomoya Igarashi on 10/2/13.
//  Copyright (c) 2013 Tomoya Igarashi. All rights reserved.
//

#import "FirstViewController.h"

#import "AppDelegate.h"

#import <CRAnimationTabBar/CRAnimationTabBar.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_button setTitle:@"Hidden TabBar" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapButton:(id)sender {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (delegate.animTabBar.isTabBarHidden) {
        [delegate.animTabBar showWithAnimated:YES];
        [_button setTitle:@"Hidden TabBar" forState:UIControlStateNormal];
    } else {
        [delegate.animTabBar hideWithAnimated:YES];
        [_button setTitle:@"Show TabBar" forState:UIControlStateNormal];
    }
    
}
@end
