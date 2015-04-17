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

- (IBAction)buttonPressed:(id)sender;

@property(strong, nonatomic)PFObject *junkerballer;
@property(strong, nonatomic)PFObject *lessonNumber;

@property (nonatomic, assign) int count;



@end
