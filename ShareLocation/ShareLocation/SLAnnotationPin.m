//
//  SLAnnotationPin.m
//  ShareLocation
//
//  Created by Chen Zeyu on 13-3-20.
//  Copyright (c) 2013年 iosApp. All rights reserved.
//

#import "SLAnnotationPin.h"

@implementation SLAnnotationPin


-(id)initWithCoordinate:(CLLocationCoordinate2D)position andTitle:(NSString*)title andSubtitle:(NSString*)subtitle{
    
    self = [super init];
    
    if(self){
        self.coordinate = position;
        self.title = title;
        self.subtitle = subtitle;
    }
    
    
    return self;
    
}

@end
