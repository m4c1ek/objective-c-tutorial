//
//  Fibonacci.h
//  ex02
//
//  Created by Walczynski, Maciej on 1/28/13.
//  Copyright (c) 2013 Walczynski, Maciej. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fibonacci : NSObject

@property(nonatomic, strong) NSMutableArray *cache;

- (long)calculate:(long)i;
@end
