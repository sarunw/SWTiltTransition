//
//  SWTiltTransitionDelegate.m
//  Present
//
//  Created by Sarun Wongpatcharapakorn on 2/12/15.
//  Copyright (c) 2015 Sarun Wongpatcharapakorn. All rights reserved.
//

#import "SWTiltTransitionDelegate.h"
#import "SWTiltPresentationController.h"
#import "SWTiltTransitionAnimation.h"

@implementation SWTiltTransitionDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    SWTiltTransitionAnimation *animator = [SWTiltTransitionAnimation new];
    animator.presenting = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    SWTiltTransitionAnimation *animator = [SWTiltTransitionAnimation new];
    animator.presenting = NO;
    return animator;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[SWTiltPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

@end
