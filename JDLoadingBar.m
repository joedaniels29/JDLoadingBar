//
// Created by Joseph Daniels on 3/25/14.
// Copyright (c) 2014 JD. All rights reserved.
//
//

#import "JDLoadingBar.h"
#import "JDLoadingBarLayer.h"



@implementation JDLoadingBar{
}

+(Class) layerClass{
	return JDLoadingBarLayer.class;
}

-(id) initWithColors:(NSArray *)colors{
	if(self = [super init]){

	}

	return self;
}

-(void) stopAnimating{
}

-(BOOL) isAnimating{
	return NO;
}

-(void) startAnimating{
}
@end