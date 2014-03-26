//
// Created by Joseph Daniels on 3/25/14.
// Copyright (c) 2014 JD. All rights reserved.
//
//

#import <Foundation/Foundation.h>



@interface JDLoadingBar : UIView <NSCoding>{
@package
	CFTimeInterval               _duration;
	BOOL                         _animating;
	UIActivityIndicatorViewStyle _activityIndicatorViewStyle;
	UIActivityIndicatorViewStyle _actualActivityIndicatorViewStyle;
	BOOL                         _hidesWhenStopped;
}

- (id)initWithColors:(NSArray* ) colors;

@property(nonatomic) BOOL                         hidesWhenStopped;           // default is YES. calls -setHidden when animating gets set to NO


- (void)startAnimating;
- (void)stopAnimating;
- (BOOL)isAnimating;
@end
