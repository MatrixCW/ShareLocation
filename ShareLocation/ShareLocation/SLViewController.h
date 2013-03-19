//
//  SLViewController.h
//  ShareLocation
//
//  Created by Cui Wei on 3/19/13.
//  Copyright (c) 2013 iosApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#define METERS_PER_MILE 1609.344

@interface SLViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *myMapView;
@property CLLocationManager *myLocationManeger;
@end
