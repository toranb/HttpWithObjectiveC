#import "DoHttpPostWithCookie.h"

@implementation DoHttpPostWithCookie
@synthesize viewController;
@synthesize responseData;

- (id) init
{
    return [self initWithViewController:nil];
}

- (id) initWithViewController:(UIViewController *)vwController
{
    if (self == [super init])
    {
        responseData = [NSMutableData new];
        self.viewController = vwController;
    }
    return self;
}

- (void)startHttpRequestWithCookie:(NSArray *)authCookies
{
    NSURL *url = [NSURL URLWithString:@"http://toranbillups.com/phone/AddSuggestion"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    NSData *requestData = [@"name=testname&suggestion=testing123" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary* headers = [NSHTTPCookie requestHeaderFieldsWithCookies:authCookies];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    [request setAllHTTPHeaderFields:headers];
    
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
    [viewController returnHtmlFromPost:responseString];
    
    [responseString release];
}

- (void)dealloc {
    [viewController release];
    [responseData release];
    [super dealloc];
}

@end
