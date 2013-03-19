//
//  SLViewController.m
//  ShareLocation
//
//  Created by Cui Wei on 3/19/13.
//  Copyright (c) 2013 iosApp. All rights reserved.
//

#import "SLViewController.h"

@interface SLViewController ()

- (void)viewWillAppear:(BOOL)animated;

@end


@implementation SLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}


/*
- (void)viewWillAppear:(BOOL)animated {
    //set up an initial location to zoom into
    
    CLLocationCoordinate2D zoomLocation;//center point
    zoomLocation.latitude = 39.281516;
    zoomLocation.longitude= -76.580806;
    
    //the rectangle region containing the center point
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation,
                                                                       10000*METERS_PER_MILE,
                                                                       10000*METERS_PER_MILE);
    
    [self.myMapView setRegion:viewRegion animated:YES];
    
}

-(void)test{
    
    MKUserLocation *temp = self.myMapView.userLocation;
    NSLog(@"here %@", temp.location);
    
}
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
