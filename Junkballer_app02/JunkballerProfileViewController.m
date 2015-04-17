//
//  JunkballerProfileViewController.m
//  Junkballer_app02
//
//  Created by Ryan Maciel on 6/30/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import "JunkballerProfileViewController.h"
#import "BonusPointsViewController.h"
#import "JunkballerRedeemPointsTableViewController.h"
#import "ScannerViewController.h"
#import "AddPlayerViewController.h"
#import "JunkballerModel.h"
#import <KiipSDK/KiipSDK.h>


@interface JunkballerProfileViewController ()
@property(strong, nonatomic)IBOutlet UILabel *nameLabel;
@property(strong, nonatomic)IBOutlet UILabel *pointsLabel;

@end

@implementation JunkballerProfileViewController
@synthesize junkerballer = _junkerballer;
@synthesize nameLabel = _nameLabel;
@synthesize pointsLabel = _pointsLabel;
@synthesize playerObject = _playerObject;
@synthesize model = _model;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.model = [JunkballerModel sharedManager];
    // Do any additional setup after loading the view.
    if(self.junkerballer){
        self.nameLabel.text = self.junkerballer[@"name"];
        self.pointsLabel.text = [self.junkerballer[@"points"] stringValue];
    }
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.pointsLabel.text = [self.junkerballer[@"points"] stringValue];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"BonusPoints"]){
        BonusPointsViewController *bonusPoints = segue.destinationViewController;
        bonusPoints.junkerballer = self.junkerballer;
    }
    if([segue.identifier isEqualToString:@"RedeemPoints"]){
        JunkballerRedeemPointsTableViewController *redeemPointsController = segue.destinationViewController;
        redeemPointsController.junkballer = self.junkerballer;
        
    }
    
}


- (IBAction)checkIn:(id)sender {
    
        NSDate *currentDate = [NSDate date];
        //NSLog(@"%@", currentDate);
        //self.junkerballer[@"checkInDate"] = currentDate;
    
    
    
    
    
   if(self.junkerballer[@"checkInDate"] == nil || 28800 < [currentDate timeIntervalSinceDate:((NSDate*)self.junkerballer[@"checkInDate"])])
       
   {
       //do stuff
       
       int playersCurrentPoints = [self.junkerballer[@"points"] intValue];
       self.junkerballer[@"points"]= [NSNumber numberWithInt:playersCurrentPoints + 5];
       self.junkerballer[@"checkInDate"] = [NSDate date];
       [self.junkerballer saveInBackground];
       
       [self.junkerballer saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
           if (!error) {
               // Dismiss the NewPostViewController and show the BlogTableViewController
               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Points Added!" message: [error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
               [alertView show];
               
               
               
                          }

       }];
       

       
       
       
       
       
   }
    
  
    
    
    else
        {
        
        //show alert <24 hrs.
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"You can only check in once a day! Try getting some bonus points!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
        [alertView show];
        
        
    }
    
    
    
    
    
}


@end

