//
//  AppDelegate.h
//  Root
//
//  Created by BRIJESH KUMAR on 07/10/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
//#import <CoreData/CoreData.h>
#import <GoogleSignIn/GoogleSignIn.h>
#import <UserNotifications/UserNotifications.h>
#import "FirstViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate, UNUserNotificationCenterDelegate>

//@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic) NSDictionary *notificationDictionary;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;
@property(strong,nonatomic) FirstViewController *frontViewController;


@end




