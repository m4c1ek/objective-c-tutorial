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
    }
    
    @autoreleasepool {
        player2  = [[Player alloc] initWithAge:100 andName:@"Krzysztof Ibisz"];
        [player2 kickBall];
        [player2 kickBallToHell];
    }
    
    NSMutableArray* players = [NSMutableArray array];
    [players addObject:player1];
    [players addObject:player2];
    
    for (id<Kicker> kicker in players) {
        [kicker retain];
        [kicker kickBall];
    }
    
    return 0;
}

