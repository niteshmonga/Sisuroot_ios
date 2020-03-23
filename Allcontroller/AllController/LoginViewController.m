#import "LoginViewController.h"
#import "ForgotViewController.h"
#import "EditViewController.h"
#import "MyWebserviceManager.h"
#import "UIImageView+WebCache.h"
#import "ViewController.h"
#import "AllowContactViewController.h"
#import <GoogleSignIn/GoogleSignIn.h>
#import <Contacts/Contacts.h>
#import <AddressBookUI/AddressBookUI.h>
#import "AppDelegate.h"
#import "DemoGraphicViewController.h"
#import "FeedViewController.h"
#import "TermsnconditionViewController.h"
#import "UIView+RNActivityView.h"
#import "SCLAlertView.h"
#import "KeychainItemWrapper.h"
#import "DemoOtherViewController.h"
#import "BriefstateQ1ViewController.h"
#import "BriefstateViewController.h"
#import <GoogleAnalytics/GAIFields.h>
#import "Flurry.h"
#import "smilepage1ViewController.h"
#import "sleedmoodexerViewController.h"
#import "SignupViewController.h"
#import "SWRevealViewController.h"
@interface LoginViewController ()<GIDSignInUIDelegate>
{
    NSMutableDictionary *Arr;
    NSMutableArray *arrayTableData;
    NSString *name;
    NSString *contacts;
    NSString *rememberstr;
    NSString *password;
    NSString *username;
}

@end
NSString *kSuccessTitle = @"Congratulations";
NSString *kErrorTitle = @"Connection error";
NSString *kNoticeTitle = @"Notice";
NSString *kWarningTitle = @"Warning";
NSString *kInfoTitle = @"Info";
NSString *kSubtitle = @"You've just displayed this awesome Pop Up View";
NSString *kButtonTitle = @"Done";
NSString *kAttributeTitle = @"Attributed string operation successfully completed.";
@implementation LoginViewController
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)btnregister:(id)sender {
      SignupViewController *Svc=[[SignupViewController alloc]init];
      [self.navigationController pushViewController:Svc animated:YES];
}


-(IBAction) buttonHandlerSecureText:(UIButton *)sender{
      if(sender.tag ==1){
            [self.passwordTF setSecureTextEntry:NO];
          [_showhidepassword setImage:[UIImage imageNamed:@"noun_Eye_149012.png"] forState:UIControlStateNormal];
         sender.tag = 2;
      }
      else
      {
          [self.passwordTF setSecureTextEntry:YES];
        [_showhidepassword setImage:[UIImage imageNamed:@"Group 256.png"] forState:UIControlStateNormal];
         sender.tag = 1;
      }
}

- (void)viewDidLoad
{
    
    SWRevealViewController *revealController = [self revealViewController];
     revealController.panGestureRecognizer.enabled = NO;
     revealController.tapGestureRecognizer.enabled=NO;
    _showhidepassword.tag=1;
    [FIRAnalytics setScreenName:@"Login" screenClass:@"Login"];
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"SisurootLogin" accessGroup:nil];
   self.userTF.text = [keychainItem objectForKey:(__bridge id)(kSecAttrAccount)];
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"Username" attributes:@{ NSForegroundColorAttributeName : [UIColor lightGrayColor] }];
    self.userTF.attributedPlaceholder = str;
    
    NSAttributedString *str1 = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{ NSForegroundColorAttributeName : [UIColor lightGrayColor] }];
       self.emailtf.attributedPlaceholder = str1;
    NSAttributedString *str2 = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{ NSForegroundColorAttributeName : [UIColor lightGrayColor] }];
       self.passwordTF.attributedPlaceholder = str2;
    self.userTF.textColor = [UIColor whiteColor];
     self.passwordTF.textColor = [UIColor whiteColor];
     self.emailtf.textColor = [UIColor whiteColor];
    NSData *pwdData = [keychainItem objectForKey:(__bridge id)(kSecValueData)];
    NSString *password = [[NSString alloc] initWithData:pwdData encoding:NSUTF8StringEncoding];
    self.passwordTF.text = password;
    [super viewDidLoad];
    if (_userTF.text.length < 1)
    {
        _Rememberimg.image = [UIImage imageNamed:@"uncheck_60px.png"];
        rememberstr=@"0";
    }
    else
    {
        rememberstr=@"1";
        _Rememberimg.image = [UIImage imageNamed:@"check_60px (1).png"];
    }
    [[NSUserDefaults standardUserDefaults] setValue:@"0" forKey:@"launch"];
    activityIden.hidden=YES;
    self.navigationController.navigationBar.hidden=YES;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    arrayTableData = [[NSMutableArray alloc]init];
    [[GIDSignIn sharedInstance] signOut];
    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    signIn.uiDelegate = self;
    signIn.delegate = self;
   UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
    if ([_str1 isEqualToString:@"done"])
    {
        _BackBtnobj.hidden=YES;
    }
    if ([_changebackstr isEqualToString:@"change"])
    {
        _BackBtnobj.hidden=YES;
     }
}

