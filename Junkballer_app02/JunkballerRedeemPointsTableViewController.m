//
//  JunkballerRedeemPointsTableViewController.m
//  Junkballer_app02
//
//  Created by Ryan Maciel on 6/30/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import "JunkballerRedeemPointsTableViewController.h"

@interface JunkballerRedeemPointsTableViewController ()

@property(strong, nonatomic)NSArray *rewards;

@end

@implementation JunkballerRedeemPointsTableViewController
@synthesize rewards = _rewards;

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *cellData = self.rewards[indexPath.row];
    
    int junkballerPoints = [self.junkballer[@"points"] intValue];

    if(junkballerPoints - [cellData[@"points"] intValue] < 0){
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Sorry Charlie!" message:@"You don't have enough points." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [errorAlert show];
    }
    
    else{
        self.junkballer[@"points"] = [NSNumber numberWithInt:junkballerPoints - [cellData[@"points"] intValue]];
        
        [self.junkballer saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                // Dismiss the NewPostViewController and show the BlogTableViewController
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You got Free Stuff!" message: [error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
            else {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
            
        }];
        [self.view endEditing:YES];
        
    }
    
    }


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.rewards = @[@{@"title" : @"Overwrap Grip", @"points" : @35},
                     @{@"title" : @"Vibration Dampener", @"points" : @35},
                     @{@"title" : @"Skittle!", @"points" : @35},
                     @{@"title" : @"Dot Upgrade", @"points" : @50},
                     @{@"title" : @"Can of Balls", @"points" : @50},
                     @{@"title" : @"Replacement Grip", @"points" : @75},
                     @{@"title" : @"Ice Cream Cone", @"points" : @75},
                     @{@"title" : @"Hat", @"points" : @100},
                     @{@"title" : @"T-Shirt", @"points" : @100},
                     @{@"title" : @"Racket Restring", @"points" : @200},
                     @{@"title" : @"1/2 Hour Lesson", @"points" : @225},
                     @{@"title" : @"Free Tennis Shoes", @"points" : @250},
                     @{@"title" : @"Sweatshirt", @"points" : @75},
                     @{@"title" : @"Racket Bag", @"points" : @400},
                     @{@"title" : @"Free Racket", @"points" : @500}];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return self.rewards.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RewardCell" forIndexPath:indexPath];
    NSDictionary *cellData = [self.rewards objectAtIndex:indexPath.row];
    cell.textLabel.text = cellData[@"title"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ points", cellData[@"points"]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
