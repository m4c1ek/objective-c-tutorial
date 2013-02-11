//
//  ex04.h
//  ex04
//
//  Created by Walczynski, Maciej on 2/11/13.
//  Copyright (c) 2013 Walczynski, Maciej. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EmployeesResponse.h"

@interface Employees : NSObject

- (void)getFeedsFrom:(NSURL *)feedsLocation withCompletionHandler:(void (^)(EmployeesResponse *))completionHandler;
- (void)getImageForEmployee:(NSDictionary *)employee withCompletionHandler:(void (^)(UIImage *))completionHandler;
@end
