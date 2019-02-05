//
//  ChangePasswordViewController.m
//  Root_App
//
//  Created by BRIJESH KUMAR on 15/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "MyWebserviceManager.h"
#import "LoginViewController.h"
#import "UIView+RNActivityView.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault];
    _SubmitBtnobj.layer.cornerRadius=19;
    _SubmitBtnobj.clipsToBounds=YES;
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
}
-(void) tapped:(UIGestureRecognizer *) sender
{
    [_OldpasswordTF resignFirstResponder];
    [_NewpasswordTF resignFirstResponder];
     [_ConfirmpassTF resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SubmitBtn:(id)sender {
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    NSString *msg  = @"0";
    if([_OldpasswordTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 4)
    {
        msg = @"Please enter current Password";
       
    }
    else if (_NewpasswordTF.text.length < 1 || [_NewpasswordTF.text isEqualToString:@" "])
    {
        msg = @"Please enter new password";
    }
    else if (_NewpasswordTF.text.length < 5)
    {
        msg = @"Please enter valid password";
    }
    else if (_ConfirmpassTF.text.length < 1 || [_NewpasswordTF.text isEqualToString:@" "])
    {
        msg = @"Please enter confirm password";
    }
    else  if (![_NewpasswordTF.text isEqualToString:_ConfirmpassTF.text])
    {
          msg = @"Password and confirm password do not match";
        
    }
    if (![msg isEqualToString:@"0"])
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
     else
    {
        [self callChangePswdService];
        
        
    }
    
}


-(void)callChangePswdService
{
//    ActivityIndicator.hidden=NO;
//    [ActivityIndicator startAnimating];
    [self.view showActivityViewWithLabel:@"Loading"];

    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"resetPassword" forKey:@"name"];
         //NSString *cust_mail =  [[NSUserDefaults standardUserDefaults] valueForKey:@"email"];
     NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
   // [paramDict setValue:cust_mail forKey:@"id"];
     [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];

    [paramDict setValue:  _OldpasswordTF.text forKey:@"oldpassword"];

    [paramDict setValue:_NewpasswordTF.text forKey:@"password"];
    [paramDict setValue:_ConfirmpassTF.text forKey:@"repassword"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"resetPassword" :dict :paramDict];
    
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
   // ActivityIndicator.hidden=YES;
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"resetPassword"])
    {
        NSLog(@"test...%@",responseDictionary);
        
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            [self.view hideActivityView];

            LoginViewController * hVC =[[LoginViewController  alloc]init];
            [hVC setChangebackstr:@"change"];
            [self.navigationController pushViewController:hVC animated:YES];
            
            UIAlertView *alert =   [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
            
            //            LoginViewController * hVC =[[LoginViewController  alloc]init];
            //            [self.navigationController pushViewController:hVC animated:YES];
            
            
        }
        else
        {
            [self.view hideActivityView];

            UIAlertView *alert =   [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
    }
    
}


-(void) processFailed :(NSError *)responseDictionary
{
    [self.view hideActivityView];

    NSLog(@"error");
    
//    NSString* ErrorResponse = [[NSString alloc] initWithData:(NSData *)responseDictionary.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",ErrorResponse);
//    NSData *objectData = [ErrorResponse dataUsingEncoding:NSUTF8StringEncoding];
//    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
//                                                         options:NSJSONReadingMutableContainers
//                                                           error:nil];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"status_message" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (IBAction)BackBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
