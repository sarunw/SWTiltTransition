//
//  SWTiltTransitionAnimation.m
//  Present
//
//  Created by Sarun Wongpatcharapakorn on 2/12/15.
//  Copyright (c) 2015 Sarun Wongpatcharapakorn. All rights reserved.
//

#import "SWTiltTransitionAnimation.h"

static CGFloat const scaleFactor = 0.93;

@implementation SWTiltTransitionAnimation

- (instancetype)init
{
    self = [super init];
    if (self) {
        _presenting = NO;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // Grab the from and to view controllers from the context
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = [fromVC view];
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [toVC view];
    
    UIView *containerView = [transitionContext containerView];

    BOOL isPresentation = self.presenting;
    
    if(isPresentation)
    {
        [containerView addSubview:toView];
    }
    
    UIViewController *animatingVC = isPresentation? toVC : fromVC;
    UIView *animatingView = [animatingVC view];
    
    CGRect appearedFrame = [transitionContext finalFrameForViewController:animatingVC];
    // Our dismissed frame is the same as our appeared frame, but off the right edge of the container
    CGRect dismissedFrame = appearedFrame;
    dismissedFrame.origin.y += dismissedFrame.size.height;
    
    CGRect initialFrame = isPresentation ? dismissedFrame : appearedFrame;
    CGRect finalFrame = isPresentation ? appearedFrame : dismissedFrame;
    
    [animatingView setFrame:initialFrame];
    
    if (self.presenting) {
        
        fromView.userInteractionEnabled = NO;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.3 options:0 animations:^{
            
            fromView.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
            fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
            animatingView.frame = finalFrame;
        } completion:^(BOOL finished) {
           
            [transitionContext completeTransition:YES];
        }];
    }
    else {
        toView.userInteractionEnabled = YES;
        toView.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.5 options:0 animations:^{
            
            toView.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
            toView.transform = CGAffineTransformIdentity;
            animatingView.frame = finalFrame;
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:YES];
        }];
    }
}

@end