- (void)signIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController
{
    [self presentViewController:viewController animated:YES completion:nil];
}
- (void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - GIDSignInDelegate

- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    if (error) {
        return;
    }
    [self callThisMethode : user.authentication.accessToken];
}

-(void)callThisMethode : (NSString *)str
{
    NSString *mainUrl = [NSString stringWithFormat:@"https://www.googleapis.com/oauth2/v3/userinfo?access_token=%@",str];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer  = [AFJSONResponseSerializer  serializerWithReadingOptions:NSJSONReadingAllowFragments];
    [manager POST:mainUrl parameters:nil success:^(AFHTTPRequestOperation *operation,id responseObject)
     {
         NSLog(@"Test is.....%@",responseObject);
         self.email=[responseObject valueForKey:@"email"];
         self.name=[responseObject valueForKey:@"name"];
         self.email_verified=[responseObject valueForKey:@"email_verified"];
         self.family_name=[responseObject valueForKey:@"family_name"];
         self.given_name=[responseObject valueForKey:@"given_name"];
         self.picture=[responseObject valueForKey:@"picture"];
         self.profile=[responseObject valueForKey:@"profile"];
         self.gender=[responseObject valueForKey:@"gender"];
         self.sub=[responseObject valueForKey:@"sub"];
         self.locale=[responseObject valueForKey:@"locale"];
         [[GIDSignIn sharedInstance] signOut];
         [self callGoogleMethode: responseObject];
         [self.view showActivityViewWithLabel:@"Loading"];
     }
        failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gmailbtnAction:(id)sender
{
    [[NSUserDefaults standardUserDefaults]setObject:@"gmaillogin" forKey:@"gmaillogin"];
    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignIn sharedInstance].delegate = self;
    [[GIDSignIn sharedInstance]signOut];
    [[GIDSignIn sharedInstance]signIn];
}

-(void) tapped:(UIGestureRecognizer *) sender
{
    [_userTF resignFirstResponder];
    [_passwordTF resignFirstResponder];
     [_emailtf resignFirstResponder];
}

-(void)callGoogleMethode :(NSDictionary *)responseObject
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"userRegistrationViaGmail" forKey:@"name"];
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [paramDict setValue:[responseObject valueForKey:@"name"] forKey:@"name"];
    [paramDict setValue:[responseObject valueForKey:@"email"] forKey:@"email"];
    [paramDict setValue:[responseObject valueForKey:@"email_verified"] forKey:@"email_verified"];
    [paramDict setValue:[responseObject valueForKey:@"picture"] forKey:@"picture"];
    [paramDict setValue:[responseObject valueForKey:@"profile"] forKey:@"profile"];
    [paramDict setValue:[responseObject valueForKey:@"family_name"] forKey:@"family_name"];
    [paramDict setValue:[responseObject valueForKey:@"given_name"] forKey:@"given_name"];
    [paramDict setValue:[responseObject valueForKey:@"gender"] forKey:@"gender"];
    [paramDict setValue:[responseObject valueForKey:@"sub"] forKey:@"sub"];
    [paramDict setValue:[responseObject valueForKey:@"locale"] forKey:@"locale"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"udid"] forKey:@"udid"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"userRegistrationViaGmail" :dict :paramDict];
    
}

-(void)callLoginService
{
  if ([rememberstr isEqual:@"1"])
          {
            KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"SisurootLogin" accessGroup:nil];
       
              NSString *username = self.userTF.text;
              NSString *password = self.passwordTF.text;
              //because keychain saves password as NSData object
              NSData *pwdData = [password dataUsingEncoding:NSUTF8StringEncoding];
              
              //Save item
              keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"SisurootLogin" accessGroup:nil];
              [keychainItem setObject:username forKey:(__bridge id)(kSecAttrAccount)];
              [keychainItem setObject:pwdData forKey:(__bridge id)(kSecValueData)];
          }
          else
          {
              KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"SisurootLogin" accessGroup:nil];
              [keychainItem resetKeychainItem];
           //   [keychainItem setObject:self.userTF.text forKey:(__bridge id)(kSecAttrAccount)];
           }
    
    [_LoginBtnobj setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view showActivityViewWithLabel:@"Loading"];
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"userLogin" forKey:@"name"];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:_userTF.text forKey:@"customerUsername"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"udid"] forKey:@"udid"];
    [paramDict setValue:_emailtf.text forKey:@"email"];
    [paramDict setValue:_passwordTF.text forKey:@"customerPassword"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
    [paramDict setValue:rememberstr forKey:@"RememberStatus"];

    // [paramDict setValue:[[NSfprocesUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"userLogin" :dict :paramDict];
    
}

