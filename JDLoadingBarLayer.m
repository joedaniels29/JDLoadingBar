//
// Created by Joseph Daniels on 3/25/14.
// Copyright (c) 2014 JD. All rights reserved.
//
//

#import "JDLoadingBarLayer.h"



@interface JDLoadingBarLayer ()

@property (nonatomic, readonly) CGPoint startPoint;
@property (nonatomic, readonly) CGPoint endPoint;
@end





@implementation JDLoadingBarLayer

-(id) init{


	self = [super init];
	if (self){
		CAKeyframeAnimation *animation = [[CAKeyframeAnimation alloc] init];
//		animation.values = colors;
		[self startAnimating];
	}
	return self;
}

-(void) startAnimating{
	CALayer *const layer = [self newRepLayer];
	[self addSublayer:layer];
//	CAAnimation *movementAnimation = [CABasicAnimation animationWithKeyPath:@"frame.center"];
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
	[animation setFromValue:[NSValue valueWithCGPoint:self.startPoint]];
	[animation setToValue:[NSValue valueWithCGPoint:self.endPoint]];
	[animation setDuration:[self getDuration]];
	[animation setRepeatCount:HUGE_VAL];
	[animation setAutoreverses:NO];

	[layer addAnimation:animation forKey:@"position"];
}

-(CALayer *) newLayer{
	CALayer *layer = [[CALayer alloc] init];
	layer.frame = CGRectMake(self.startPoint.x, self.startPoint.y, 10, 10);
	layer.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:.7].CGColor;
	layer.borderColor = [[UIColor blueColor] colorWithAlphaComponent:1].CGColor;
	layer.borderWidth = 2;

	return layer;
}
-(CALayer *) newRepLayer{
	CALayer *layer = [[CALayer alloc] init];
	layer.frame = CGRectMake(self.startPoint.x, self.startPoint.y, self.size.width, self.size.height);
	layer.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:.7].CGColor;
	layer.borderColor = [[UIColor blueColor] colorWithAlphaComponent:1].CGColor;
	layer.borderWidth = 2;


	CAReplicatorLayer * replicatorLayer = [[CAReplicatorLayer alloc] init];

	replicatorLayer.instanceCount = 8;
	replicatorLayer.instanceDelay = .5;
	replicatorLayer.instanceGreenOffset =-.05;
	replicatorLayer.instanceRedOffset = -.05f ;
//	replicatorLayer.instanceBlueOffset = -.05f;
	replicatorLayer.instanceColor = [UIColor whiteColor].CGColor;
	replicatorLayer.preservesDepth = YES;
	replicatorLayer.instanceTransform = CATransform3DMakeTranslation(-self.size.width, 0, 0);
	[replicatorLayer addSublayer:layer];



	CAReplicatorLayer *replicatorLayer2 = [CAReplicatorLayer layer];
	replicatorLayer2.instanceCount = 3;
	replicatorLayer2.instanceDelay = 1;
	replicatorLayer2.instanceGreenOffset = -.1;
	replicatorLayer2.instanceRedOffset = -.07;
	replicatorLayer2.instanceBlueOffset = -.1;
	replicatorLayer2.instanceTransform = CATransform3DMakeTranslation(-self.size.width/2,10, 0);
	[replicatorLayer2 addSublayer:replicatorLayer];







	return replicatorLayer2;
}

-(void) stopAnimating{
}

-(BOOL) isAnimating{
	return NO;
}

-(float) getDuration{
	return 2.0;
}

-(CGPoint) startPoint{
	return CGPointMake(50, 50);
}
-(CGSize) size{
	return CGSizeMake(50, 50);
}

-(CGPoint) endPoint{
	return CGPointMake(500, 50);
}



- (CABasicAnimation *)pushAnimation
{
	CABasicAnimation *pushAnim = [CABasicAnimation animationWithKeyPath:@"instanceTransform"];
	pushAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(SUBLAYER_WIDTH+INTERSPACE, 0, 0)];
	pushAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(SUBLAYER_WIDTH+INTERSPACE+60, 0, 0)];
	pushAnim.duration = 3.0;
	pushAnim.autoreverses = YES;
	pushAnim.repeatCount = HUGE_VAL;
	pushAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	return pushAnim;
}
@end