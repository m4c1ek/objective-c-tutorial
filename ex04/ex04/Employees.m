//
//  ex04.m
//  ex04
//
//  Created by Walczynski, Maciej on 2/11/13.
//  Copyright (c) 2013 Walczynski, Maciej. All rights reserved.
//

#import "Employees.h"
#import "JSONKit.h"

@implementation Employees


- (NSURL*)imageUrlFromLinkedInForEmployee:(NSDictionary*) employee {
    NSString *s = [[NSString alloc] initWithFormat:@"http://www.linkedin.com/pub/dir/?first=%@&last=%@&search=Go",
                   [NSString stringWithString:[employee objectForKey:@"firstname"]],
                   [NSString stringWithString:[employee objectForKey:@"lastname"]]];
    NSURL* imageLocation = [NSURL URLWithString:s];
    NSError* error = nil;
    NSString* returnDataString = [NSString stringWithContentsOfURL:imageLocation encoding:NSUTF8StringEncoding error:&error];
    if (!returnDataString) return nil;
    
    NSDataDetector* detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    NSArray* matches = [detector matchesInString:returnDataString options:0 range:NSMakeRange(0, [returnDataString length])];
    for (NSTextCheckingResult* match in matches) {
        NSURL* url = [match URL];
        if ([[url pathExtension] isEqualToString:@"jpg"]) {
            return url;
        }
    }
    return nil;
}

- (void)getFeedsFrom:(NSURL *)feedsLocation withCompletionHandler:(void (^)(EmployeesResponse *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        EmployeesResponse* er = [[EmployeesResponse alloc] init];
        id feeds = [[JSONDecoder decoder] parseJSONData:[NSData dataWithContentsOfURL:feedsLocation]];
        NSAssert([feeds isKindOfClass:[NSDictionary class]], @"not a dictionary");
        er.feeds = [feeds objectForKey:@"file"];
        dispatch_sync(dispatch_get_main_queue(), ^{
            completionHandler(er);
        });
    });
}

- (void)getImageForEmployee:(NSDictionary *)employee withCompletionHandler:(void (^)(UIImage *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL* imageUrl = [self imageUrlFromLinkedInForEmployee:employee];
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSData* imageData = [NSData dataWithContentsOfURL:imageUrl];
            UIImage* image = [UIImage imageWithData:imageData];
            completionHandler(image);
        });
    });
    
}



@end
