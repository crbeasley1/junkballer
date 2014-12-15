//
//  JunkballerModel.m
//  Junkballer_app02
//
//  Created by Ryan Maciel on 6/30/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import "JunkballerModel.h"
#import <Parse/Parse.h>
@interface JunkballerModel()


-(void)queryParse;

@end
@implementation JunkballerModel
@synthesize allPlayers = _allPlayers;

+ (id)sharedManager {
    static JunkballerModel *sharedModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedModel = [[self alloc] init];
    });
    return sharedModel;
}

-(id)init{
    self = [super init];
    if(self){
        [self queryParse];
    }
    return self;
}

-(void)queryParse{
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
        NSLog(@"Current user: %@", currentUser.username);
        PFQuery *junkballerQuery = [PFQuery queryWithClassName:@"Junkballers"];
        
        // Follow relationship
        [junkballerQuery whereKey:@"createdBy" equalTo:[PFUser currentUser]];
        self.allPlayers = [junkballerQuery findObjects];
    }

}

-(void)savePlayersToParse{
    for(PFObject *playerObject in self.allPlayers){
        [playerObject saveInBackground];
    }
}
-(void)savePlayer:(PFObject*)player{
    if(player){
        [player saveInBackground];
    }
}

@end
