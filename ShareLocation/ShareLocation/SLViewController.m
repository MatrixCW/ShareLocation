//
//  SLViewController.m
//  ShareLocation
//
//  Created by Cui Wei on 3/19/13.
//  Copyright (c) 2013 iosApp. All rights reserved.
//

#import "SLViewController.h"

@interface SLViewController ()

@property NSMutableArray *coorinateds;
@property NSString* ipAddress;
@property SLConnector *connector;
@end


@implementation SLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.coorinateds = [NSMutableArray array];
    
    self.connector = [[SLConnector alloc] init];
    self.connector.myDelegate = self;
    
    [self.connector getMyIPAddress];
    
}


-(void)cleanUp{
    [self.connector deleteMyDataWithIPaddress:self.ipAddress];
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
    
    
    
    //the rectangle region containing the center point
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation,
                                                                       100*METERS_PER_MILE,
                                                                       100*METERS_PER_MILE);
    
    [self.myMapView setRegion:viewRegion animated:YES];
    
}


-(void)requestReturnedData:(NSData*)data{
    
    [self.coorinateds removeAllObjects];
    
    NSString *string = [[NSString alloc] initWithData:data
                                             encoding:NSASCIIStringEncoding];
    
    if ([string rangeOfString:@"["].location != NSNotFound) {

        
        NSArray *components = [string componentsSeparatedByString:@"\""];
        
        for(id object in components){
            
            NSMutableString *temp = [[NSMutableString alloc] initWithString:(NSString*)object];
            NSString* parsedTemp = [temp stringByReplacingOccurrencesOfString:@"\"" withString:@""];
            
            if([self stringIsNumeric:parsedTemp])
                [self.coorinateds addObject:parsedTemp];
        }

        [self plotPinToGraph];
    }
    else{
        
        self.ipAddress = string;
        
        
    }

    
}


-(void)plotPinToGraph{
    
    [self removeAnnotations];
    
    for(int i=0; i<self.coorinateds.count; i = i+2){
        
        CLLocationCoordinate2D testLocation;
        NSString* longitudeString = (NSString*)[self.coorinateds objectAtIndex:i];
        NSString* latitudeString = (NSString*)[self.coorinateds objectAtIndex:(i+1)];
        testLocation.longitude = [longitudeString doubleValue];
        testLocation.latitude = [latitudeString doubleValue];
         SLAnnotationPin* test = [[SLAnnotationPin alloc] initWithCoordinate:testLocation
                                                                   andTitle:Nil
                                                                andSubtitle:Nil];
        
        [self.myMapView addAnnotation:test];
        
    }
}


-(void)removeAnnotations{
    
    NSMutableArray *toRemove = [NSMutableArray arrayWithCapacity:10];
    for (id annotation in self.myMapView.annotations)
        if (annotation != self.myMapView.userLocation)
            [toRemove addObject:annotation];
    [self.myMapView removeAnnotations:toRemove];
}

-(BOOL)stringIsNumeric:(NSString*) myString{
    
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    return [nf numberFromString:myString] != Nil;
    
}


- (IBAction)locateButtonPressed:(id)sender {
    [self locateMyPosition];
}

- (IBAction)updateButtonPressed:(id)sender {
    
    [self.connector getMyIPAddress];
    
    NSNumber *longitude = [NSNumber numberWithDouble:self.myMapView.userLocation.coordinate.longitude];
    NSNumber *latitude = [NSNumber numberWithDouble:self.myMapView.userLocation.coordinate.latitude];
    
    [self.connector postMyLocationIPaddress:self.ipAddress
                                  longitude:[longitude stringValue]
                                andLatitude:[latitude stringValue]];
    
    [self.connector getAllUserLocation];
}

- (IBAction)clearButtonPressed:(id)sender {
    
    [self removeAnnotations];
}
@end
