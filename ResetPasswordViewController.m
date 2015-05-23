//
//  ResetPasswordViewController.m
//  Junkballer_app02
//
//  Created by ChipRBeasley on 4/23/15.
//  Copyright (c) 2015 TennisIQ. All rights reserved.
//

#import "ResetPasswordViewController.h"
#import "Parse/Parse.h"

@interface ResetPasswordViewController ()

@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = NO;
    
    
   
    
    
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

- (IBAction)resetPassword:(id)sender {

    
     [PFUser requestPasswordResetForEmailInBackground:self.emailField.text];
}
@end
