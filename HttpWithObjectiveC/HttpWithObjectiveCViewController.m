//
//  HttpWithObjectiveCViewController.m
//  HttpWithObjectiveC
//
//  Created by Toran Billups on 4/6/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import "HttpWithObjectiveCViewController.h"

@implementation HttpWithObjectiveCViewController
@synthesize responseData;

- (void)dealloc
{
    [responseData release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void) viewDidLoad
{
    responseData = [NSMutableData new];
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request setHTTPMethod:@"GET"];
    
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [responseData setLength:0];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    [connection release];
    
    NSString* responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"the html from google was %@", responseString);
    
    [responseString release];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"something very bad happened here");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
