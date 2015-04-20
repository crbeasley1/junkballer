//
//  LessonsTableViewController.m
//  Junkballer_app02
//
//  Created by ChipRBeasley on 3/19/15.
//  Copyright (c) 2015 TennisIQ. All rights reserved.
//

#import "LessonsTableViewController.h"
#import "BonusPointsViewController.h"

@interface LessonsTableViewController ()

@end

@implementation LessonsTableViewController
@synthesize player = _player;
@synthesize createdAt = _createdAt;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithClassName:@"Lessons"];
    self = [super initWithCoder:aDecoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"Lessons";
        
        // The key of the PFObject to display in the label of the default cell style
        self.keyToDisplay = @"Player";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = NO;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = NO;
        
        // The number of objects to show per page
        self.objectsPerPage = self.Lessons.count;
    }
    return self;
}

- (PFQuery *)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:@"Lessons"];
    [query includeKey:@"Player"];
    [query includeKey:@"name"];
    [query includeKey:@"updatedAt"];
    // If no objects are loaded in memory, we look to the cache first to fill the table
    // and then subsequently do a query against the network.
    if (self.objects.count == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    
    
    [query orderByDescending:@"createdAt"];
    
    return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
                        object:(PFObject *)object
{
    static NSString *cellIdentifier = @"Lessoncell";
    
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
    }
    
    NSDate *currentDate = [NSDate date];
    self.junkerballers[@"checkInDate"] = currentDate;
    PFObject *player = object[@"Player"];
//    NSDate *myDate = player.updatedAt;
//    
//    NSLog(@"%@", myDate);
    NSLog(@"%@", player);
    
    [player fetchIfNeededInBackgroundWithBlock:^(PFObject *player, NSError *error) {
        
        
        cell.textLabel.text = player[@"name"];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM.dd.yyyy"];
        NSString *dateString = [dateFormatter stringFromDate:currentDate];
        NSLog(@"%@", dateString);

        cell.detailTextLabel.text = dateString;
    }];
    
    // Configure the cell to show todo item with a priority at the bottom
    /*cell.textLabel.text = [NSString stringWithFormat:@"%@",
                           object[@"Player"]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Date: %@",
                                 object[@"createdAt"]];
     */
    
    return cell;
}

@end