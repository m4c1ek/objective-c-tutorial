//
//  DetailViewController.m
//  ex05
//
//  Created by Walczynski, Maciej on 2/11/13.
//  Copyright (c) 2013 Walczynski, Maciej. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
    
    - (IBAction) call;
- (IBAction) mail;
@end

@implementation DetailViewController

- (IBAction) call {
    NSString *phoneNumber = [[NSString stringWithFormat:@"%@%@", @"tel://" ,[self.employeeData objectForKey:@"phone"]] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

- (IBAction) mail {
    NSString *email = [NSString stringWithFormat:@"%@%@", @"mailto://" ,[self.employeeData objectForKey:@"email"]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imageView.image = self.employeeImage;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
