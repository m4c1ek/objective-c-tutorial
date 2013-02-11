1.  Create a Cocoa Touch static Library project with ARC and Unit testiing
2.  Rename the generated class to Employees
3.  Implement a method for your API to fetch employees feeds from a specific location 
example: `- (void)getFeedsFrom:(NSURL *)feedsLocation withCompletionHandler:(void (^)(EmployeesResponse *))completionHandler;`
4.  Create a test to verify that the method fails - no response returned
5.  Include JSONKit into the project as a git submodule and use it to parse the JSON feed. hint: use -fno-objc-arc flag to exclude ARC
6.  Use dispatch_async to make the api asynchronous.
7.  Fix the test! use a fake runloop to make the test async
8.  Create a method in the API to get an employee image: `- (void)getImageForEmployee:(NSDictionary *)employee withCompletionHandler:(void (^)(UIImage *))completionHandler`. use a function to fetch images from https://gist.github.com/MaciejWalczynski/4757248
9.  Run quick test based on pevious test
