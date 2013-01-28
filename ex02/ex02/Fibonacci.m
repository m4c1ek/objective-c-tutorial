#import "Fibonacci.h"

@implementation Fibonacci
@synthesize cache = _cache;


- (id)init
{
    self = [super init];
    if (self) {
        self.cache = [[NSMutableArray alloc] init];
    }
    return self;
}

- (long)calculate:(long)i {
    if (i <= 1 ) return 1;
    else return [self valueForIndex:i-2] + [self valueForIndex:i-1];
}

- (long)valueForIndex:(long)i {
    long value = 0;
    @try {
        value = [[self.cache objectAtIndex:i] longValue];
    }
    @catch (NSException * exception) {
        value = [self calculate:i];
        [self.cache insertObject:[NSNumber numberWithInteger:value] atIndex:i];
    }
    
    return value;
}

@end
