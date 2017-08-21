//
//  DownPickerViewController.m
//  ObjectiveC Material Design
//
//  Created by Gideon Bamuleseyo on 8/19/17.
//  Copyright © 2017 lytestech. All rights reserved.
//

#import "DownPickerViewController.h"

@implementation DownPickerViewController

-(void) viewDidLoad{
        [super viewDidLoad];
    NSArray *el = @[@"R.E.M.", @"Dire Straits", @"Police", @"Sex Pistols", @"Pink Floyd"];
    self.picker = [[DownPicker alloc] initWithTextField:self.textField withData:el];
    
    NSArray *el2 = @[@"Prodigy", @"Arctic Monkeys", @"System of a Down", @"Limp Bizkit", @"Linkin Park"];
    self.picker2 = [[DownPicker alloc] initWithTextField:self.textField2 withData:el2];
    
    NSArray *el3 = @[@"Iron Maiden", @"Metallica", @"AC/DC", @"Diamondhead", @"Helloween"];
    
    (void)[self.downPicker initWithData:el3];
    
    NSArray *el4 = @[@"Dream Theater", @"Stratovarius", @"Tool", @"A Perfect Circle", @"Shadow Gallery"];
    (void)[self.downPicker2 initWithData:el4];

}


@end
