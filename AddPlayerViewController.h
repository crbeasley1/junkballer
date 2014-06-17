//
//  AddPlayerViewController.h
//  Junkballer_app02
//
//  Created by CR Beasley on 6/5/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPlayerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *playernameField;

@property (weak, nonatomic) IBOutlet UITextField *phoneField;


- (IBAction)backButton:(id)sender;
 
- (IBAction)addPlayer:(id)sender;

@end
