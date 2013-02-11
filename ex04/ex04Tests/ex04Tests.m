//
//  ex04Tests.m
//  ex04Tests
//
//  Created by Walczynski, Maciej on 2/11/13.
//  Copyright (c) 2013 Walczynski, Maciej. All rights reserved.
//

#import "ex04Tests.h"
#import "Employees.h"

@implementation ex04Tests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testGetFeeds
{
    Employees* employees = [[Employees alloc] init];
    NSURL* myUrl = [NSURL URLWithString:@"http://localhost:8080/contacts.json"];
    __block BOOL done = NO;
    [employees getFeedsFrom:myUrl withCompletionHandler:^(EmployeesResponse* response){
        STAssertTrue(response != nil, @"there was no response returned:(");
        STAssertTrue([response.feeds count] > 0, @"the response does not have any data");
        done = YES;
    }];
    
    while (!done) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    }
    NSAssert(done, @"the response did not come in within 10 seconds");

}

- (void)testGetImage
{
    Employees* employees = [[Employees alloc] init];
    __block BOOL done = NO;
    
    NSDictionary *employee = [NSDictionary dictionaryWithObjectsAndKeys:@"Maciej",@"firstname",@"Walczynski",@"lastname", nil];
    [employees getImageForEmployee:employee withCompletionHandler:^(UIImage* image){
        STAssertTrue(image != nil, @"there was no image");
        STAssertTrue(image.size.height > 0, @"there image has no size");
        done = YES;
    }];
    
    while (!done) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    }
    NSAssert(done, @"the response did not come in within 10 seconds");
    
}

@end
