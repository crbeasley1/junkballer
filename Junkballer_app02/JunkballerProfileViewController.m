//
//  JunkballerProfileViewController.m
//  Junkballer_app02
//
//  Created by Ryan Maciel on 6/30/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import "JunkballerProfileViewController.h"
#import "BonusPointsViewController.h"
#import "JunkballerRedeemPointsTableViewController.h"

@interface JunkballerProfileViewController ()
@property(strong, nonatomic)IBOutlet UILabel *nameLabel;
@property(strong, nonatomic)IBOutlet UILabel *pointsLabel;
@end

@implementation JunkballerProfileViewController
@synthesize junkerballer = _junkerballer;
@synthesize nameLabel = _nameLabel;
@synthesize pointsLabel = _pointsLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(self.junkerballer){
        self.nameLabel.text = self.junkerballer[@"name"];
        self.pointsLabel.text = [self.junkerballer[@"points"] stringValue];
    }
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.pointsLabel.text = [self.junkerballer[@"points"] stringValue];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"BonusPoints"]){
        BonusPointsViewController *bonusPoints = segue.destinationViewController;
        bonusPoints.junkerballer = self.junkerballer;
    }
    if([segue.identifier isEqualToString:@"RedeemPoints"]){
        JunkballerRedeemPointsTableViewController *redeemPointsController = segue.destinationViewController;
        redeemPointsController.junkballer = self.junkerballer;
        
    }
    
}


@end
