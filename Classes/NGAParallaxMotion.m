//
//  NGAParallaxMotion.m
//
//  Created by Michael Bishop on 7/4/13.
//  Copyright (c) 2013 Numerical Garden. All rights reserved.
//

#import "NGAParallaxMotion.h"
#import <objc/runtime.h>

static const NSString * kNGAParallaxDepthKey = @"kNGAParallaxDepthKey";
static const NSString * kNGAParallaxMotionEffectGroupKey = @"kNGAParallaxMotionEffectGroupKey";

@implementation UIView (NGAParallaxMotion)

-(void)setParallaxIntensity:(CGFloat)parallaxDepth
{
    if (self.parallaxIntensity == parallaxDepth)
        return;
    
    objc_setAssociatedObject(self, (__bridge const void *)(kNGAParallaxDepthKey), @(parallaxDepth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    if (parallaxDepth == 0.0)
    {
        [self removeMotionEffect:[self nga_parallaxMotionEffectGroup]];
        [self nga_setParallaxMotionEffectGroup:nil];
        return;
    }

    UIMotionEffectGroup * parallaxGroup = [self nga_parallaxMotionEffectGroup];
    if (!parallaxGroup)
    {
        parallaxGroup = [[UIMotionEffectGroup alloc] init];
        [self nga_setParallaxMotionEffectGroup:parallaxGroup];
        [self addMotionEffect:parallaxGroup];
    }
    
    UIInterpolatingMotionEffect *xAxis = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    UIInterpolatingMotionEffect *yAxis = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    
    NSArray * motionEffects = @[xAxis, yAxis];

    for (UIInterpolatingMotionEffect * motionEffect in motionEffects )
    {
        motionEffect.maximumRelativeValue = @(parallaxDepth);
        motionEffect.minimumRelativeValue = @(-parallaxDepth);
    }
    parallaxGroup.motionEffects = motionEffects;
}

-(CGFloat)parallaxIntensity
{
    NSNumber * val = objc_getAssociatedObject(self, (__bridge const void *)(kNGAParallaxDepthKey));
    if (!val)
        return 0.0;
    return val.doubleValue;
}

#pragma mark -

-(UIMotionEffectGroup*)nga_parallaxMotionEffectGroup
{
    return objc_getAssociatedObject(self, (__bridge const void *)(kNGAParallaxMotionEffectGroupKey));
}

-(void)nga_setParallaxMotionEffectGroup:(UIMotionEffectGroup*)group
{
    objc_setAssociatedObject(self, (__bridge const void *)(kNGAParallaxMotionEffectGroupKey), group, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSAssert( group == objc_getAssociatedObject(self, (__bridge const void *)(kNGAParallaxMotionEffectGroupKey)), @"set didn't work" );
}
@end


