#import <UIKit/UIKit.h>

#import "Employees.h"
#import "EmployeesResponse.h"
#import "JSONKit.h"

@implementation Employees

- (void)getFeedsFrom:(NSURL *)feedsLocation withCompletionHandler:(void (^)(EmployeesResponse *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @try {
            NSError *error = nil;
            NSData* returnData = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:feedsLocation]returningResponse:nil error:&error];
            if (error) @throw [NSException exceptionWithName:@"" reason:@"" userInfo:nil];
            id feeds = [[JSONDecoder decoder] objectWithData:returnData];
            completionHandler([[EmployeesResponse alloc] initWithFeeds:feeds]);
        } @catch (NSException *) {
            completionHandler([[EmployeesResponse alloc] initWithError:[NSError errorWithDomain:@"EmployeesRequestError" code:ErrorGeneral userInfo:nil]]);
        }
    });
};


- (void)getEmployeeImage :(NSDictionary *)employee withCompletionHandler:(void (^)(UIImage*) )completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^() {
        NSString *s = [[NSString alloc] initWithFormat:@"http://www.linkedin.com/pub/dir/?first=%@&last=%@&search=Go",
                        [NSString stringWithString:[employee objectForKey:@"firstname"]],
                        [NSString stringWithString:[employee objectForKey:@"lastname"]]];
        NSURL* imageLocation = [NSURL URLWithString:s];
        NSError* error = nil;
        NSString* returnDataString = [NSString stringWithContentsOfURL:imageLocation encoding:NSUTF8StringEncoding error:&error];
        if (!returnDataString) return;

        dispatch_sync(dispatch_get_main_queue(), ^{
            NSDataDetector* detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
            NSArray* matches = [detector matchesInString:returnDataString options:0 range:NSMakeRange(0, [returnDataString length])];
            for (NSTextCheckingResult* match in matches) {
                if ([[[match URL] pathExtension] isEqualToString:@"jpg"]) {
                    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[match URL]]];
                    completionHandler(image);
                    break;
                }
            }
        });

    });
}
    
@end
