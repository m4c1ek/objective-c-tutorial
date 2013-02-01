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

- (void)getFeedsFrom:(NSURL *)feedsLocation withCompletionHandler:(void (^)(EmployeesResponse *))completionHandler;

@end
