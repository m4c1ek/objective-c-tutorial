#import <Foundation/Foundation.h>
#import "Player.h"
#import "Kicker.h"

int main(int argc, const char * argv[])
{

    Player * player1;
    Player * player2;
    @autoreleasepool {
        player1  = [Player playerWithAge:22 andName:@"Joanna Krupa"];
        [player1 release];
    } // SIGABRT - release object already released
    
    @autoreleasepool {
        player2  = [[Player alloc] initWithAge:100 andName:@"Krzysztof Ibisz"];
        [player2 kickBall];
        [player2 kickBallToHell];
        [player2 release];// release here means that the objects ownership is released
        [player2 kickBall]; // why no EXC_BAD_ACCESS here??
    }
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
    [player2 kickBall]; // EXC_BAD_ACCESS - call method on dealloced object, or maybe not?
    
    NSMutableArray* players = [NSMutableArray array]; // autoreleased
    [players addObject:player1];
    [players addObject:player2];
    
    NSLog(@"starting loop");
    for (id<Kicker> kicker in players) {
        NSLog(@"the class is: %@", NSStringFromClass([kicker class])); // no compiler warning because <NSObject> was defined in Kicker.  
        [kicker kickBall];
    }

    return 0;
}

