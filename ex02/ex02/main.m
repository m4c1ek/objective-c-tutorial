//
//  main.m
//  ex02
//
//  Created by Walczynski, Maciej on 1/28/13.
//  Copyright (c) 2013 Walczynski, Maciej. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fibonacci.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSDate* d = [NSDate date];
        Fibonacci * fib = [[Fibonacci alloc] init];
        long i = 0;
        while ( i <= 100 ){
            NSLog(@"value for %li: %li\n", i , [fib calculate:i++]);
        }
        NSLog(@"complete in %f seconds", [[NSDate date] timeIntervalSinceDate:d]);
    }
    return 0;
}

