//
//  AppDelegate.h
//  ObjectiveC Material Design
//
//  Created by Gideon Bamuleseyo on 8/18/17.
//  Copyright © 2017 lytestech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

