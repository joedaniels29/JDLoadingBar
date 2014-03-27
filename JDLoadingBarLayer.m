//
// Created by Joseph Daniels on 3/25/14.
// Copyright (c) 2014 JD. All rights reserved.
//
//

#import "JDLoadingBarLayer.h"


#define DEFAULT_WIDTH 25


#define DEFAULT_HEIGHT 4



@interface JDLoadingBarLayer ()

@property (nonatomic, readonly) CGPoint startPoint, endPoint;

@property (nonatomic, strong) NSArray *colors;

@property (nonatomic, strong) NSTimer *timer;
@property  CGFloat particleWidth, particleHeight, particleSpeed;
//@property  NSInteger currentColor, colorCount;
@end





@implementation JDLoadingBarLayer{
	int currentColor, colorCount;
	CGFloat explicitSpeed, _implicitParticleSpeed;
	NSArray *_colors;
	NSTimeInterval _timeInterval;

}

-(id) init{


	self = [super init];
	if (self){
		self.particleWidth = DEFAULT_WIDTH; 
		self.particleHeight = DEFAULT_HEIGHT;
		self.colors = @[[UIColor blueColor], [UIColor greenColor], [UIColor redColor]];
		colorCount = 3;
		currentColor = 0;
	}
	[self startAnimating];
	return self;
}

-(void) startAnimating{
	self.timer = [NSTimer timerWithTimeInterval:[self timeInterval] target:self selector:@selector(dispatchALayer)
	                                         userInfo:nil repeats:YES];
	[self.timer fire];
	
}

-(NSTimeInterval) timeInterval{
	if(!_timeInterval)  _timeInterval = _particleWidth /self.particleSpeed;
	return _timeInterval;
}

-(void) dispatchALayer{
	CALayer *const layer = [self newLayerWithColor:[self currentColor]];
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

-(UIColor *) currentColor{
	currentColor = (currentColor ++) %colorCount;
	return self.colors[currentColor];
}

-(CALayer *) newLayerWithColor:(UIColor *)c {
	CALayer *layer = [[CALayer alloc] init];
	layer.frame = CGRectMake(self.startPoint.x, self.startPoint.y, _particleWidth, _particleHeight);
	layer.backgroundColor = [c colorWithAlphaComponent:.7].CGColor;
	layer.borderColor = [c colorWithAlphaComponent:1].CGColor;
	layer.borderWidth = 2;

	return layer;
}

-(void) stopAnimating{
	if (self.timer.isValid)[self.timer invalidate];
}

-(BOOL) isAnimating{
	return self.timer.isValid;
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

-(NSArray *) colors{
	if (!_colors) _colors= [[NSArray alloc]init];
	return _colors;
}

-(CGFloat) particleSpeed{
	if(!explicitSpeed){
		if(!_implicitParticleSpeed){
			_implicitParticleSpeed = 200.0f; //px per second
		}
		return _implicitParticleSpeed;
	}else return explicitSpeed;
	
}

-(void) setParticleSpeed:(CGFloat)particleSpeed{
	explicitSpeed = particleSpeed;
}


-(void) setColors:(NSArray *)colors{
#ifdef DEBUG
	for(id potentialColor in colors){
		NSAssert([potentialColor isKindOfClass:UIColor.class], @"Colors need to be colors. You supplied a %@", [potentialColor class]);
	}
#endif
	_colors = colors;
}


- (CABasicAnimation *)pushAnimation
{
	CABasicAnimation *pushAnim = [CABasicAnimation animationWithKeyPath:@"instanceTransform"];
//	pushAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(SUBLAYER_WIDTH+INTERSPACE, 0, 0)];
//	pushAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(SUBLAYER_WIDTH+INTERSPACE+60, 0, 0)];
//	pushAnim.duration = 3.0;
//	pushAnim.autoreverses = YES;
//	pushAnim.repeatCount = HUGE_VAL;
//	pushAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	return pushAnim;
}
@end