//
//  ResetPasswordViewController.h
//  Junkballer_app02
//
//  Created by ChipRBeasley on 4/23/15.
//  Copyright (c) 2015 TennisIQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResetPasswordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailField;
- (IBAction)resetPassword:(id)sender;

@end
