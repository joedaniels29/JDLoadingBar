//
// Created by Joseph Daniels on 3/25/14.
// Copyright (c) 2014 JD. All rights reserved.
//
//

#import <Foundation/Foundation.h>



@interface JDLoadingBarLayer : CALayer

- (id)initWithColors:(NSArray* ) colors;




- (void)startAnimating;
- (void)stopAnimating;
- (BOOL)isAnimating;

@end