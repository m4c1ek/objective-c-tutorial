#import <Foundation/Foundation.h>
#import "Kicker.h"

@interface Player : NSObject <Kicker>
@property NSInteger age;
@property (retain) NSString* name;

- (id)initWithAge:(NSInteger)a andName:(NSString*)n;
+ (id)playerWithAge:(NSInteger)a andName:(NSString*)n;

- (void) kickBall;
- (void) kickBallToHell;
@end
