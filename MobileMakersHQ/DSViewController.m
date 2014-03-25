//
//  DSViewController.m
//  MobileMakersHQ
//
//  Created by Dan Szeezil on 3/25/14.
//  Copyright (c) 2014 Dan Szeezil. All rights reserved.
//

#import "DSViewController.h"
#import "MapKit/MapKit.h"



@interface DSViewController () <MKMapViewDelegate>


@property (weak, nonatomic) IBOutlet MKMapView *mapView;



@end

@implementation DSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(41.89373984, -87.63532979);
    
    MKCoordinateSpan coordinateSpan = MKCoordinateSpanMake(.01, .01);
    
    MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate, coordinateSpan);
    
    self.mapView.region = region;
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    
    annotation.coordinate = centerCoordinate;
    annotation.title = @"Mobile Makers";
    [self.mapView  addAnnotation:annotation];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    
    MKPinAnnotationView *pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    
    pin.image = [UIImage imageNamed:@"Image"];
    pin.canShowCallout = YES;
    pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return pin;
    
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    NSLog(@"you tapped me");
    
}

@end







