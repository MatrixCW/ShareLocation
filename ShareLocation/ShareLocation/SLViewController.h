//
//  SLViewController.h
//  ShareLocation
//
//  Created by Cui Wei on 3/19/13.
//  Copyright (c) 2013 iosApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SLConnector.h"

#define METERS_PER_MILE 1609.344

@interface SLViewController : UIViewController 

@property (weak, nonatomic) IBOutlet MKMapView *myMapView;

- (IBAction)locateButtonPressed:(id)sender;
- (IBAction)updateButtonPressed:(id)sender;

@end
