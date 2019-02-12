
#import "LoginViewController.h"
#import "ProfileViewController.h"
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
#import "Bs2ViewController.h"
#import "TermsnconditionViewController.h"
#import "UIView+RNActivityView.h"
#import "SCLAlertView.h"
#import "KeychainItemWrapper.h"
#import "DemoOtherViewController.h"
#import "BS4ViewController.h"

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

- (void)viewDidLoad
{

    
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"SisurootLogin" accessGroup:nil];
    
    self.userTF.text = [keychainItem objectForKey:(__bridge id)(kSecAttrAccount)];
    
    //because label uses NSString and password is NSData object, conversion necessary
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
     //idenlbl.hidden=YES;
    // NSString *strtoken=[appDelegate str];
 
     [[NSUserDefaults standardUserDefaults] setValue:@"0" forKey:@"launch"];
    
    activityIden.hidden=YES;
    self.navigationController.navigationBar.hidden=YES;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    arrayTableData = [[NSMutableArray alloc]init];
    
    _LoginBtnobj.layer.cornerRadius=21;
    _LoginBtnobj.clipsToBounds=YES;
    _LoginBtnobj.layer.borderWidth =1.0f;
    // _LoginBtnobj.layer.borderColor = [[UIColor colorWithRed:255.0f green:69.0f blue:58.0f alpha:1.0f] CGColor]; // Not actually silver
    
    _LoginBtnobj.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    _gmailBtnobj.layer.cornerRadius=21;
    _gmailBtnobj.clipsToBounds=YES;
    _gmailBtnobj.layer.borderWidth =1.0f;
    
    _gmailBtnobj.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    
    [[GIDSignIn sharedInstance] signOut];
    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    signIn.uiDelegate = self;
    signIn.delegate = self;
    
    // [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault];
    
    //[self callfetchprofile];
    //app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //    hud =  [MBProgressHUD showHUDAddedTo:app.window animated:YES];
    //    hud.hidden=YES;
    // Do any additional setup after loading the view from its nib.
    
    
    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
    
    
    if ([_str1 isEqualToString:@"done"])
    {
        _BackBtnobj.hidden=YES;
        // _SkipBtnobj.hidden=YES;
        
    }
    if ([_changebackstr isEqualToString:@"change"])
    {
        _BackBtnobj.hidden=YES;
        // _SkipBtnobj.hidden=YES;
        
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
         
         //         UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"message!" message:@"Are you sure, you want to allow for Access your contacts" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
         //         [alertcrp addButtonWithTitle:@"Ok "];
         //         [alertcrp show];
         
         //  [self callGmailMethode:responseObject];
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
    
    
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignIn sharedInstance].delegate = self;
    [[GIDSignIn sharedInstance]signOut];
    [[GIDSignIn sharedInstance]signIn];
    
    //    UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"message!" message:@"Are you sure, you want to allow for Access your contacts" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    //    [alertcrp addButtonWithTitle:@"Ok "];
    //    [alertcrp show];
    
    
    
}

-(void) tapped:(UIGestureRecognizer *) sender
{
    [_userTF resignFirstResponder];
    [_passwordTF resignFirstResponder];
}

-(void)callGoogleMethode :(NSDictionary *)responseObject
{
    // idenlbl.hidden=NO;
    
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
    // self.LoginBtnobj.backgroundColor = [UIColor colorWithRed:255/255.0 green:69.0/255.0 blue:58.0/255.0 alpha:1.0];
    // _LoginBtnobj.layer.backgroundColor = [[UIColor colorWithRed:(255.0/255.0)
    //                                                   green:(103.0/255.0)
    //                                                    blue:(0.0/255.0)
    //                                                  alpha:(1.0)] CGColor];
    
    
    [_LoginBtnobj setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view showActivityViewWithLabel:@"Loading"];
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"userLogin" forKey:@"name"];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:_userTF.text forKey:@"customerUsername"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"udid"] forKey:@"udid"];
    
    [paramDict setValue:_passwordTF.text forKey:@"customerPassword"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
    [paramDict setValue:rememberstr forKey:@"RememberStatus"];

    // [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"userLogin" :dict :paramDict];
    
}