-(void)callfetchprofile
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"getProfileInfo" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
   [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"getProfileInfo" :dict :dict1];
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"userLogin"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"SisurootLogin" accessGroup:nil];
            NSString *username = self.userTF.text;
            keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"SisurootLogin" accessGroup:nil];
            [keychainItem setObject:username forKey:(__bridge id)(kSecAttrAccount)];
            if([[responseDictionary valueForKey:@"status_message"] isEqualToString:@"Invalid Username Or Password"])
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
                            
            }
            else
                {
                [FIRAnalytics logEventWithName:kFIREventLogin
                                                parameters:@{
                                                             kFIRParameterMethod: @"Login"
                                                             }];
                             [Flurry setUserID:_userTF.text];
                             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"id"] forKey:@"id"];
                             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"username"] forKey:@"username"];
                             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"password"] forKey:@"password"];
                             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"] forKey:@"profile_img"];
                             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"email"] forKey:@"email"];
                             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"remember_status"] forKey:@"remember_status"];
                             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"email_verified_status"] forKey:@"email_verified_status"];
                             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"GAD7_required_status"] forKey:@"GAD7_required_status"];
                             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"DietaryInfo_required_status"] forKey:@"DietaryInfo_required_status"];
                             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"PHQ9_required_status"] forKey:@"PHQ9_required_status"];
                             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Dafault_demographic_form_status"] forKey:@"Dafault_demographic_form_status"];
                                            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Terms_Cond_Verified_Status"] forKey:@"Terms_Cond_Verified_Status"];
                                            [[NSUserDefaults standardUserDefaults] setValue:@"loginfirst" forKey:@"loginfirst"];
                                            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"DemographicFormStatus"] forKey:@"DemographicFormStatus"];
                              
                            if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"email_verified_status"] isEqual:@"0"])
                            {
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please check your email and verify your email id" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Resend", nil];
                                 alert.tag=2000;
                                [alert show];
                                
                            }
                            else if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"email_verified_status"] isEqual:@"1"])
                            {
                                
                                NSString *GAD7_required_status = [[responseDictionary valueForKey:@"data"]valueForKey:@"GAD7_required_status"];
                                NSString *DietaryInfo_required_status = [[responseDictionary valueForKey:@"data"]valueForKey:@"DietaryInfo_required_status"];
                                NSString *PHQ9_required_status = [[responseDictionary valueForKey:@"data"]valueForKey:@"PHQ9_required_status"];
                                _Dafault_demographic_form_status = [[responseDictionary valueForKey:@"data"]valueForKey:@"Dafault_demographic_form_status"];
                                
                                
                                if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Terms_Cond_Verified_Status"]integerValue] == 0)
                                {
                                   TermsnconditionViewController *EVC=[[TermsnconditionViewController alloc]init];
                                    [self.navigationController pushViewController:EVC animated:YES];
                                 }
                                else if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"DemographicFormStatus"]integerValue] == 0)
                                  {
                                         if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Dafault_demographic_form_status"] integerValue] == 1)
                                         {
                                           DemoGraphicViewController *EVC=[[DemoGraphicViewController alloc]init];
                                             [self.navigationController pushViewController:EVC animated:YES];
                                         }
                                         if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Dafault_demographic_form_status"]integerValue] == 2)
                                         {
                                             DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
                                             [BSV setTypeString:@"demo1"];
                                             [BSV setDemostr:@"demostr"];
                                             [self.navigationController pushViewController:BSV animated:YES];
                                        }
                                         if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Dafault_demographic_form_status"]integerValue] == 3)
                                         {
                                             
                                             DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
                                             [BSV setTypeString:@"demo2"];
                                             [BSV setDemostr:@"demostr"];

                                             [self.navigationController pushViewController:BSV animated:YES];
                                             
                                         }
                                         if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Dafault_demographic_form_status"]integerValue] == 4)
                                         {
                                             
                                             DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
                                             [BSV setTypeString:@"demo3"];
                                             [BSV setDemostr:@"demostr"];

                                             [self.navigationController pushViewController:BSV animated:YES];
                                             
                                         }
                                    
                                        }
                                else if ([GAD7_required_status isEqual:@"1"] )
                                {
                                    
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"Please give GAD-7 test to use the app" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                                    
                                    alert.tag=2001;
                                    [alert show];
                                }
                                else  if ([PHQ9_required_status isEqual:@"1"])
                                {
                                    
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"Please give PHQ9 test to use the app" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                                    
                                    alert.tag=2002;
                                    [alert show];
                                }
                                else if ([DietaryInfo_required_status isEqual:@"1"])
                                {
                                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"Please fill Dietary info form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                                    
                                    alert.tag=2003;
                                    [alert show];
                                    
                                  }
                                else
                                {
                                          NSDate *currentDate = [[NSDate alloc] init];
                                          NSTimeZone *timeZone = [NSTimeZone defaultTimeZone];
                                          NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                                          [dateFormatter setTimeZone:timeZone];
                                          [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                                          NSString *localDateString = [dateFormatter stringFromDate:currentDate];
                                    
                                     [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"] valueForKey:@"activity_ans_date"] forKey:@"activity_ans_date"];
                                    
                                          if([[[responseDictionary valueForKey:@"data"] valueForKey:@"activity_ans_date"]isEqualToString:localDateString])
                                          {
                                             smilepage1ViewController *EVC=[[smilepage1ViewController alloc]init];
                                             [self.navigationController pushViewController:EVC animated:YES];
                                          }
                                          else
                                          {
                                              sleedmoodexerViewController *EVC=[[sleedmoodexerViewController alloc]init];
                                              [self.navigationController pushViewController:EVC animated:YES];
                                          }
                                    
                                 }
//                                else
//                                {
//                                         NSTimeZone *timeZone = [NSTimeZone defaultTimeZone];
//                                          NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//                                          [dateFormatter setTimeZone:timeZone];
//                                          [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//                                        FeedViewController *EVC=[[FeedViewController alloc]init];
//                                    [self.navigationController pushViewController:EVC animated:YES];
//                                }
                        }
                   }
            }
    }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"userRegistrationViaGmail"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [FIRAnalytics logEventWithName:kFIREventLogin
                                           parameters:@{
                                                         kFIRParameterMethod: @"Login"
                                                        }];
            [Flurry setUserID:[[responseDictionary valueForKey:@"data"]valueForKey:@"username"]];
                        [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"id"] forKey:@"id"];
                        [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"] forKey:@"profile_img"];
                        [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"username"] forKey:@"username"];
                        [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"email"] forKey:@"email"];
                         [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"email_verified_status"] forKey:@"email_verified_status"];
                        [self.view hideActivityView];
                if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"email_verified_status"] isEqual:@"0"])
                        {
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please check your email and verify your email id" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Resend", nil];
                            alert.tag=2000;
                            [alert show];
                        }
                        else if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"email_verified_status"] isEqual:@"1"])
                        {
                            if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Terms_Cond_Verified_Status"]integerValue] == 0)
                            {
                               TermsnconditionViewController *EVC=[[TermsnconditionViewController alloc]init];
                                [self.navigationController pushViewController:EVC animated:YES];
                            }
             else if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"DemographicFormStatus"]integerValue] == 0)
                                    
                                {
                                    if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Dafault_demographic_form_status"] integerValue] == 1)
                                    {
                                         DemoGraphicViewController *EVC=[[DemoGraphicViewController alloc]init];
                                        [self.navigationController pushViewController:EVC animated:YES];
                                    }
                                    if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Dafault_demographic_form_status"]integerValue] == 2)
                                    {
                                        DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
                                        [BSV setTypeString:@"demo1"];
                                        [BSV setDemostr:@"demostr"];
                                        
                                        [self.navigationController pushViewController:BSV animated:YES];
                                    }
                                    if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Dafault_demographic_form_status"]integerValue] == 3)
                                    {
                                       DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
                                        [BSV setTypeString:@"demo2"];
                                        [BSV setDemostr:@"demostr"];
                                        
                                        [self.navigationController pushViewController:BSV animated:YES];
                                        
                                    }
                                    if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Dafault_demographic_form_status"]integerValue] == 4)
                                    {
                                        DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
                                        [BSV setTypeString:@"demo3"];
                                        [BSV setDemostr:@"demostr"];
                                        
                                        [self.navigationController pushViewController:BSV animated:YES];
                                        
                                    }
                                }
                            else
                            {
                                Arr =[[NSMutableDictionary alloc]initWithDictionary:[responseDictionary valueForKey:@"data"]];
                                     //smilepage1ViewController *EVC=[[smilepage1ViewController alloc]init];
                                NSDate *currentDate = [[NSDate alloc] init];
                                NSTimeZone *timeZone = [NSTimeZone defaultTimeZone];
                                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                                [dateFormatter setTimeZone:timeZone];
                                [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                                 NSString *localDateString = [dateFormatter stringFromDate:currentDate];
                                  [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"] valueForKey:@"activity_ans_date"] forKey:@"activity_ans_date"];
                                
                                  if([[[responseDictionary valueForKey:@"data"] valueForKey:@"activity_ans_date"]isEqualToString:localDateString])
                                    {
                                    smilepage1ViewController *EVC=[[smilepage1ViewController alloc]init];
                                    [self.navigationController pushViewController:EVC animated:YES];
                                   }
                                   else
                                        {
                                         sleedmoodexerViewController *EVC=[[sleedmoodexerViewController alloc]init];
                                        [self.navigationController pushViewController:EVC animated:YES];
                                }
                            }
//                            else
//                            {
//                                Arr =[[NSMutableDictionary alloc]initWithDictionary:[responseDictionary valueForKey:@"data"]];
//                                NSTimeZone *timeZone = [NSTimeZone defaultTimeZone];
//                                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//                                [dateFormatter setTimeZone:timeZone];
//                                [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//                                FeedViewController *EVC=[[FeedViewController alloc]init];
//                                                                   [self.navigationController pushViewController:EVC animated:YES];
//                     }
                 }
          }
    }
        
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"email"])
    {
    }
}

