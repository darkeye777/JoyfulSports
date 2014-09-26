//
//  YDSportsViewController.m
//  JoyfulSports
//
//  Created by Tzhan on 14-9-25.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDSportsViewController.h"

@interface YDSportsViewController ()
/**
 *  地图
 */
@property (nonatomic, strong) MAMapView *mapView;
/**
 *  所有的点
 */
@property (nonatomic, strong) NSMutableArray *points;
/**
 *  线的模型
 */
@property (nonatomic, strong) MAPolyline *routeLine;
/**
 *  所有线的模型
 */
@property (nonatomic, strong) NSMutableArray *routeLineArray;
/**
 *  当前位置
 */
@property (nonatomic, strong) CLLocation *currentLocation;
/**
 *  线的视图
 */
@property (nonatomic, strong) MAPolylineView *routeLineView;
/**
 *  总距离
 */
@property (nonatomic, assign) double totalDistance;
/**
 *  容器View
 */
@property (nonatomic, weak) UIView *containerView;
@end

@implementation YDSportsViewController

- (void)modeAction
{
    [self.mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES]; //地图跟着位置移动
}

-(void)mapView:(MAMapView*)mapView didFailToLocateUserWithError:(NSError*)error
{
    YDLog(@"定位失败: %@", error);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.mapView.showsUserLocation = YES;    //YES 为打开定位，NO为关闭定位
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    self.mapView=[[MAMapView alloc] initWithFrame:CGRectMake(0, 64, 320, 455)];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    [self customiseAppearance];
//}
//- (IBAction)clearClick:(UIButton *)sender {
//    [self.mapView removeOverlays:self.routeLineArray];
//}
//
//- (IBAction)redrawClick:(UIButton *)sender {
//    NSArray *points = [NSKeyedUnarchiver unarchiveObjectWithFile:TZFilePath];
//    self.points = [points mutableCopy];
//    [self configureRoutes];
//}
//
//- (IBAction)saveClick:(UIButton *)sender {
//    [NSKeyedArchiver archiveRootObject:self.points toFile:TZFilePath];
//}
//
//- (IBAction)segement:(UISegmentedControl *)sender {
//    int index = sender.selectedSegmentIndex;
//    NSLog(@"index: %d", index);
//}
//
//- (IBAction)btnClick:(UIButton *)btn
//{
//    [self.mapView setCenterCoordinate:self.currentLocation.coordinate animated:YES];
//    [self.counterLabel start];
//}

#pragma mark - MAMapViewDelegate
- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    CLLocation *location = userLocation.location;
    //判断距离
    if (self.points.count) {
        CLLocationDistance distance = [location distanceFromLocation:self.currentLocation];
        if (distance < 5.f) {
            return;
        }
        
        //总路程
        self.totalDistance += distance;
    }
    
    [self.points addObject:location];
    [self configureRoutes];
    
    MACoordinateRegion region = MACoordinateRegionMake(userLocation.coordinate, !self.currentLocation ? MACoordinateSpanMake(0.024692, 0.024692) : self.mapView.region.span);
    [self.mapView setRegion:region animated:YES];
    self.currentLocation = location;
}

- (MAOverlayView *)mapView:(MAMapView *)mapView viewForOverlay:(id<MAOverlay>)overlay
{
    MAPolylineView *overlayView = nil;
    
    if (overlay == self.routeLine) {
        self.routeLineView = [[MAPolylineView alloc] initWithPolyline:self.routeLine];
        self.routeLineView.strokeColor = [UIColor redColor];
        self.routeLineView.lineWidth = 3;
        self.routeLineView.lineCapType = kCGLineCapRound;
        self.routeLineView.lineJoinType = kCGLineJoinRound;
        overlayView = self.routeLineView;
    }
    
    return overlayView;
}

//- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated
//{
//    YDLog(@"( %f, %f )", mapView.region.span.latitudeDelta, mapView.region.span.longitudeDelta);
//}

/**
 *  绘制
 */
- (void)configureRoutes
{
    //存储点
    CLLocationCoordinate2D coordinates[self.points.count];
    for (int i = 0; i < self.points.count; i++) {
        CLLocation *location = self.points[i];
        coordinates[i] = location.coordinate;
    }
    
    //设置
    self.routeLine = [MAPolyline polylineWithCoordinates:coordinates count:self.points.count];
    
    if (nil != self.routeLine) {
        [self.routeLineArray addObject:self.routeLine];
        [self.mapView addOverlay:self.routeLine];
    }
}

#pragma mark - 懒加载
- (NSMutableArray *)points
{
    if (!_points) {
        _points = [NSMutableArray array];
    }
    return _points;
}

- (NSMutableArray *)routeLineArray
{
    if (!_routeLineArray) {
        _routeLineArray = [NSMutableArray array];
    }
    return _routeLineArray;
}

@end
