//
//  JunkballerTableViewController.m
//  Junkballer_app02
//
//  Created by CR Beasley on 6/18/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import "JunkballerTableViewController.h"
#import <Parse/Parse.h>
#import "JunkballerModel.h"
#import "JunkballerProfileViewController.h"

@interface JunkballerTableViewController ()
@property(strong, nonatomic)PFObject *junkballerTappedOn;
@property(strong, nonatomic)JunkballerModel *model;
@end

@implementation JunkballerTableViewController
@synthesize junkballerTappedOn = _junkballerTappedOn;
@synthesize model = _model;




- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.model = [JunkballerModel sharedManager];
    [self.tableView reloadData];
    
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.model.allPlayers count];
    
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"junkballerCell";
    NSLog(@"%@",CellIdentifier);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"junkballerCell" forIndexPath:indexPath];
    
    //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    PFObject *junkballers = [self.model.allPlayers objectAtIndex:indexPath.row];
    [cell.textLabel setText:[junkballers objectForKey:@"name"]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",
                                 [junkballers objectForKey:@"points"]];
    [cell layoutIfNeeded];
    
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.junkballerTappedOn = [self.model.allPlayers objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"JunkballerProfile" sender:self];
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


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


#pragma mark - Navigation


- (IBAction)logout:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"showLogin" sender:self];
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLogin"]) {
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    }
    
    if([segue.identifier isEqualToString:@"JunkballerProfile"]){
        JunkballerProfileViewController *profileController = segue.destinationViewController;
        profileController.junkerballer = self.junkballerTappedOn;
    }
   
}

@end


