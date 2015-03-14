//
//  ScannerViewController.h
//  Junkballer_app02
//
//  Created by ChipRBeasley on 3/9/15.
//  Copyright (c) 2015 TennisIQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol QRReaderDelegate <NSObject>

-(void)QRReaderReturnedString:(NSString*)QRResult;

@end

@interface ScannerViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>

@property (strong, nonatomic) IBOutlet UIView *viewPreview;
@property (strong, nonatomic) IBOutlet UILabel *lblStatus;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *bbitemStart;
@property (weak, nonatomic) id <QRReaderDelegate> readerDelegate;

- (IBAction)startStopReading:(id)sender;


@end
