//
//  BonusPointsViewController.m
//  Junkballer_app02
//
//  Created by CR Beasley on 6/20/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import "BonusPointsViewController.h"
#import <Parse/Parse.h>

@interface BonusPointsViewController ()


@end

@implementation BonusPointsViewController

-(IBAction)addPointsWithSender:(UIView *)sender{
    
    int pointsToAdd;
    
    switch (sender.tag) {
        case 1:
            pointsToAdd = 20;
            break;
        case 2:
            pointsToAdd = 15;
            break;
        case 3:
            pointsToAdd = 15;
            break;
        case 4:
            pointsToAdd = 10;
            break;
        case 5:
            pointsToAdd = 5;
            break;
        default:
            break;
            
    }
    
    int playersCurrentPoints = [self.junkerballer[@"points"] intValue];
    self.junkerballer[@"points"] = [NSNumber numberWithInt:playersCurrentPoints + pointsToAdd];
    
    //[self.junkerballer saveInBackground];
    [self.junkerballer saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Dismiss the NewPostViewController and show the BlogTableViewController
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Good work. Points Added!" message: [error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
        else {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


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
