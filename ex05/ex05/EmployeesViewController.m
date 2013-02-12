//
//  EmployeesViewController.m
//  ex05
//
//  Created by Walczynski, Maciej on 2/11/13.
//  Copyright (c) 2013 Walczynski, Maciej. All rights reserved.
//

#import "EmployeesViewController.h"
#import "Employees.h"
#import "DetailViewController.h"

@interface EmployeesViewController ()

@end

@implementation EmployeesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.images = [[NSMutableDictionary alloc] init];
    NSURL *feedsUrl = [NSURL URLWithString:@"http://192.168.10.245:3000/contacts.json"];
    [[[Employees alloc] init] getFeedsFrom:feedsUrl withCompletionHandler:^(EmployeesResponse * employeesResponse) {
        self.employees = employeesResponse.feeds;
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.employees count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary* employee = [self.employees objectAtIndex:indexPath.row];
    NSString* fullname  = [NSString stringWithFormat:@"%@ %@", [employee objectForKey:@"firstname"],[employee objectForKey:@"lastname"]];
    cell.textLabel.text = fullname;
    
    UIImage* image = [self.images objectForKey:indexPath];
    cell.imageView.image = image;
    if (!image) {
        EmployeesViewController* this = self;
        [[[Employees alloc]init]getImageForEmployee:employee withCompletionHandler:^(UIImage* image){
            [this.images setObject:image forKey:indexPath];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }];
    }
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
     DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
     detailViewController.employeeData = [self.employees objectAtIndex:indexPath.row];
    NSLog(@"%@", detailViewController.employeeData);
     detailViewController.employeeImage = [self.images objectForKey:indexPath];
     [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
