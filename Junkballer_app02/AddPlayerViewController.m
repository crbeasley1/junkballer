//
//  AddPlayerViewController.m
//  Junkballer_app02
//
//  Created by CR Beasley on 6/5/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import "AddPlayerViewController.h"
#import <Parse/Parse.h>
#import "ViewController.h"

@interface AddPlayerViewController () <QRReaderDelegate>
@property(strong, nonatomic)PFObject *junkballers;
@end

@implementation AddPlayerViewController
@synthesize junkballers = _junkballers;

-(void)QRReaderReturnedString:(NSString *)QRResult{
    //handle QR result
    self.junkballers[@"QRCode"] = QRResult;
}

- (void)viewDidLoad
{
    self.Junkballers = [PFObject objectWithClassName:@"Junkballers"];
    
    [super viewDidLoad];
    
}


// Do any additional setup after loading the view.



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)playeremailField:(id)sender {
}

- (IBAction)backButton:(id)sender {
    [self performSegueWithIdentifier:@"backButton" sender:self];
    
}

- (IBAction)addPlayer:(id)sender {
    NSString *playerName = [self.playernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *playerEmail = [self.playeremailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    if ([playerName length] == 0 || [playerEmail length] == 0 || self.junkballers[@"QRCode"] != nil) {
        //Change to include QR code warning.
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Jeesh, make sure you enter a name and an email!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        
        
    }
    else {
        
        self.junkballers[@"name"] = playerName;
        self.junkballers[@"email"] = playerEmail;
        self.junkballers[@"points"]= [[NSNumber alloc] initWithInt:5];
        [self.junkballers setObject:[PFUser currentUser] forKey:@"createdBy"];
        [self.junkballers saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                // Dismiss the NewPostViewController and show the BlogTableViewController
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Player Added!" message: [error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
                }
            else {
                
            }
            
        }];
        [self.view endEditing:YES];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        
        
        
    }
    
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"ScanNewPlayer"]){
        ViewController *qRReader = segue.destinationViewController;
        qRReader.readerDelegate = self;
    }
}

@end
