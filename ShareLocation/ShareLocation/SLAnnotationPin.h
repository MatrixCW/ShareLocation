//
//  SLAnnotationPin.h
//  ShareLocation
//
//  Created by Chen Zeyu on 13-3-20.
//  Copyright (c) 2013年 iosApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface SLAnnotationPin : NSObject <MKAnnotation> 

@property CLLocationCoordinate2D coordinate;
@property NSString *title;
@property NSString *subtitle;


-(id)initWithCoordinate:(CLLocationCoordinate2D)position andTitle:(NSString*)title andSubtitle:(NSString*)subtitle;

@end
