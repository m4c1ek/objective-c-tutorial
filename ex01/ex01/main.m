#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        NSString* message = nil; // always use nil instead of null unless you know what you're doing.
        @try {
            message = [NSString stringWithUTF8String:argv[1]];
        }
        @catch (NSException *exception) {
            NSLog(@"provide a parameter");
        }
        @finally {
            
        }
        
        if (message) NSLog(@"you typed: %@", message);
        
    }
    return 0;
}
//now compile it from the command line