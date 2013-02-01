#import "EmployeesResponse.h"


@implementation EmployeesResponse
@synthesize feeds = _feeds;
@synthesize error = _error;


- (id)initWithFeeds:(NSDictionary *) fs {
    self = [super init];
    if (self) {
        self.feeds = fs;
    }
    return self;
}

- (id)initWithError:(NSError*) er {
    self = [super init];
    if (self) {
        self.error= er;
    }
    return self;
}

@end