-(void) processFailed :(NSError *)responseDictionary
{
    [self.view hideActivityView];
    NSLog(@"error");
}



- (IBAction)LoginBtn:(id)sender {
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    NSString *msg  = @"0";
    if([_userTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
    {
        msg = @"Please enter username";
    }
    else if (_passwordTF.text.length == 0 || [_passwordTF.text isEqualToString:@" "])
    {
        msg = @"Password field should not be empty!";
    }
    
    else if (_passwordTF.text.length < 4)
    {
        msg = @"Please enter valid password";
    }
    else if (_emailtf.text.length < 1)
          {
              msg = @"Please enter your email address";
              
          }
          else if([emailTest evaluateWithObject:_emailtf.text] == NO)
          {
              msg = @"Please enter valid email address";
              
          }
    if (![msg isEqualToString:@"0"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        [self callLoginService];
    }
}

- (IBAction)ForgotBtn:(id)sender {
    ForgotViewController *Fvc=[[ForgotViewController alloc]init];
    [self.navigationController pushViewController:Fvc animated:YES];
}

-(void)callstorelocation
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"location" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
     [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"GetLatLng" :dict :dict1];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        NSLog(@"You have clicked Cancel");
    }
    else if(buttonIndex == 1)
    {
       if (alertView.tag==2000)
        {
            MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
            [dict setValue:@"email" forKey:@"name"];
            NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
            [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"email"] forKey:@"email"];
            [webServiceManager setDelegateMethode:self];
            [webServiceManager callMyWebServiceManager:@"resendMail" :dict :dict1];
        }
        
        else
            if(alertView.tag == 2001)
            {
                BriefstateViewController *bsvc=[[BriefstateViewController alloc]init];
                [bsvc setIdentifystr:@"done1"];
                bsvc.teststatus=@"1";
                [self.navigationController pushViewController:bsvc animated:YES];
            }
            else
                if(alertView.tag == 2002)
                {
                    BriefstateQ1ViewController *bsvc=[[BriefstateQ1ViewController alloc]init];
                    bsvc.teststatus=@"1";
                    [self.navigationController pushViewController:bsvc animated:YES];
                    
                }
                else if(alertView.tag == 2003)
                {
                    if ([_Dafault_demographic_form_status integerValue] == 1)
                    {
                        DemoGraphicViewController *EVC=[[DemoGraphicViewController alloc]init];
                        [self.navigationController pushViewController:EVC animated:YES];
                    }
                    if ([_Dafault_demographic_form_status integerValue] == 2)
                    {
                        DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
                        [BSV setTypeString:@"demo1"];
                        [BSV setDemostr:@"demostr"];
                        [self.navigationController pushViewController:BSV animated:YES];
                    }
                    if ([_Dafault_demographic_form_status integerValue] == 3)
                    {
                        DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
                        [BSV setTypeString:@"demo2"];
                        [BSV setDemostr:@"demostr"];
                        [self.navigationController pushViewController:BSV animated:YES];
                     }
                    if ([_Dafault_demographic_form_status integerValue] == 4)
                    {
                        DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
                        [BSV setTypeString:@"demo3"];
                        [BSV setDemostr:@"demostr"];
                        [self.navigationController pushViewController:BSV animated:YES];
                    }
                }
        else
        {
        }
   }
}

@end