-(void)callfetchprofile
{
    //hud.hidden=NO;
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"getProfileInfo" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    
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
            // strarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            [self.view hideActivityView];
            
            if([[responseDictionary valueForKey:@"status_message"] isEqualToString:@"Invalid Username Or Password"])
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
                
            }
            else
            {
                
                
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"id"] forKey:@"id"];
                
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"username"] forKey:@"username"];
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"password"] forKey:@"password"];
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"] forKey:@"profile_img"];
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"email"] forKey:@"email"];
                 [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"remember_status"] forKey:@"remember_status"];
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"email_verified_status"] forKey:@"email_verified_status"];
                
                if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"email_verified_status"] isEqual:@"0"])
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please check your email and verify your email id" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"RESEND", nil];
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
                        
//                        if ([[responseDictionary valueForKey:@"Demographic_Form_Group_Status"]integerValue] == 1)
//                         {
//                             FeedViewController  *pvc=[[FeedViewController alloc]init];
//                             [pvc setStr1:@"done"];
//                             [self.navigationController pushViewController:pvc animated:YES];
//                         }
//                         else
//                         {
                          
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
                              
                          //   }
 
                            }
                          
                     //                    else if ([[responseDictionary valueForKey:@"formupdationstatus"] integerValue]==0 || [[responseDictionary valueForKey:@"formupdationstatus"] isEqual:[NSNull null]])
                    //                     {
                    //                         Bs2ViewController *EVC=[[Bs2ViewController alloc]init];
                    //                         //[EVC setDetailstr:@"done"];
                    //                         [self.navigationController pushViewController:EVC animated:YES];
                    ////                         DemoGraphicViewController *EVC=[[DemoGraphicViewController alloc]init];
                    ////                         [self.navigationController pushViewController:EVC animated:YES];
                    //
                    //                     }
                    else
                    {
                        //[[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
                        
                            FeedViewController  *pvc=[[FeedViewController alloc]init];
                            [pvc setStr1:@"done"];
                            [self.navigationController pushViewController:pvc animated:YES];
                        
                        
                            //                    ViewController *myNewVC = [[ViewController alloc] init];
                            //                    [myNewVC setStr1:@"done"];
                            //
                            //                    myNewVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
                            //                    [self presentViewController:myNewVC animated:YES completion:nil];
                     }
                    
                }
                //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                //                [alert show];
            }
            
            
            
        }
        
        
        // [self callstorelocation];
        
    }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"userRegistrationViaGmail"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            //[self fetchContactsandAuthorization];
            // [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
            //DemographicFormStatus
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
                    
              
                //                else if ([[responseDictionary valueForKey:@"formupdationstatus"] integerValue]==0 || [[responseDictionary valueForKey:@"formupdationstatus"] isEqual:[NSNull null]])
                //                {
                //                    Bs2ViewController *EVC=[[Bs2ViewController alloc]init];
                //                    [self.navigationController pushViewController:EVC animated:YES];
                //
                //                }
                else
                {
                    //[activityIden startAnimating];
                    
                    Arr =[[NSMutableDictionary alloc]initWithDictionary:[responseDictionary valueForKey:@"data"]];
                    
//                    if ([[Arr valueForKey:@"is_phone_contact_import"] integerValue] == 0)
//                    {
//                        AllowContactViewController *pvc=[[AllowContactViewController alloc]init];
//                        [pvc setDetail:Arr];
//
//                        [self.navigationController pushViewController:pvc animated:YES];
//
//                    }
//                    else if ([Arr valueForKey:@"mobile_no"] == 0 || [[Arr valueForKey:@"mobile_no"] isEqualToString:@""])
//                    {
//
//                        EditViewController *EVC=[[EditViewController alloc]init];
//                        [self.navigationController pushViewController:EVC animated:YES];
//
//                    }
//                    else
//                    {
                   
                        FeedViewController *EVC=[[FeedViewController alloc]init];
                        [EVC setStr1:@"done"];
                        [self.navigationController pushViewController:EVC animated:YES];
                   // }
                    
                }
            }
            
            //            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"UserName"] forKey:@"UserName"];
            //            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"UserImage"] forKey:@"UserImage"];
            //            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"UserEmail"] forKey:@"UserEmail"];
            
            
            //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //            [alert show];
            
            
        }
        //[self callstorelocation];
    }
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            //hud.hidden=YES;
            // fetcharr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            //  [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"UserImage"] forKey:@"UserImage"];
            
            //_Usernamelbl.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"username"];
            //Arr =[[NSMutableDictionary alloc]initWithDictionary:[responseDictionary valueForKey:@"data"]];
            
            
            
            
        }
    }
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"email"])
    {
        
    }
    
}
-(void) processFailed :(NSError *)responseDictionary
{
    // ActivityIdenter.hidden=NO;
    [self.view hideActivityView];
    
    NSLog(@"error");
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"status_message" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //    [alert show];
    
}

