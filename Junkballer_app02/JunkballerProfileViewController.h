//
//  JunkballerProfileViewController.h
//  Junkballer_app02
//
//  Created by Ryan Maciel on 6/30/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "JunkballerModel.h"
#import <Foundation/Foundation.h> 
#import <KiipSDK/KiipSDK.h>

@interface JunkballerProfileViewController : UIViewController

@property(strong, nonatomic)PFObject *junkerballer;
@property(strong, nonatomic)PFObject *playerObject;
@property(strong, nonatomic)NSObject *JunkballerModel;
@property(strong, nonatomic)NSArray *allPlayers;
@property (strong, nonatomic)JunkballerModel *model;
@property(strong, nonatomic)NSDate *currentDate;
@property(strong, nonatomic)NSDate *checkInDate;
@property(strong,nonatomic)NSDate *updatedAt;
@property(nonatomic, readonly) NSUInteger tapCount;
@property(strong,nonatomic)UIButton *myButton;


- (IBAction)checkIn:(id)sender;

@end


