#import <Foundation/Foundation.h>


@interface EmployeesResponse : NSObject

@property(nonatomic, strong) NSDictionary *feeds;
@property(nonatomic, strong) NSError *error;

- (id)initWithFeeds:(NSDictionary *) fs;
- (id)initWithError:(NSError *)er;

@end