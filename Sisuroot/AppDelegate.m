

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "ProfileViewController.h"
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
#import <CoreLocation/CoreLocation.h>
#import "Reachability.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
 #import "FrontViewController.h"
#import "TIMERUIApplication.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface AppDelegate ()
{
    NSString *str;
    CLLocationManager *locationManager;
    NSString *latstr;
    NSString *longstr;
    CLGeocoder *ceo;
    NSString *aps1;
    NSString *aps2;
    NSString *aps3;
}
@end

@implementation AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    
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
    //NSLog(@"%@", response.noThread 7tification.request.content.userInfo);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidTimeout:) name:kApplicationDidTimeoutNotification object:nil];
    
//    GAI *gai = [GAI sharedInstance];
//    [gai trackerWithTrackingId:@"UA-112860070-1"];
    
    // Optional: automatically report uncaught exceptions.
   // gai.trackUncaughtExceptions = YES;
    
    // Optional: set Logger to VERBOSE for debug information.
    // Remove before app release.
   // gai.logger.logLevel = kGAILogLevelVerbose;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    
    CLGeocoder *ceo;
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"test analytics"];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    NSError* configureError;
    // [[EAGLContext sharedInstance] configureWithError: &configureError];
    NSAssert(!configureError, @"Error configuring Google services: %@", configureError);
    
    
    [GIDSignIn sharedInstance].clientID = @"58322627713-osm3rh040j4gvnavjfdretl6oobq3je3.apps.googleusercontent.com";
    
   
    
    //    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound |    UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
    //    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    if( SYSTEM_VERSION_LESS_THAN( @"10.0" ) )
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound |    UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
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
    
    NSString *str = [[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
    NSString *str1 = [[NSUserDefaults standardUserDefaults] valueForKey:@"email_verified_status"];
    
    
    if(str.length <=0 && str1.length <=0)
    {
        
        FirstViewController *frontViewController=[[FirstViewController alloc]init];
        
        // [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
        LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
        
        UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
        UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
        
        SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
        revealController.delegate = self;
        
        revealController.rearViewRevealOverdraw = 120;
        revealController.bounceBackOnOverdraw = NO;
        revealController.stableDragOnOverdraw = YES;
        revealController.rearViewRevealWidth = 250;
        revealController.rearViewRevealDisplacement = 0;
        [revealController setFrontViewPosition:FrontViewPositionLeft animated:NO ];
        revealController.bounceBackOnOverdraw=NO;
        revealController.stableDragOnOverdraw=YES;
        self.window.rootViewController = revealController;
        
    }
    else if(str.length <=0)
    {
        
        FirstViewController *frontViewController=[[FirstViewController alloc]init];
         // [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
        LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
        
        UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
        UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
        
        SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
        revealController.delegate = self;
        
        revealController.rearViewRevealOverdraw = 120;
        revealController.bounceBackOnOverdraw = NO;
        revealController.stableDragOnOverdraw = YES;
        revealController.rearViewRevealWidth = 250;
        revealController.rearViewRevealDisplacement = 0;
        [revealController setFrontViewPosition:FrontViewPositionLeft animated:NO ];
        revealController.bounceBackOnOverdraw=NO;
        revealController.stableDragOnOverdraw=YES;
        self.window.rootViewController = revealController;
        
    }
    else
    {
        
        FeedViewController *frontViewController=[[FeedViewController alloc]init];
        
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
        revealController.rearViewRevealWidth = 250;
        revealController.rearViewRevealDisplacement = 0;
        [revealController setFrontViewPosition:FrontViewPositionLeftSide animated:NO ];
        revealController.bounceBackOnOverdraw=NO;
        revealController.stableDragOnOverdraw=YES;
        self.window.rootViewController = revealController;
        
        
    }
    
    
    
    //[[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"launch"];
    
    
    //FrontViewController *frontViewController=[[FrontViewController alloc]init];
    //    UINavigationController *abc=[[UINavigationController alloc]initWithRootViewController:LVC];
    //    self.window.rootViewController=abc;
    //  UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
    // self.window.rootViewController = frontNavigationController;
    
    
    // revealController.rearViewRevealWidth = 60;
    
    [self.window makeKeyAndVisible];
    //    NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:30.0 repeats:YES block:^(NSTimer * _Nonnull timer)
    //                       {
    //                           [ self callstorelocation ];
    //                       }];
    NSTimer *timerr = [NSTimer timerWithTimeInterval:20.0 target:self selector:@selector(callstorelocation) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timerr forMode:NSDefaultRunLoopMode];
    
    NSTimer *timer3 = [NSTimer scheduledTimerWithTimeInterval:5.0 repeats:NO block:^(NSTimer * _Nonnull timer)
                       {
                           [ self callThisCallLocationMethodeForSystem ];
                       }];
    
    // Override point for customization after application launch.
    
    return YES;
}

//-(void)applicationDidTimeout:(NSNotification *) notif
//{
//    NSLog (@"time exceeded!!");
//
//    //This is where storyboarding vs xib files comes in. Whichever view controller you want to revert back to, on your storyboard, make sure it is given the identifier that matches the following code. In my case, "mainView". My storyboard file is called MainStoryboard.storyboard, so make sure your file name matches the storyboardWithName property.
//    UIViewController *controller = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:NULL] instantiateViewControllerWithIdentifier:@"mainView"];
//
//    [(UINavigationController *)self.window.rootViewController pushViewController:controller animated:YES];
//}

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

-(void)callThisCallLocationMethodeForSystem
{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=kCLDistanceFilterNone;
    [locationManager requestAlwaysAuthorization];
    [locationManager startMonitoringSignificantLocationChanges];
    [locationManager setAllowsBackgroundLocationUpdates:YES];
    [locationManager startUpdatingLocation];
    
    // [self checkLocationServicesAndStartUpdates];
}

//-(void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
//{
////    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:[UIApplication sharedApplication].applicationIconBadgeNumber+1];

//        [UIApplication sharedApplication].applicationIconBadgeNumber =
//        [UIApplication sharedApplication].applicationIconBadgeNumber+1;
//}
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
    UIApplicationState state = [application applicationState];
    //    if (state == UIApplicationStateActive)
    //    {
    //    [UIApplication sharedApplication].applicationIconBadgeNumber =
    //        [UIApplication sharedApplication].applicationIconBadgeNumber+1;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pushNotification" object:nil userInfo:userInfo];
    
    _notificationDictionary = userInfo;
    application.applicationIconBadgeNumber = [[[userInfo valueForKey:@"aps"] valueForKey:@"badge"] integerValue];
    
    //    if(![[[userInfo valueForKey:@"aps"] valueForKey:@"alert"] isEqualToString:@"You have a new message."])
    //    {
    //        [[NSNotificationCenter defaultCenter]
    //         postNotificationName:@"TestNotification"
    //         object:self];
    //    }
    // }
    if ([[[[userInfo valueForKey:@"aps"] valueForKey:@"alert"] valueForKey:@"title"]  isEqualToString:@"notification"])
    {
        //        [[NSNotificationCenter defaultCenter]
        //         postNotificationName:@"notification"
        //         object:self];
        aps1=[[[userInfo valueForKey:@"aps"] valueForKey:@"alert"] valueForKey:@"title"];
        
    }
    else if ([[[[userInfo valueForKey:@"aps"] valueForKey:@"alert"] valueForKey:@"title"]  isEqualToString:@"chat"])
    {
        
        //        [[NSNotificationCenter defaultCenter]
        //         postNotificationName:@"chat"
        //         object:self];
        aps2=[[[userInfo valueForKey:@"aps"] valueForKey:@"alert"] valueForKey:@"title"];
        
    }
    else if ([[[[userInfo valueForKey:@"aps"] valueForKey:@"alert"] valueForKey:@"title"]  isEqualToString:@"notification_friendRequest"])
    {
        //            [[NSNotificationCenter defaultCenter]
        //             postNotificationName:@"notification_friendRequest"
        //             object:self];
        aps3=[[[userInfo valueForKey:@"aps"] valueForKey:@"alert"] valueForKey:@"title"];
        
    }
    
    
    if ( application.applicationState == UIApplicationStateInactive || application.applicationState == UIApplicationStateBackground  )
    {
        NSLog(@"i received a notification...");
        NSLog(@"Message: %@",[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]);
        NSLog(@"whole data: %@",userInfo);
        
        if ([aps1 isEqualToString:@"notification"])
        {
            ResponseViewController *frontViewController=[[ResponseViewController alloc]init];
            
            // [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
            LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
            
            UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
            UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
            
            SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
            revealController.delegate = self;
            
            revealController.rearViewRevealOverdraw = 120;
            revealController.bounceBackOnOverdraw = NO;
            revealController.stableDragOnOverdraw = YES;
            revealController.rearViewRevealWidth = 250;
            revealController.rearViewRevealDisplacement = 0;
            [revealController setFrontViewPosition:FrontViewPositionLeft animated:NO ];
            revealController.bounceBackOnOverdraw=NO;
            revealController.stableDragOnOverdraw=YES;
            self.window.rootViewController = revealController;
        }
        else if([aps2 isEqualToString:@"chat"])
        {
            ChatfriendViewController *frontViewController=[[ChatfriendViewController alloc]init];
            
            // [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
            LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
            
            UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
            UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
            
            SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
            revealController.delegate = self;
            
            revealController.rearViewRevealOverdraw = 120;
            revealController.bounceBackOnOverdraw = NO;
            revealController.stableDragOnOverdraw = YES;
            revealController.rearViewRevealWidth = 250;
            revealController.rearViewRevealDisplacement = 0;
            [revealController setFrontViewPosition:FrontViewPositionLeft animated:NO ];
            revealController.bounceBackOnOverdraw=NO;
            revealController.stableDragOnOverdraw=YES;
            self.window.rootViewController = revealController;
            
        }
        
    }
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    // [[NSUserDefaults standardUserDefaults] setValue:@" " forKey:@"id"];
    
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    //home button press programmatically
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"remember_status"] isEqual:@"1"])
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound |    UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        // [[NSUserDefaults standardUserDefaults] setValue:@" " forKey:@"id"];
        
    }
    
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
            
            FrontViewController *frontViewController=[[FrontViewController alloc]init];
            
            // [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
            LeftViewController *leftMenuViewController = [[LeftViewController alloc] init];
            
            UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
            UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
            
            SWRevealViewController * revealController  = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
            revealController.delegate = self;
            
            revealController.rearViewRevealOverdraw = 120;
            revealController.bounceBackOnOverdraw = NO;
            revealController.stableDragOnOverdraw = YES;
            revealController.rearViewRevealWidth = 250;
            revealController.rearViewRevealDisplacement = 0;
            [revealController setFrontViewPosition:FrontViewPositionLeft animated:NO];
            revealController.bounceBackOnOverdraw=NO;
            revealController.stableDragOnOverdraw=YES;
            self.window.rootViewController = revealController;
        }
    }
    
    
    
    NSTimer *timerr = [NSTimer timerWithTimeInterval:20.0 target:self selector:@selector(callstorelocation) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timerr forMode:NSDefaultRunLoopMode];
    
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
    
    //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"You should connect with wifi for optimal use." delegate:self cancelButtonTitle:@"RETRY" otherButtonTitles:nil, nil];
    //         alert.tag=2000;
    //          [alert show];
    //[ self callstorelocation ];
    NSTimer *timerr = [NSTimer timerWithTimeInterval:20.0 target:self selector:@selector(callstorelocation) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timerr forMode:NSDefaultRunLoopMode];
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    if(alertView.tag==2000)
    {
        // [self callstorelocation];
    NSTimer *timerr = [NSTimer timerWithTimeInterval:10.0 target:self selector:@selector(callstorelocation) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timerr forMode:NSDefaultRunLoopMode];
    }
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

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options {
    return [[GIDSignIn sharedInstance] handleURL:url
                               sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                      annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
}

-(void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    //Get all values from here what you needed.
}


-(void)signIn:(GIDSignIn *)signIn didDisconnectWithUser:(GIDGoogleUser *)user withError:(NSError *)error {
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"OldLocation %@", [NSString stringWithFormat:@"%f",newLocation.coordinate.latitude]);
    NSLog(@"NewLocation %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%f",newLocation.coordinate.latitude] forKey:@"lat"];
    
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%f",newLocation.coordinate.longitude] forKey:@"long"];
    
    latstr=[NSString stringWithFormat:@"%f",newLocation.coordinate.latitude];
    longstr=[NSString stringWithFormat:@"%f",newLocation.coordinate.longitude];
    [[NSUserDefaults standardUserDefaults] setValue:latstr forKey:@"lat"];
    [[NSUserDefaults standardUserDefaults] setValue:longstr forKey:@"lng"];
    
    
    // [ self callstorelocation ];
    
}

-(void)callstorelocation
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"location" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    // [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"GetLatLng" :dict :dict1];
}

@end

