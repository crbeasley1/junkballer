//
//  JunkballerModel.h
//  Junkballer_app02
//
//  Created by Ryan Maciel on 6/30/14.
//  Copyright (c) 2014 TennisIQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
@interface JunkballerModel : NSObject
+ (id)sharedManager;
@property(strong, nonatomic)NSArray *allPlayers;

-(void)savePlayersToParse;

-(void)savePlayer:(PFObject*)player;
@end
