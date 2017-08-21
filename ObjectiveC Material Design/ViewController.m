//
//  ViewController.m
//  ObjectiveC Material Design
//
//  Created by Gideon Bamuleseyo on 8/18/17.
//  Copyright © 2017 lytestech. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"


@import Material;

@interface ViewController (){
    CLLocationManager * locationManager;
    CLLocationCoordinate2D *userLocation;
    CLPlacemark *placeMark;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    locationManager = [[CLLocationManager alloc] init];
    [self initialiseLocationManager];
    
    TextField *area = [self.view viewWithTag:1];
    area.dividerColor = [self colorWithHexString:@"#F68D29"];
    area.dividerActiveColor = [self colorWithHexString:@"#F68D29"];
    area.dividerNormalColor = [self colorWithHexString:@"#F68D29"];
    
//    city.dividerColor = [Utils colorFromHexString:@"#F68D29"];
//    city.dividerActiveColor = [Utils colorFromHexString:@"#F68D29"];
//    city.dividerNormalColor = [Utils colorFromHexString:@"#F68D29"];
 
    TextField *supermarkets = [self.view viewWithTag:2];
//    area.dividerColor = [Utils colorFromHexString:@"#F68D29"];
//    area.dividerActiveColor = [Utils colorFromHexString:@"#F68D29"];
//    area.dividerNormalColor = [Utils colorFromHexString:@"#F68D29"];
    
    NSMutableArray *mSupermarkets = [self getSuperMarkets];
    // bind yourTextField to DownPicker
    self.downPicker = [[DownPicker alloc] initWithTextField:supermarkets withData:mSupermarkets];
    
}

- (void)initialiseLocationManager{
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        NSLog(@"I reach here");
        [locationManager requestWhenInUseAuthorization];
    }
    [locationManager startUpdatingLocation];
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *location = [locations lastObject];
    
    // userLocation = CLLocationCoordinate2D(location.coordinate.latitude, location.coordinate.longitude);
    
     NSString *userLat,*userLong;
    
    userLat = [NSString stringWithFormat:@"%.8f",location.coordinate.latitude];
    userLong= [NSString stringWithFormat:@"%.8f",location.coordinate.longitude];
    
    NSLog(@"%@, %@", userLat, userLong);
}
- (void) viewDidAppear:(BOOL)animated{
    // [self customeProgressHud];
    // [SVProgressHUD show];
    
    
    
}


-(NSMutableArray*)getSuperMarkets {
    // create the array of data
    NSMutableArray* supermarketArray = [[NSMutableArray alloc] init];
    
    // add some sample data
    [supermarketArray addObject:@"Kenjoy"];
    [supermarketArray addObject:@"Tuskys"];
    [supermarketArray addObject:@"CapitalShoppers"];
    [supermarketArray addObject:@"Maskers"];
    [supermarketArray addObject:@"Qwicart"];
    
    return supermarketArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

- (IBAction)btnContinueAction:(id)sender {
    
}

- (void) customeProgressHud{
//    SVProgressHUD.setDefaultStyle(.custom)
//    SVProgressHUD.setDefaultMaskType(.custom)
//    SVProgressHUD.setMinimumSize(CGSize(width: 60, height: 60))
//    SVProgressHUD.setRingThickness(2.7)
//    SVProgressHUD.setRingNoTextRadius(20)
//    SVProgressHUD.setBackgroundLayerColor(UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.05))
//    SVProgressHUD.setBackgroundColor(UIColor.white)
//    SVProgressHUD.setForegroundColor(UIColor.init(colorLiteralRed: 1.0/255.0, green: 235.0/255.0, blue: 165.0/255.0, alpha: 1.0))
    
    
     [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
     [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
     [SVProgressHUD setForegroundColor:[UIColor colorWithRed:1/255.0 green:235/255.0 blue:165/255.0 alpha:1.0]];
     [SVProgressHUD setBackgroundColor:[UIColor whiteColor]];
}


@end




























