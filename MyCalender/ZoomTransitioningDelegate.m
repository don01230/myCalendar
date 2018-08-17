//
//  ZoomTransitioningDelegate.m
//  MyCalender
//
//  Created by LAI KIN WA on 6/8/2018.
//  Copyright © 2018年 LAI KIN WA. All rights reserved.
//

#import "ZoomTransitioningDelegate.h"

@protocol ZoomingViewController
-(UIImageView*)zoomingImageView:(ZoomTransitioningDelegate*)transition;
-(UIView*)zoomingBackgroundView:(ZoomTransitioningDelegate*)transition;
@end

@implementation ZoomTransitioningDelegate
    double transitionDuration=0.5;
    UINavigationControllerOperation operation=UINavigationControllerOperationNone;
    CGFloat zoomScale=0.5;
    CGFloat backgroundScale=0.7;
@end

enum{
    initial,
    final
}TransitionState;
