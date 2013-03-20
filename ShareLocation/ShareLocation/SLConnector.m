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
                                                                             @"http://ec2-50-112-192-193.us-west-2.compute.amazonaws.com/getAllData.php"]];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(!connection)
        NSLog(@"Connection Failed");
    
    
}

-(void)getMyIPAddress{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:
                                                                             @"http://ec2-50-112-192-193.us-west-2.compute.amazonaws.com/getClientIpAddress.php"]];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(!connection)
        NSLog(@"Connection Failed");
    
}


-(void)postMyLocationIPaddress:(NSString*)IPAdress longitude:(NSString*)longitude andLatitude:(NSString*)latitude{
    
    //build up the request that is to be sent to the server
    
    NSString* requestString = [NSString stringWithFormat:@"http://ec2-50-112-192-193.us-west-2.compute.amazonaws.com/insertMyLocation.php?ip=%@&long=%@&lat=%@", IPAdress, longitude,latitude];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:requestString]];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(!connection){
        NSLog(@"Connection Failed");
    }
}


-(void)deleteMyDataWithIPaddress:(NSString*)IPAdress{
    
    NSString* requestString = [NSString stringWithFormat:@"http://ec2-50-112-192-193.us-west-2.compute.amazonaws.com/deleteMyLocation.php?ip=%@", IPAdress];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:requestString]];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(!connection){
        NSLog(@"Connection Failed");
    }
    
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    // executed when the connection receives data

    self.receivedData = data;
        
    
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    //executed when the connection fails
    
    NSLog(@"Connection failed with error: %@",error.localizedDescription);
}



-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    
}



-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    [self.myDelegate requestReturnedData:self.receivedData];

}




@end
