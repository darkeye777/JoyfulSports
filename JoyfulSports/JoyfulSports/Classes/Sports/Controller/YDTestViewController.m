//
//  YDTestViewController.m
//  JoyfulSports
//
//  Created by Tzhan on 14-9-27.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDTestViewController.h"
#import <MAMapKit/MAMapKit.h>

@interface YDTestViewController ()
@property (nonatomic, weak) MAMapView *mapView;
@end

@implementation YDTestViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    MAMapView *mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:mapView];
}

@end
