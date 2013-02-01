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

@end
