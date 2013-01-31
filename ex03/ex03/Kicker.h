#import <Foundation/Foundation.h>

@protocol Kicker <NSObject> // this is here to avoid compiler warnings ex. when using id<Kicker>
@required
- (void) kickBall;
@end
