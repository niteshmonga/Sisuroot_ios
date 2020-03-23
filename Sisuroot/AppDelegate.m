
#import "AppDelegate.h"
#import "FirstViewController.h"
#import "LeftViewController.h"
#import "SWRevealViewController.h"
#include <CoreFoundation/CoreFoundation.h>
#import <GoogleSignIn/GoogleSignIn.h>
#import "AFHTTPRequestOperationManager.h"
#import <NotificationCenter/NotificationCenter.h>
#import <UserNotificationsUI/UserNotificationsUI.h>
#import <UserNotifications/UserNotifications.h>
#import "MyWebserviceManager.h"
#import "ChatfriendViewController.h"
#import "ResponseViewController.h"
#import "FeedViewController.h"
#import "Reachability.h"
#import "LoginViewController.h"
#import "touchandfaceViewController.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"
#import "GAILogger.h"
#import "TIMERUIApplication.h"
@import Firebase;
#import <GoogleAnalytics/GAI.h>
#import <GoogleAnalytics/GAIDictionaryBuilder.h>
#import "Flurry.h"
#import "smilepage1ViewController.h"
#import "sleedmoodexerViewController.h"
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
@interface AppDelegate ()
{
    NSString *str;
    NSString *latstr;
    NSString *longstr;
    NSString *aps1;
    NSString *aps2;
    NSString *aps3;
}
@end

@implementation AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    FIRDynamicLink *dynamicLink = [[FIRDynamicLinks dynamicLinks] dynamicLinkFromCustomSchemeURL:url];
    if (dynamicLink) {
      if (dynamicLink.url) {
        // Handle the deep link. For example, show the deep-linked content,
        // apply a promotional offer to the user's account or show customized onboarding view.
        // ...
      } else {
        // Dynamic link has empty deep link. This situation will happens if
        // Firebase Dynamic Links iOS SDK tried to retrieve pending dynamic link,
        // but pending link is not available for this device/App combination.
        // At this point you may display default onboarding view.
      }
      return YES;
    }
    
    return [[GIDSignIn sharedInstance] handleURL:url
                               sourceApplication:sourceApplication
            annotation:annotation];
    return YES;
}


- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    str = [NSString stringWithFormat:@"Device Token=%@",deviceToken];
    str = [str stringByReplacingOccurrencesOfString:@"<" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@">" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    [[NSUserDefaults standardUserDefaults] setValue:str forKey:@"udid"];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
  willPresentNotification:(UNNotification *)notification
    withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
    NSLog( @"Handle push from foreground" );
    // custom code to handle push while app is in the foreground
    NSLog(@"%@", notification.request.content.userInfo);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
  didReceiveNotificationResponse:(UNNotificationResponse *)response
  withCompletionHandler:(void (^)(void))completionHandler
{
    NSLog( @"Handle push from background or closed" );
    // if you set a member variable in didReceiveRemoteNotification, you  will know if this is from closed or background
    NSLog(@"%@", response);
}


-(BOOL) needsUpdate{
    NSDictionary* infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString* appID = infoDictionary[@"CFBundleIdentifier"];
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/lookup?bundleId=%@", appID]];
    NSData* data = [NSData dataWithContentsOfURL:url];
    NSDictionary* lookup = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    if ([lookup[@"resultCount"] integerValue] == 1){
        NSString* appStoreVersion = lookup[@"results"][0][@"version"];
        NSString* currentVersion = infoDictionary[@"CFBundleShortVersionString"];
        if (![appStoreVersion isEqualToString:currentVersion]){
            NSLog(@"Need to update [%@ != %@]", appStoreVersion, currentVersion);
         
            NSString *ggg=[NSString stringWithFormat:@"%@%@%@",@"A new version of Sisuroot is available.Please update to version ",appStoreVersion,@" now" ];
            UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUROOT" message:ggg delegate:self cancelButtonTitle:@"Next Time" otherButtonTitles:nil];
            [alertcrp addButtonWithTitle:@"Update"];
            alertcrp.tag=12;
            [alertcrp show];
            
            return YES;
        }
    }
    return NO;
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        NSLog(@"You have clicked Cancel");
        if(alertView.tag==12)
        {
        }
        else
        {
            
        }
    }
    else
    {
        if(alertView.tag==12)
        {
            NSURL *phoneUrl = [NSURL URLWithString:@"https://apps.apple.com/us/app/sisuroot/id1459535994"];
            if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
                            [[UIApplication sharedApplication] openURL:phoneUrl];
            }
            else
            {
                [[UIApplication sharedApplication] openURL:phoneUrl];
            }
        }
        else
        {
            
        }
    }
}
- (BOOL)application:(UIApplication *)application
continueUserActivity:(nonnull NSUserActivity *)userActivity
 restorationHandler:
