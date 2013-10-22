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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"HideTabBar" style:UIBarButtonItemStyleBordered target:self action:@selector(tapBarButtonItem:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapBarButtonItem:(id)sender {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIBarButtonItem *barButtonItem = self.navigationItem.rightBarButtonItem;
    if (delegate.animTabBar.isTabBarHidden) {
        [delegate.animTabBar showWithAnimated:YES tableView:self.tableView];
        [barButtonItem setTitle:@"HideTabBar"];
    } else {
        [delegate.animTabBar hideWithAnimated:YES tableView:self.tableView];
        [barButtonItem setTitle:@"ShowTabBar"];
    }
    
}
@end
