//
//  SWTiltPresentationController.m
//  Present
//
//  Created by Sarun Wongpatcharapakorn on 2/12/15.
//  Copyright (c) 2015 Sarun Wongpatcharapakorn. All rights reserved.
//

#import "SWTiltPresentationController.h"

@interface SWTiltPresentationController ()

@property (nonatomic, strong) UIView *dimmingView;

@end

@implementation SWTiltPresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    if (self) {
        _dimmingView = [[UIView alloc] init];
        _dimmingView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    }
    return self;
}

- (void)presentationTransitionWillBegin
{
    self.dimmingView.frame = self.containerView.bounds;
    self.dimmingView.alpha = 0;
    [self.containerView insertSubview:self.dimmingView atIndex:0];
    
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.dimmingView.alpha = 1;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
    }];
}

- (void)dismissalTransitionWillBegin
{
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.dimmingView.alpha = 0;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self.dimmingView removeFromSuperview];
    }];
}


@end