#if defined(__IPHONE_12_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_12_0)
(nonnull void (^)(NSArray<id<UIUserActivityRestoring>> *_Nullable))restorationHandler {
#else
    (nonnull void (^)(NSArray *_Nullable))restorationHandler {
#endif  // __IPHONE_12_0
  BOOL handled = [[FIRDynamicLinks dynamicLinks] handleUniversalLink:userActivity.webpageURL
                                                          completion:^(FIRDynamicLink * _Nullable dynamicLink,
                                                                       NSError * _Nullable error) {
                                                            // ...
                                                          }];
  return handled;
}

//- (BOOL)application:(UIApplication *)app
//                openURL:(NSURL *)url
//                options:(NSDictionary<NSString *, id> *)options {
//      return [self application:app
//                       openURL:url
//             sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
//                    annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
//}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary *)options {
        return [[GIDSignIn sharedInstance] handleURL:url
                sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
}
    
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidTimeout:) name:kApplicationDidTimeoutNotification object:nil];
    [Flurry startSession:@"3M4MRJRCWZD53SFFBYJ3"
      withSessionBuilder:[[[FlurrySessionBuilder new]
                           withCrashReporting:YES]
                          withLogLevel:FlurryLogLevelDebug]];
    [self needsUpdate];
    [FIRApp configure];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
     NSError* configureError;
    NSAssert(!configureError, @"Error configuring Google services: %@", configureError);
    [GIDSignIn sharedInstance].clientID = @"1041594852089-su8rgqnhe2edbbo3quggtir3hedp39b4.apps.googleusercontent.com";
    if( SYSTEM_VERSION_LESS_THAN( @"10.0" ) )
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
       if (@available(iOS 10.0, *)) {
            UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
            center.delegate = self;
            [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error)
            {
                if( !error )
                 {
                     [[UIApplication sharedApplication] registerForRemoteNotifications];
                     
                     // required to get the app to do anything at all about push notifications
                 }
                 else
                 {
                 }
            }];
            
        } else {
            
            // Fallback on earlier versions
            }
    }
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    NSDictionary *notification = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (notification) {
        NSLog(@"app recieved notification from remote%@",notification);
        [self application:application didReceiveRemoteNotification:notification];
    } else {
        NSLog(@"app did not recieve notification");
        
    }
    NSString *str = [[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
    NSString *str1 = [[NSUserDefaults standardUserDefaults] valueForKey:@"email_verified_status"];
    if(str==nil && str1==nil)
    {
        //FirstViewController *frontViewController=[[FirstViewController alloc]init];
         LoginViewController *frontViewController=[[LoginViewController alloc]init];
        LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
        UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
        UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
        SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
        revealController.delegate = self;
        revealController.rearViewRevealOverdraw = 120;
        revealController.bounceBackOnOverdraw = NO;
        revealController.stableDragOnOverdraw = YES;
      //  revealController.rearViewRevealWidth = 250;
        revealController.rearViewRevealWidth = ([UIScreen mainScreen].bounds.size.width)-52;
        revealController.rearViewRevealDisplacement = 0;
        [revealController setFrontViewPosition:FrontViewPositionLeft animated:NO ];
        revealController.bounceBackOnOverdraw=NO;
        revealController.stableDragOnOverdraw=YES;
        self.window.rootViewController = revealController;
    }
    
    else if([str isEqualToString:@"0"] && [str1 isEqualToString:@"0"])
    {
         LoginViewController *frontViewController=[[LoginViewController alloc]init];
       // FirstViewController *frontViewController=[[FirstViewController alloc]init];
        LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
        UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
        UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
        SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
        
        revealController.delegate = self;
        revealController.rearViewRevealOverdraw = 120;
        revealController.bounceBackOnOverdraw = NO;
        revealController.stableDragOnOverdraw = YES;
        revealController.rearViewRevealWidth = ([UIScreen mainScreen].bounds.size.width)-52;
               
        revealController.rearViewRevealDisplacement = 0;
        [revealController setFrontViewPosition:FrontViewPositionLeft animated:NO ];
       revealController.bounceBackOnOverdraw=NO;
        revealController.stableDragOnOverdraw=YES;
        self.window.rootViewController = revealController;
    }
    
    else if([str isEqualToString:@"0"])
   {
        LoginViewController *frontViewController=[[LoginViewController alloc]init];
        //FirstViewController *frontViewController=[[FirstViewController alloc]init];
        // [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
        LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
        UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
        UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
        SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
        
        revealController.delegate = self;
        revealController.rearViewRevealOverdraw = 120;
        revealController.bounceBackOnOverdraw = NO;
        revealController.stableDragOnOverdraw = YES;
         revealController.rearViewRevealWidth = ([UIScreen mainScreen].bounds.size.width)-52;
               
        revealController.rearViewRevealDisplacement = 0;
        [revealController setFrontViewPosition:FrontViewPositionLeft animated:NO ];
        revealController.bounceBackOnOverdraw=NO;
        revealController.stableDragOnOverdraw=YES;
        self.window.rootViewController = revealController;
     }
    
    else
    {
        if(![str isEqualToString:@"0"] && str1==nil)
        {
            LoginViewController *frontViewController=[[LoginViewController alloc]init];
        //  [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
            LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
            UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
           UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
            SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
            
            revealController.delegate = self;
            // [frontViewController setStr2:@"feed"];
            revealController.rearViewRevealOverdraw = 120;
            revealController.bounceBackOnOverdraw = NO;
            revealController.stableDragOnOverdraw = YES;
            revealController.rearViewRevealWidth = ([UIScreen mainScreen].bounds.size.width)-52;
            revealController.rearViewRevealDisplacement = 0;
            [revealController setFrontViewPosition:FrontViewPositionLeftSide animated:NO ];
            revealController.bounceBackOnOverdraw=NO;
            revealController.stableDragOnOverdraw=YES;
            
            self.window.rootViewController = revealController;
            
        }
        else if(![str isEqualToString:@"0"] && ![str1 isEqualToString:@"0"])
        {
               touchandfaceViewController *frontViewController=[[touchandfaceViewController alloc]init];
                //  [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
                LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
                UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
               
                UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
               SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
                
                revealController.delegate = self;
                // [frontViewController setStr2:@"feed"];
                revealController.rearViewRevealOverdraw = 120;
                revealController.bounceBackOnOverdraw = NO;
                revealController.stableDragOnOverdraw = YES;
                 revealController.rearViewRevealWidth = ([UIScreen mainScreen].bounds.size.width)-52;
                       
                revealController.rearViewRevealDisplacement = 0;
                [revealController setFrontViewPosition:FrontViewPositionLeftSide animated:NO ];
                revealController.bounceBackOnOverdraw=NO;
                revealController.stableDragOnOverdraw=YES;
                self.window.rootViewController = revealController;
        }
       else
       {
            LoginViewController *frontViewController=[[LoginViewController alloc]init];
            //  [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
            
            LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
            UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
           
            UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
           
            SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
            
            revealController.delegate = self;
            // [frontViewController setStr2:@"feed"];
            revealController.rearViewRevealOverdraw = 120;
            revealController.bounceBackOnOverdraw = NO;
            revealController.stableDragOnOverdraw = YES;
            revealController.rearViewRevealWidth = ([UIScreen mainScreen].bounds.size.width)-52;
                   
            revealController.rearViewRevealDisplacement = 0;
            [revealController setFrontViewPosition:FrontViewPositionLeftSide animated:NO ];
            revealController.bounceBackOnOverdraw=NO;
            revealController.stableDragOnOverdraw=YES;
            self.window.rootViewController = revealController;
        }
    }
    
    [self.window makeKeyAndVisible];
   
   return YES;
}


-(void)applicationDidTimeout:(NSNotification *) notif
{
   NSLog (@"time exceeded!!");
    UIViewController *controller = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:NULL] instantiateViewControllerWithIdentifier:@"mainView"];
     //I've tried a few varieties of the if statement to no avail. Always goes to else.
   if ([controller isViewLoaded]) {
        NSLog(@"Already there!");
    }
    else {
        NSLog(@"go home");
        [(UINavigationController *)self.window.rootViewController pushViewController:controller animated:YES];
        [(TIMERUIApplication *)[UIApplication sharedApplication] resetIdleTimer];
    }
}



- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier

forRemoteNotification:(NSDictionary *)notification completionHandler:(void(^)())completionHandler

{
    
    NSLog(@"Received push notification: %@, identifier: %@", notification, identifier); // iOS 8 s
    
    completionHandler();
    
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    // Respond to any push notification registration errors here.
    NSLog(@"Failed to get token, error: %@", error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
   [[NSNotificationCenter defaultCenter] postNotificationName:@"pushNotification" object:nil userInfo:userInfo];
    _notificationDictionary = userInfo;
    application.applicationIconBadgeNumber = [[[userInfo valueForKey:@"aps"] valueForKey:@"badge"] integerValue];
    if ( application.applicationState == UIApplicationStateInactive || application.applicationState == UIApplicationStateBackground )
    {
        if ([[[userInfo valueForKey:@"aps"]  valueForKey:@"status"] isEqualToString:@"chat"])
       {
            aps1=@"chat1";
            ChatfriendViewController *frontViewController=[[ChatfriendViewController alloc]init];
            frontViewController.chat_noti=@"chat_noti";
            // [self.navigationController pushViewController:SVC animated:YES];
            // [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
            LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
            UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
            UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
            SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
            revealController.delegate = self;
            revealController.rearViewRevealOverdraw = 120;
            revealController.bounceBackOnOverdraw = NO;
            revealController.stableDragOnOverdraw = YES;
             revealController.rearViewRevealWidth = ([UIScreen mainScreen].bounds.size.width)-52;
                   
            revealController.rearViewRevealDisplacement = 0;
            [revealController setFrontViewPosition:FrontViewPositionLeft animated:NO ];
            revealController.bounceBackOnOverdraw=NO;
            revealController.stableDragOnOverdraw=YES;
            self.window.rootViewController = revealController;
        }
        
        else if ([[[userInfo valueForKey:@"aps"] valueForKey:@"status"] isEqualToString:@"sisuchat"])
        {
            aps1=@"sisuchat1";
            ChatfriendViewController *frontViewController=[[ChatfriendViewController alloc]init];
            frontViewController.sisuchat_noti=@"sisuchat_noti";
            // [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
            LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
            UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
            UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
            SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
            revealController.delegate = self;
            revealController.rearViewRevealOverdraw = 120;
            revealController.bounceBackOnOverdraw = NO;
            revealController.stableDragOnOverdraw = YES;
             revealController.rearViewRevealWidth = ([UIScreen mainScreen].bounds.size.width)-52;
                   
            revealController.rearViewRevealDisplacement = 0;
            [revealController setFrontViewPosition:FrontViewPositionLeft animated:NO ];
            revealController.bounceBackOnOverdraw=NO;
            revealController.stableDragOnOverdraw=YES;
            self.window.rootViewController = revealController;
        }
        else
        {
                   touchandfaceViewController *frontViewController=[[touchandfaceViewController alloc]init];
                    //  [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
                    LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
                    UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
                   
                    UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
                   
                    SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
                    
                    revealController.delegate = self;
                    // [frontViewController setStr2:@"feed"];
                    revealController.rearViewRevealOverdraw = 120;
                    revealController.bounceBackOnOverdraw = NO;
                    revealController.stableDragOnOverdraw = YES;
                     revealController.rearViewRevealWidth = ([UIScreen mainScreen].bounds.size.width)-52;
                           
                    revealController.rearViewRevealDisplacement = 0;
                    [revealController setFrontViewPosition:FrontViewPositionLeftSide animated:NO ];
                    revealController.bounceBackOnOverdraw=NO;
                    revealController.stableDragOnOverdraw=YES;
                    self.window.rootViewController = revealController;
        }
        NSLog(@"i received a notification...");
        NSLog(@"Message: %@",[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]);
        NSLog(@"whole data: %@",userInfo);
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
   // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    // [[NSUserDefaults standardUserDefaults] setValue:@" " forKey:@"id"];
}

- (void)willEnterForeground:(UIApplication *)application
{
    //[locationManager stopMonitoringSignificantLocationChanges];
    //[locationManager startUpdatingLocation];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
     //home button press programmatically
    NSLog(@"Went to Background");
    // Need to stop regular updates first
    // Only monitor significant changes
   // [locationManager startMonitoringSignificantLocationChanges];
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"remember_status"] isEqual:@"1"])
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound |    UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
   else
    {
        // [[NSUserDefaults standardUserDefaults] setValue:@" " forKey:@"id"];
    }
   // [locationManager startUpdatingLocation];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
   NSString *str = [[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
   NSString *str1 = [[NSUserDefaults standardUserDefaults] valueForKey:@"email_verified_status"];
   if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"remember_status"] isEqual:@"1" ])
    {
        if(str.length >0 && str1.length >0)
        {
        }
        else
        {
            [[NSUserDefaults standardUserDefaults] setValue:@" " forKey:@"id"];
            LoginViewController *frontViewController=[[LoginViewController alloc]init];
           // [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
            LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
            UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
            UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
            SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
            revealController.delegate = self;
            revealController.rearViewRevealOverdraw = 120;
            revealController.bounceBackOnOverdraw = NO;
            revealController.stableDragOnOverdraw = YES;
            revealController.rearViewRevealWidth = ([UIScreen mainScreen].bounds.size.width)-52;
            revealController.rearViewRevealDisplacement = 0;
            [revealController setFrontViewPosition:FrontViewPositionLeft animated:NO];
            revealController.bounceBackOnOverdraw=NO;
            revealController.stableDragOnOverdraw=YES;
            self.window.rootViewController = revealController;
       }
        
    }
    //    NSTimer *timerr = [NSTimer timerWithTimeInterval:36000.0 target:self selector:@selector(callstorelocation) userInfo:nil repeats:YES];
     //    [[NSRunLoop currentRunLoop] addTimer:timerr forMode:NSDefaultRunLoopMode];
}



