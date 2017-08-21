//
//  DownPickerViewController.h
//  ObjectiveC Material Design
//
//  Created by Gideon Bamuleseyo on 8/19/17.
//  Copyright © 2017 lytestech. All rights reserved.
//

#import <UIKit/UIKit.h>
@import DownPicker;

@interface DownPickerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UIDownPicker *downPicker;
@property (weak, nonatomic) IBOutlet UIDownPicker *downPicker2;

@property (nonatomic) DownPicker *picker;
@property (nonatomic) DownPicker *picker2;

@end
