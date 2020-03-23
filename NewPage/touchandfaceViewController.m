#import "touchandfaceViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "FeedViewController.h"
#import "LeftViewController.h"
#import "LoginViewController.h"
#import "smilepage1ViewController.h"
#import "SWRevealViewController.h"
#import "sleedmoodexerViewController.h"
@interface touchandfaceViewController ()
@end

@implementation touchandfaceViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated {
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
//    NSString *myLocalizedReasonString = @"Touch ID to unlock the App";
    if (@available(iOS 11.0, *)) {
        if(myContext.biometryType==LABiometryTypeFaceID)
        {
            _myLocalizedReasonString=@"Set your face to authenticate";
        }
        else  if(myContext.biometryType==LABiometryTypeTouchID)
        {
            _myLocalizedReasonString=@"Set your face to authenticate";
        }
        else
        {
            _myLocalizedReasonString=@"Set your authenticate";
        }
    } else {
        _myLocalizedReasonString=@"Set your face to authenticate";
        // Fallback on earlier versions
    }
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:_myLocalizedReasonString
                            reply:^(BOOL success, NSError *error) {
                                if (success) {
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        [self callpage];    // [self performSegueWithIdentifier:@"Success" sender:nil];
                                    });
                                }
                                else {
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        if(error.code==LAErrorUserCancel)
                                           //[error.description isEqualToString:@"Canceled by user."])
                                        {
                                            SWRevealViewController *revealController = [self revealViewController];
                                            LoginViewController *LVC=[[LoginViewController alloc]init];
                                           UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
                                            [revealController pushFrontViewController:nav animated:YES];
                                        }
                                        else if(error.code==LAErrorUserFallback)
                                        {
                                            SWRevealViewController *revealController = [self revealViewController];
                                            LoginViewController *LVC=[[LoginViewController alloc]init];
                                           UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
                                            [revealController pushFrontViewController:nav animated:YES];
                                        }
                                        else
                                        {
                                            SWRevealViewController *revealController = [self revealViewController];
                                            LoginViewController *LVC=[[LoginViewController alloc]init];
                                            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
                                            [revealController pushFrontViewController:nav animated:YES];
                                            
//                                         UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                                                            message:error.description
//                                                                                           delegate:self
//                                                                                  cancelButtonTitle:@"OK"
//                                                                                  otherButtonTitles:nil, nil];
//                                        [alertView show];
//                                        NSLog(@"Switch to fall back authentication - ie, display a keypad or password entry box");
                                        }
                                    });
                                }
                            }];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self callpage];
        });
    }
}

-(void)callpage
{
    //FeedViewController *EVC=[[FeedViewController alloc]init];
    //[self.navigationController pushViewController:EVC animated:YES];
      NSDate *currentDate = [[NSDate alloc] init];
       NSTimeZone *timeZone = [NSTimeZone defaultTimeZone];
       // or Timezone with specific name like
       // [NSTimeZone timeZoneWithName:@"Europe/Riga"] (see link below)
       NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
       [dateFormatter setTimeZone:timeZone];
       [dateFormatter setDateFormat:@"yyyy-MM-dd"];
       NSString *localDateString = [dateFormatter stringFromDate:currentDate];
       NSString *bcdhbdcb=[[NSUserDefaults standardUserDefaults] valueForKey:@"activity_ans_date"];
       if([[[NSUserDefaults standardUserDefaults] valueForKey:@"activity_ans_date"]isEqualToString:localDateString])
       {
          //sleedmoodexerViewController *EVC=[[sleedmoodexerViewController alloc]init];
          FeedViewController *EVC=[[FeedViewController alloc]init];
          [self.navigationController pushViewController:EVC animated:YES];
       }
       else
       {
           if([[[NSUserDefaults standardUserDefaults] valueForKey:@"activity_ans_date1"]isEqualToString:localDateString])
                
           {
               FeedViewController *EVC=[[FeedViewController alloc]init];
               [self.navigationController pushViewController:EVC animated:YES];
           }
           else
           {
               sleedmoodexerViewController *EVC=[[sleedmoodexerViewController alloc]init];
               [self.navigationController pushViewController:EVC animated:YES];
           }
          //smilepage1ViewController *EVC=[[smilepage1ViewController alloc]init];
    }
}

@end
