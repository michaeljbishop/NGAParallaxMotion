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

- (void)setParallaxIntensity:(CGFloat)parallaxDepth direction:(NGAParallaxMotionDirection)direction;

@end