-(void)callThisForeGroundMethode

{
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    
    [dict setValue:@"delete" forKey:@"name"];
    
    
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"reset_notification_counter" :dict :dict1];
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"delete"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"location"])
    {
    }
}

-(void) processFailed :(NSError *)responseDictionary
{
   // ActivityIdenter.hidden=NO;
    NSLog(@"error");
}


-(void)callnetconnection
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus status = [reachability currentReachabilityStatus];
    if(status == NotReachable)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"You should connect with wifi for optimal use." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        alert.tag=2000;
        [alert show];
    }
    else if (status == ReachableViaWiFi)
    {
        //WiFi
        
    }
    
    else if (status == ReachableViaWWAN)
    {
        //3G
        
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application

{
    
    if ([aps1 isEqualToString:@"chat1"])
        
    {
        
        
        
        ChatfriendViewController *frontViewController=[[ChatfriendViewController alloc]init];
        
        frontViewController.chat_noti=@"chat_noti";
        
        // [self.navigationController pushViewController:SVC animated:YES];
        
        // [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
        
        LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
        
        
        
        UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
        
        UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
        
        
        
        SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
        
        revealController.delegate = self;
        
        
        
        revealController.rearViewRevealOverdraw = 120;
        
        revealController.bounceBackOnOverdraw = NO;
        
        revealController.stableDragOnOverdraw = YES;
        
         revealController.rearViewRevealWidth = ([UIScreen mainScreen].bounds.size.width)-52;
               
        
        revealController.rearViewRevealDisplacement = 0;
        
        [revealController setFrontViewPosition:FrontViewPositionLeft animated:NO ];
        
        revealController.bounceBackOnOverdraw=NO;
        
        revealController.stableDragOnOverdraw=YES;
        
        self.window.rootViewController = revealController;
        
        
        
    }
    
    else if ([aps1 isEqualToString:@"sisuchat1"])
    {
         ChatfriendViewController *frontViewController=[[ChatfriendViewController alloc]init];
        frontViewController.sisuchat_noti=@"sisuchat_noti";
        // [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
        LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
        UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
        UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
        SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
        revealController.delegate = self;
        revealController.rearViewRevealOverdraw = 120;
        revealController.bounceBackOnOverdraw = NO;
        revealController.stableDragOnOverdraw = YES;
        revealController.rearViewRevealWidth = ([UIScreen mainScreen].bounds.size.width)-52;
               
        revealController.rearViewRevealDisplacement = 0;
        [revealController setFrontViewPosition:FrontViewPositionLeft animated:NO ];
       revealController.bounceBackOnOverdraw=NO;
       revealController.stableDragOnOverdraw=YES;
       self.window.rootViewController = revealController;
     }
    application.applicationIconBadgeNumber = 0;
    //    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"id"] > 0)
    //    {
    [self callThisForeGroundMethode];
   // }
   NSTimer *timerr = [NSTimer timerWithTimeInterval:10.0 target:self selector:@selector(callnetconnection) userInfo:nil repeats:NO];
   [[NSRunLoop currentRunLoop] addTimer:timerr forMode:NSDefaultRunLoopMode];
}

//- (void)applicationDidBecomeActive:(UIApplication *)application {

//    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

//      [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];

//}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    //[self saveContext];
}

#pragma mark - Core Data stack



-(void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    //Get all values from here what you needed.
}

-(void)signIn:(GIDSignIn *)signIn didDisconnectWithUser:(GIDGoogleUser *)user withError:(NSError *)error {
    
}


@end
