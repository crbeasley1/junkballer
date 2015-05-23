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
#import "JunkballerModel.h"

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
    self.junkballers = [PFObject objectWithClassName:@"Junkballers"];
    self.playernameField.delegate = self;
    self.playerPhoneField.delegate = self;
    
    
    [super viewDidLoad];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
    
}


// Do any additional setup after loading the view.



- (IBAction)playeremailField:(id)sender {
}

- (IBAction)backButton:(id)sender {
    [self performSegueWithIdentifier:@"backButton" sender:self];
    
    
}

- (IBAction)addPlayer:(id)sender {
    NSString *playerName = [self.playernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *playerPhoneField = [self.playerPhoneField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    if ([playerName length] == 0 || [playerPhoneField length] == 0) {
        //Change to include QR code warning.
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Jeesh, make sure you enter a name and a phone number Were you born in a barn?" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        
        
    }
    else {
        
        self.junkballers[@"name"] = playerName;
        self.junkballers[@"phone"] = playerPhoneField;
        self.junkballers[@"points"]= [[NSNumber alloc] initWithInt:5];
        [self.junkballers setObject:[PFUser currentUser] forKey:@"createdBy"];
        [self.junkballers saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                // Dismiss the NewPostViewController and show the BlogTableViewController
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Player Added!" message: [error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
                
                JunkballerModel *model = ((JunkballerModel*)[JunkballerModel sharedManager]);
                NSMutableArray *allPlayers = [model.allPlayers mutableCopy];
                [allPlayers addObject:self.junkballers];
                model.allPlayers = allPlayers;
                [self performSegueWithIdentifier:@"backButton" sender:self];
                
                
                }
            
        }];
        
        
        
        
        
    }
    
    
}
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if([segue.identifier isEqualToString:@"ScanNewPlayer"]){
//        ViewController *qRReader = segue.destinationViewController;
//        qRReader.readerDelegate = self;
//    }


@end
