//
//  ClubProfileViewController.m
//  Junkballer_app02
//
//  Created by CR Beasley on 1/8/15.
//  Copyright (c) 2015 TennisIQ. All rights reserved.
//

#import "ClubProfileViewController.h"
#import "JunkballerProfileViewController.h"
#import "Parse/Parse.h"
#import "JunkballerModel.h"
#import <KiipSDK/KiipSDK.h>


@interface ClubProfileViewController ()



@end

@implementation ClubProfileViewController

@synthesize clubName = _clubName;
@synthesize currentUser = _currentUser;
@synthesize lessonNumber = _lessonNumber;


- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
   
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    NSString *clubName =[[PFUser currentUser] objectForKey:@"username"];
    self.clubName.text = clubName;
    
    PFQuery *lessonQuery = [PFQuery queryWithClassName:@"Lessons"];
    [lessonQuery whereKey:@"createdBy" equalTo:[PFUser currentUser]];
    
   
   
    [lessonQuery countObjectsInBackgroundWithBlock:^(int count, NSError *error) {
        if (!error) {
            // The count request succeeded. Log the count
            NSLog(@"Junkballer has generated %d lessons for you!", count);
            self.lessonNumber.text = [NSString stringWithFormat:@"%d",count];
        } else {
            // The request failed
        }
    }];
    
    PFQuery *playerQuery = [PFQuery queryWithClassName:@"Junkballers"];
    [playerQuery whereKey:@"createdBy" equalTo:[PFUser currentUser]];
    
    
    [playerQuery countObjectsInBackgroundWithBlock:^(int count, NSError *error) {
        if (!error) {
            // The count request succeeded. Log the count
            NSLog(@"You have %d players!", count);
            self.totalPlayers.text = [NSString stringWithFormat:@"%d",count];
        } else {
            // The request failed
        }
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