- (IBAction)BackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    // [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)ApnsBtn:(id)sender {
    if([_ApnsBtnobj isSelected]==YES)
    {
        [_ApnsBtnobj setBackgroundImage:[UIImage imageNamed:@"icons8-full_moon.png"] forState:UIControlStateNormal];
        [_ApnsBtnobj setSelected:NO];
        
    }
    else
    {
        [_ApnsBtnobj setBackgroundImage:[UIImage imageNamed:@"icons8-ok_filled.png"] forState:UIControlStateSelected];
        [_ApnsBtnobj setSelected:YES];
    }
    
}
- (IBAction)AllowcontactBtn:(id)sender {
    if([_AllowcontactBtnobj isSelected]==YES)
    {
        
        [_AllowcontactBtnobj setBackgroundImage:[UIImage imageNamed:@"icons8-full_moon.png"] forState:UIControlStateNormal];
        [_AllowcontactBtnobj setSelected:NO];
        
    }
    else
    {
        // [self fetchContactsandAuthorization];
        
        [_AllowcontactBtnobj setBackgroundImage:[UIImage imageNamed:@"icons8-ok_filled.png"] forState:UIControlStateSelected];
        [_AllowcontactBtnobj setSelected:YES];
    }
    
}
- (IBAction)termsnconditionsBtn:(id)sender {
}

- (IBAction)LoginBtn:(id)sender {
    
    
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
        
    }
    
    
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    NSString *msg  = @"0";
    if([_userTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
    {
        msg = @"Please enter username";
        
        //        SCLAlertView *alert = [[SCLAlertView alloc] init];
        //
        //        UIColor *color = [UIColor colorWithRed:65.0/255.0 green:64.0/255.0 blue:144.0/255.0 alpha:1.0];
        //        [alert showCustom:self image:[UIImage imageNamed:@"git"] color:color title:@"Custom" subTitle:@"Add a custom icon and color for your own type of alert!" closeButtonTitle:@"OK" duration:0.0f];
    }
    else if (_passwordTF.text.length == 0 || [_passwordTF.text isEqualToString:@" "])
    {
        msg = @"Password field should not be empty!";
    }
    
    else if (_passwordTF.text.length < 4)
    {
        msg = @"Please enter valid password";
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

- (IBAction)helpBtn:(id)sender {
}

- (IBAction)ForgotBtn:(id)sender {
    ForgotViewController *Fvc=[[ForgotViewController alloc]init];
    
    [self.navigationController pushViewController:Fvc animated:YES];
}


- (IBAction)RetrieveusernameBtn:(id)sender {
    ForgotViewController *Fvc=[[ForgotViewController alloc]init];
   
    [Fvc setStr1:@"done"];
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
        
        // [self fetchContactsandAuthorization];
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
        {
//            MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
//            NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//            [dict setValue:@"email" forKey:@"name"];
//
//            NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
//            [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"email"] forKey:@"email"];
//
//            [webServiceManager setDelegateMethode:self];
//            [webServiceManager callMyWebServiceManager:@"resendMail" :dict :dict1];
        }
        
    }
    
}
- (IBAction)RememberbtnAction:(id)sender {
    if([_Rememberbtnobj isSelected]==YES)
    {
  //uncheck_60px.png
        _Rememberimg.image = [UIImage imageNamed:@"uncheck_60px.png"];
        rememberstr=@"0";
        [_Rememberbtnobj setSelected:NO];
        
    }
    else
    {
        _Rememberimg.image = [UIImage imageNamed:@"check_60px (1).png"];
        rememberstr=@"1";
        //check_60px (1).png
        [_Rememberbtnobj setSelected:YES];
       
    }
        
}
@end

