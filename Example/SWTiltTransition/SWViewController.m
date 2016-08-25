//
//  SWViewController.m
//  SWTiltTransition
//
//  Created by Sarun Wongpatcharapakorn on 04/14/2015.
//  Copyright (c) 2014 Sarun Wongpatcharapakorn. All rights reserved.
//

#import "SWViewController.h"

#import <SWTiltTransition/SWTiltTransitionDelegate.h>

@interface SWViewController ()

@property (nonatomic, strong) SWTiltTransitionDelegate *transitionDelegate;

@end

@implementation SWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.transitionDelegate = [[SWTiltTransitionDelegate alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"will appear");
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"will disappear");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *nav = segue.destinationViewController;
    nav.transitioningDelegate = self.transitionDelegate;
    nav.modalPresentationStyle = UIModalPresentationCustom;
    
    UIViewController *vc = nav.topViewController;
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    
    vc.navigationItem.leftBarButtonItem = cancelButton;
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
