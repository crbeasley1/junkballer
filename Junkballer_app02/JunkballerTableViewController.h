//
//  JunkballerTableViewController.h
//  Junkballer_app02
//
//  Created by CR Beasley on 6/18/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface JunkballerTableViewController : UITableViewController

@property (nonatomic, retain) NSString *junkballers;
@property (nonatomic, strong) PFUser *currentUser;
@property(nonatomic, readonly, retain) UILabel *detailTextLabel;
@property (nonatomic, assign) BOOL pullToRefreshEnabled;
@property(strong, nonatomic)NSArray *allPlayers;



- (IBAction)logout:(id)sender;







@end





