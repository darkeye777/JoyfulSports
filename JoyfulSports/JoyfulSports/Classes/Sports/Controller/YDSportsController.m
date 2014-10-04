//
//  YDSportsController.m
//  JoyfulSports
//
//  Created by Tzhan on 14-10-3.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDSportsController.h"
#import "YDSportsTool.h"
#import "YDSport.h"
#import "YDMessageView.h"
#import "YDTopMessageView.h"
#import <MAMapKit/MAMapKit.h>

@interface YDSportsController () <MAMapViewDelegate, YDMessageViewDelegate, CLLocationManagerDelegate>
/**
 *  位置管理
 */
@property (nonatomic, strong) CLLocationManager *locationManager;
/**
 *  地图
 */
@property (nonatomic, strong) MAMapView *mapView;
/**
 *  地图容器
 */
@property (weak, nonatomic) IBOutlet UIView *mapContainer;
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
 *  缩放比例
 */
@property (nonatomic, assign) CGFloat zoomLeveal;
/**
 *  信息显示View
 */
@property (nonatomic, weak) IBOutlet YDMessageView *messageView;
/**
 *  提示
 */
@property (nonatomic, weak) IBOutlet YDTopMessageView *topMsgView;
@end

@implementation YDSportsController

-(void)mapView:(MAMapView*)mapView didFailToLocateUserWithError:(NSError*)error
{
    YDLog(@"定位失败: %@", error);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //信息显示
//    YDMessageView *messageView = [[YDMessageView alloc] init];
//    CGFloat height = self.view.height - 64 - 49;
//    CGFloat msgViewW = self.view.width;
//    CGFloat msgViewH = height * 0.35;
//    CGFloat msgViewX = 0;
//    CGFloat msgViewY = self.view.height - msgViewH;
//    messageView.frame = CGRectMake(msgViewX, msgViewY, msgViewW, msgViewH);
//    //代理
//    messageView.delegate = self;
//    
//    self.messageView = messageView;
//    [self.view addSubview:messageView];
    
    self.messageView.delegate = self;
    
    //如果是iOS8,会执行定位方法
    if (iOS8) {
        YDMapLocationiOS8
    }
    
    
    
    //地图显示
    self.mapView=[[MAMapView alloc] initWithFrame:self.mapContainer.bounds];
    self.mapView.delegate = self;
    [self.mapContainer addSubview:self.mapView];
    self.mapView.delegate = self;
    
    self.mapView.showsUserLocation = YES;
    self.mapView.showsScale = NO;
    [self.mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES];
    
    //提示显示
    YDTopMessageView *topMsgView  = [[YDTopMessageView alloc] init];
    topMsgView.frame = CGRectMake(10, 31, 250, 35);
    self.topMsgView = topMsgView;
    [self.view addSubview:topMsgView];
    
}

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
    
    if (self.totalDistance >= 5) {
        MAPointAnnotation *anno = [[MAPointAnnotation alloc] init];
        CLLocation *location = [self.points firstObject];
        anno.coordinate = location.coordinate;
        anno.title = @"起点";
        [self.mapView addAnnotation:anno];
    }
    
    YDSport *sport = [[YDSport alloc] init];
    sport.sportTime = [self.messageView currentTime];
    sport.distance = [NSString stringWithFormat:@"%f", self.totalDistance];
    self.topMsgView.sport = sport;
}

- (MAOverlayView *)mapView:(MAMapView *)mapView viewForOverlay:(id<MAOverlay>)overlay
{
    MAPolylineView *overlayView = nil;
    
    if (overlay == self.routeLine) {
        self.routeLineView = [[MAPolylineView alloc] initWithPolyline:self.routeLine];
        self.routeLineView.strokeColor = [UIColor redColor];
        self.routeLineView.lineWidth = 3;
        self.routeLineView.lineCapType = kMALineCapRound;
        self.routeLineView.lineJoinType = kMALineJoinRound;
        overlayView = self.routeLineView;
    }
    
    return overlayView;
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        MAPointAnnotation *anno = (MAPointAnnotation *)annotation;
        if ([anno.title isEqualToString:@"起点"]) {
            MAPinAnnotationView *annoView = [[MAPinAnnotationView alloc] init];
            annoView.pinColor = 0;
            //大头针
            return annoView;
        }
        
        if ([anno.title isEqualToString:@"终点"]) {
            MAPinAnnotationView *annoView = [[MAPinAnnotationView alloc] init];
            annoView.pinColor = 1;
            //大头针
            return annoView;
        }
    }
    
    //蓝色点
    return nil;
}

#pragma mark - YDMessageViewDelegate
- (void)messageView:(YDMessageView *)msgView start:(UIButton *)start
{
    if (self.points.count != 0) {
        CLLocation *location = [self.points lastObject];
        MAPointAnnotation *anno = [[MAPointAnnotation alloc] init];
        anno.coordinate = location.coordinate;
        anno.title = @"终点";
        [self.mapView addAnnotation:anno];
    }
    //    [UIView animateWithDuration:0.5 animations:^{
    //        self.mapView.height = self.view.height;
    //        self.mapView.y = 20;
    //    }];
    //
    //    self.tabBarController.tabBar.hidden = YES;
    //    self.navigationController.navigationBar.hidden = YES;
}

#pragma mark - 方法
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
    
    //设置模型
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

- (YDMessageView *)messageView
{
    if (!_messageView) {
        
    }
    return _messageView;
}


@end
