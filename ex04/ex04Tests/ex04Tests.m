//
//  ex04Tests.m
//  ex04Tests
//
//  Created by Walczynski, Maciej on 2/1/13.
//  Copyright (c) 2013 Walczynski, Maciej. All rights reserved.
//

#import "ex04Tests.h"
#import "Employees.h"
#import "EmployeesResponse.h"

@implementation ex04Tests
@synthesize employees = _employees;


- (void)setUp
{

    self.employees = [[Employees alloc] init];
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testGetFeeds
{
    __block BOOL done = NO;
    __block NSURL *location = [NSURL URLWithString:@"http://localhost:8081/contacts.json"];
    [self.employees getFeedsFrom:location withCompletionHandler:^(EmployeesResponse *response) {
        STAssertTrue(response.feeds != nil, @"feeds not OK");
        STAssertTrue([[response.feeds objectForKey:@"file"] count] > 0, @"there are no employees");
        done = YES;
    }];
    while (YES) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate
                dateWithTimeIntervalSinceNow:1.0]];
    };
}

@end
