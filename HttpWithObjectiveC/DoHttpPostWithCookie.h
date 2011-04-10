#import <Foundation/Foundation.h>

@class UIViewController;

@interface DoHttpPostWithCookie : NSObject {
    NSMutableData* responseData;
    UIViewController* viewController;
}

@property (nonatomic, retain) UIViewController* viewController;
@property (nonatomic, retain) NSMutableData* responseData;

- (id) initWithViewController:(UIViewController *)vwController;
- (void)startHttpRequestWithCookie:(NSArray *)authCookies;

@end
