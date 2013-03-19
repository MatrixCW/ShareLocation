//
//  SLConnector.h
//  ShareLocation
//
//  Created by Cui Wei on 3/20/13.
//  Copyright (c) 2013 iosApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol requestReturnedData <NSObject>

-(void)requestReturnedData:(NSData*)data;

@end

@interface SLConnector : NSObject <NSURLConnectionDelegate,NSURLConnectionDataDelegate>

@property (weak) id<requestReturnedData> myDelegate;

-(void)getAllUserLocation;
-(void)postMyLocation;

@end
