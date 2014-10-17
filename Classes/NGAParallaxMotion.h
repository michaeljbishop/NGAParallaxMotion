//
//  UIView+ParallaxMotion.h
//
//  Created by Michael Bishop on 7/4/13.
//  Copyright (c) 2013 Numerical Garden. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, NGAParallaxMotionDirection) {
    NGAParallaxMotionDirectionAll   = 0,
    NGAParallaxMotionDirectionHorizontal      = 1,
    NGAParallaxMotionDirectionVertical   = 2,
};



@interface UIView (NGAParallaxMotion)

// Positive values make the view appear to be above the surface
// Negative values are below.
// The unit is in points
@property (nonatomic) CGFloat parallaxIntensity;

// When filled up, will restrict the parallax to a certain direction only
// Default to NGAParallaxMotionDirectionAll
@property (nonatomic) NGAParallaxMotionDirection parallaxDirectionConstraint;


- (void)setParallaxIntensity:(CGFloat)parallaxDepth;
- (void)setParallaxDirectionConstraint:(NGAParallaxMotionDirection)parallaxConstraint;

@end
