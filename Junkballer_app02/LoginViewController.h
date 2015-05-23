//
//  LoginViewController.h
//  Junkballer_app02
//
//  Created by CR Beasley on 6/4/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)login:(id)sender;
- (IBAction)forgot:(id)sender;

@end
