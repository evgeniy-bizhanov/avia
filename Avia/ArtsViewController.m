//
//  ViewController.m
//  Avia
//
//  Created by Евгений Бижанов on 18.09.2018.
//  Copyright © 2018 Евгений Бижанов. All rights reserved.
//

#import "ArtsViewController.h"
#import <MapKit/MapKit.h>
#import "ApiManager.h"
#import "Entity/Art.h"
#import "Helper/Geo.h"
#import "ArtViewController.h"


@interface ArtsViewController () <MKMapViewDelegate>

@property(nonatomic, strong) MKMapView *mapView;
@property(nonatomic, strong) Arts *arts;
@property(nonatomic, assign) Boolean didAppear;

@end

@implementation ArtsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"Arts";
    
    CGRect frame = self.view.frame;
    _mapView = [[MKMapView alloc] initWithFrame:frame];
    _mapView.delegate = self;
    
    [self.view addSubview:_mapView];
    
    [ApiManager.sharedInstance fetchArts:^(Arts * _Nonnull arts) {
        self->_arts = arts;
        [self setAnnotations:arts];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (_didAppear) {
        return;
    }
    
    [Geo locationFromAddress:@"Honolulu" completion:^(CLPlacemark * _Nonnull placemark) {
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(placemark.location.coordinate, 1000, 1000);
        [self->_mapView setRegion:region animated:YES];
        self->_didAppear = true;
    }];
}

- (void)setAnnotations:(Arts *)arts {
    [_mapView removeAnnotations:_mapView.annotations];
    
    for(Art *art in [arts array]) {
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.title = art.title;
        annotation.subtitle = art.desc;
        
        annotation.coordinate = CLLocationCoordinate2DMake(
                                                           [art.latitude doubleValue],
                                                           [art.longitude doubleValue]);
        
        [_mapView addAnnotation:annotation];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKMarkerAnnotationView *markerView = (MKMarkerAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"marker"];
    
    if(!markerView) {
        markerView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"marker"];
        markerView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoDark];
        markerView.canShowCallout = YES;
    }
    
    return markerView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    NSInteger index = [mapView.annotations indexOfObject:view.annotation];
    
    Art *art = _arts.array[index];
    ArtViewController *viewController = [[ArtViewController alloc] initWithArt:art];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
