//
//  HttpWithObjectiveCAppDelegate.h
//  HttpWithObjectiveC
//
//  Created by Toran Billups on 4/6/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HttpWithObjectiveCViewController;

@interface HttpWithObjectiveCAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HttpWithObjectiveCViewController *viewController;

@end
