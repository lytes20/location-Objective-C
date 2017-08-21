//
//  ViewController.h
//  ObjectiveC Material Design
//
//  Created by Gideon Bamuleseyo on 8/18/17.
//  Copyright © 2017 lytestech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownPicker.h"
#import <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController <CLLocationManagerDelegate>
@property (strong, nonatomic) DownPicker *downPicker;


@end

