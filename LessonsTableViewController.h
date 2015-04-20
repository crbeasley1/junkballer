//
//  LessonsTableViewController.h
//  Junkballer_app02
//
//  Created by ChipRBeasley on 3/19/15.
//  Copyright (c) 2015 TennisIQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface LessonsTableViewController : PFQueryTableViewController

@property (nonatomic, strong) PFUser *currentUser;
@property (nonatomic, strong)NSMutableArray *Lessons;
@property (strong,nonatomic)NSString *player;
@property (strong,nonatomic)NSDate *lessonDate;
@property(strong, nonatomic)PFObject *junkerballers;
@property(strong,nonatomic)NSMutableData *count;
@property(strong,nonatomic)PFObject *query;
@property(strong,nonatomic)NSDate* myDate;
@property(strong,nonatomic)NSString *keyToDisplay;
@property(strong,nonatomic)PFObject *createdAt;
@property(strong,nonatomic)PFObject *lessonTakenDate;



@property (weak, nonatomic) IBOutlet UIBarButtonItem *lessonNumber;

@end
