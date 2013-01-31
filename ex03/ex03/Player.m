#import "Player.h"

@implementation Player

+ (id)playerWithAge:(NSInteger)a andName:(NSString*)n
{
    return [[[Player alloc] initWithAge:a andName:n] autorelease];
}


- (id)initWithAge:(NSInteger)a andName:(NSString*)n
{
    self = [super init];
    if (self) {
        self.age = a;
        self.name = n;
    }
    return self;
}

- (void) kickBall {
    NSLog(@"player %@ kicked the ball", self.name);
}

- (void) kickBallToHell {
    NSObject* ball = [[NSObject alloc] init];
    ball = [[NSObject alloc] init];
    NSLog(@"player %@ kicked the ball to hell", self.name);
}

@end;

