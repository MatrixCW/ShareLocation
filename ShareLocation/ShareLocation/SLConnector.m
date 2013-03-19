//
//  SLConnector.m
//  ShareLocation
//
//  Created by Cui Wei on 3/20/13.
//  Copyright (c) 2013 iosApp. All rights reserved.
//

#import "SLConnector.h"

@interface SLConnector()

@property NSData *receivedData;

@end

@implementation SLConnector

-(void)getAllUserLocation{
    
    //build up the request that is to be sent to the server
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:
                                                                             @"http://ec2-54-251-66-243.ap-southeast-1.compute.amazonaws.com/getWardData.php"]];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(!connection)
        NSLog(@"Connection Failed");
    
    
}


-(void)postMyLocation{
    
    //build up the request that is to be sent to the server
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:
                                                                             @"http://ec2-54-251-66-243.ap-southeast-1.compute.amazonaws.com/getHistoryData.php?id=6"]];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(!connection){
        NSLog(@"Connection Failed");
    }
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    // executed when the connection receives data

    NSString *string = [[NSString alloc] initWithData:data
                                             encoding:NSASCIIStringEncoding];
    NSLog(@"%@", string);
    self.receivedData = data;
    
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    //executed when the connection fails
    
    NSLog(@"Connection failed with error: %@",error.localizedDescription);
}

-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    

}
-
(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSLog(@"Request Complete,recieved %d bytes of data", self.receivedData.length);
    
    [self.myDelegate requestReturnedData:self.receivedData];
}

@end
