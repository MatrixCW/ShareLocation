//
//  SLViewController.m
//  ShareLocation
//
//  Created by Cui Wei on 3/19/13.
//  Copyright (c) 2013 iosApp. All rights reserved.
//

#import "SLViewController.h"

@interface SLViewController ()


@end


@implementation SLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SLConnector *test = [[SLConnector alloc] init];
    [test getAllUserLocation];
    
    
    /*
    CLLocationCoordinate2D testLocation;
    testLocation.longitude = 103.7500;
    testLocation.latitude = 1.3667;
    SLAnnotationPin* test = [[SLAnnotationPin alloc] initWithCoordinate:testLocation
                                                               andTitle:@"Someone is here!"
                                                            andSubtitle:Nil];
    
    [self.myMapView addAnnotation:test];
     */
    
    
}




- (void)locateMyPosition{
    //set up an initial location to zoom into
    
    if(!self.myMapView.userLocation.location){
        
        UIAlertView *noLocationDataAvailable = [[UIAlertView alloc] initWithTitle:@"Locating Failed :("
                                                                          message:@"Oops It seems that no location data can be fetched."
                                                                         delegate:self
                                                                cancelButtonTitle:@"Got it. I'll check."
                                                                otherButtonTitles:nil];
        [noLocationDataAvailable show];
        
        return;
    }
    
    
    CLLocationCoordinate2D zoomLocation;//center point
    zoomLocation.latitude = self.myMapView.userLocation.location.coordinate.latitude;
    zoomLocation.longitude= self.myMapView.userLocation.location.coordinate.longitude;
    
    NSLog(@"%lf, %lf", zoomLocation.latitude, zoomLocation.longitude);
    
    //the rectangle region containing the center point
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation,
                                                                       100*METERS_PER_MILE,
                                                                       100*METERS_PER_MILE);
    
    [self.myMapView setRegion:viewRegion animated:YES];
    
}


- (IBAction)locateButtonPressed:(id)sender {
    [self locateMyPosition];
}

- (IBAction)updateButtonPressed:(id)sender {
}
@end
