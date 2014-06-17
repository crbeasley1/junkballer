//
//  AddPlayerViewController.m
//  Junkballer_app02
//
//  Created by CR Beasley on 6/5/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import "AddPlayerViewController.h"
#import <Parse/Parse.h>

@interface AddPlayerViewController ()

@end

@implementation AddPlayerViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}


// Do any additional setup after loading the view.



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)backButton:(id)sender {
    [self performSegueWithIdentifier:@"backButton" sender:self];
    
}

- (IBAction)addPlayer:(id)sender {
    NSString *playerName = [self.playernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *phone = [self.phoneField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    if ([playerName length] == 0 || [phone length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter a name and phone number!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        
        
    }
    else {
        
        PFObject *newPlayer = [PFObject objectWithClassName:@"newPlayer"];
        newPlayer[@"Name"] = playerName;
        newPlayer[@"Phone"] = phone;
        newPlayer[@"points"]= [[NSNumber alloc] initWithInt:5];
        [newPlayer setObject:[PFUser currentUser] forKey:@"author"];
        [newPlayer saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                // Dismiss the NewPostViewController and show the BlogTableViewController
                }
            
        }];
        
    }
    
    
}
@end
