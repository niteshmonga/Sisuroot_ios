//
//  ForgotViewController.m
//  Root_App
//
//  Created by BRIJESH KUMAR on 15/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.

#import "ForgotViewController.h"
#import "LoginViewController.h"
#import "MyWebserviceManager.h"
#import "UIView+RNActivityView.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
@interface ForgotViewController ()

@end

@implementation ForgotViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //[textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    [_ForgotTF resignFirstResponder];
   
    
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [FIRAnalytics setScreenName:@"Forgot Password" screenClass:@"Forgot Password"];
    self.navigationController.navigationBar.hidden=YES;
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault];
    
    // Do any additional setup after loading the view from its nib.
    if ([_str1 isEqualToString:@"done"])
    {
        _Forgotstmtlbl.text=@"Retrieve Username";
        
       // [_ForgotBtnobj setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_ForgotBtnobj setTitle:@"Retrieve Username" forState:UIControlStateNormal];

     }
    else
    {
        _Forgotstmtlbl.text=@"Forgot Password";
        
    }
    _ForgotBtnobj.layer.cornerRadius=19;
    _ForgotBtnobj.clipsToBounds=YES;
    //_ForgotBtnobj.layer.borderWidth =1.0f;
    
    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) tapped:(UIGestureRecognizer *) sender
{
    [_ForgotTF resignFirstResponder];
}

- (IBAction)ForgotSubmitBtn:(id)sender {
    
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    NSString *msg  = @"0";
    
    if (_ForgotTF.text.length < 1)
    {
        msg = @"Please enter email address";
    }
    else if([emailTest evaluateWithObject:_ForgotTF.text] == NO)
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
        if ([_str1 isEqualToString:@"done"])
        {
            [self callRetriveusername];
        }
        else
        {
            [self callForgotService];
            
        }
    }
    
}


-(void)callRetriveusername
{
    [self.view showActivityViewWithLabel:@"Loading"];

    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"usernameRecover" forKey:@"name"];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:_ForgotTF.text forKey:@"email"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"usernameRecover" :dict :paramDict];
}

-(void)callForgotService
{
    [self.view showActivityViewWithLabel:@"Loading"];

    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"Forgot" forKey:@"name"];
    
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:_ForgotTF.text forKey:@"email"];
    
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"forgotPassword" :dict :paramDict];
    
    
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"Forgot"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];

            LoginViewController *Hgn= [[LoginViewController alloc]init];
            [self.navigationController pushViewController:Hgn animated:YES];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
           
            
        }
        else
        {
            [self.view hideActivityView];

            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        
    }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"usernameRecover"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];

            LoginViewController *Hgn= [[LoginViewController alloc]init];
            [self.navigationController pushViewController:Hgn animated:YES];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
           
          
        }
        else
        {
            [self.view hideActivityView];

            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
    
        }
    }
    
}
-(void) processFailed :(NSError *)responseDictionary
{
    // ActivityIdenter.hidden=NO;
    [self.view hideActivityView];

    NSLog(@"error");

    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
//    [alert show];
    
    
    
}
- (IBAction)BackBtn:(id)sender {
   
    [self.navigationController popViewControllerAnimated:YES];
}
@end

