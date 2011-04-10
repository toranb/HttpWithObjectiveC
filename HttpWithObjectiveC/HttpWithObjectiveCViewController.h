//
//  HttpWithObjectiveCViewController.h
//  HttpWithObjectiveC
//
//  Created by Toran Billups on 4/6/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HttpWithObjectiveCViewController : UIViewController {
    NSData* responseData; 
    NSArray* cookies;
}

@property (nonatomic, retain) NSData* responseData;
@property (nonatomic, retain) NSArray* cookies;

- (void) returnHtmlFromPost:(NSString *)responseString;

@end
