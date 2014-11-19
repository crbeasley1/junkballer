//
//  BonusPointsViewController.h
//  Junkballer_app02
//
//  Created by CR Beasley on 6/20/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface BonusPointsViewController : UIViewController

-(IBAction)addPointsWithSender:(UIView*)sender;

@property(strong, nonatomic)PFObject *junkerballer;


@end
