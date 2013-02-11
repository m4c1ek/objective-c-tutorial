//
//  Employees.h
//  Employees
//
//  Created by Walczynski, Maciej on 2/1/13.
//  Copyright (c) 2013 Walczynski, Maciej. All rights reserved.
//

#import <Foundation/Foundation.h>

enum  {
    ErrorGeneral
} EmployeeFetchErrors;

@class EmployeesResponse;


@interface Employees : NSObject

@property(nonatomic, strong) NSMutableDictionary *images;

- (void)getFeedsFrom:(NSURL *)feedsLocation withCompletionHandler:(void (^)(EmployeesResponse *))completionHandler;
- (void)getEmployeeImage :(NSDictionary *)employee withCompletionHandler:(void (^)(UIImage*) )completionHandler;

@end
