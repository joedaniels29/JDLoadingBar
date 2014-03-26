//
//  JDViewController.m
//  LoadingBar
//
//  Created by Joseph Daniels on 3/25/14.
//  Copyright (c) 2014 JD. All rights reserved.
//

#import "JDViewController.h"
#import "JDLoadingBar.h"



@interface JDViewController ()

@property (nonatomic, strong) JDLoadingBar *loadingBar;
@end

@implementation JDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.loadingBar = [[JDLoadingBar alloc] initWithColors:nil];


	[self.view addSubview:self.loadingBar];
}
-(void) viewWillAppear:(BOOL)animated{
	self.loadingBar.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end