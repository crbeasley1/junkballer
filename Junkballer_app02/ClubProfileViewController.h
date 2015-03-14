//
//  ClubProfileViewController.h
//  Junkballer_app02
//
//  Created by CR Beasley on 1/8/15.
//  Copyright (c) 2015 TennisIQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ClubProfileViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *paymentHistory;

@property (strong, nonatomic) IBOutlet UIView *myCards;

@property (strong, nonatomic) IBOutlet UIView *support;
@property (strong, nonatomic) IBOutlet UILabel *clubName;
@property (strong, nonatomic) PFUser *currentUser;

@property (strong, nonatomic) IBOutlet UILabel *lessonNumber;

@end

