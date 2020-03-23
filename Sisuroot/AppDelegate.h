
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <GoogleSignIn/GoogleSignIn.h>
#import <UserNotifications/UserNotifications.h>
#import "FirstViewController.h"

#import <GoogleAnalytics/GAI.h>
#import <GoogleAnalytics/GAIDictionaryBuilder.h>
@import Firebase;



@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate, UNUserNotificationCenterDelegate>

//@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic) NSDictionary *notificationDictionary;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;
@property(strong,nonatomic) FirstViewController *frontViewController;


@end




