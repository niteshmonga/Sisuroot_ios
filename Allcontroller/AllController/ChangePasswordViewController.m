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
#import "GraphView.h"
#import "chattypeViewController.h"
#import "GraphView1.h"
#import "FeedViewController.h"
#import "smilepage1ViewController.h"
#import "SWRevealViewController.h"
#import "Sisuroot-Swift.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController
- (IBAction)btn_chat:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
      [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btnyoy:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btn_qa:(id)sender {
    smilepage1ViewController *VC1=[[smilepage1ViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)BTN_HOME:(id)sender {
    FeedViewController *VC1=[[FeedViewController alloc]init];
       [self.navigationController pushViewController:VC1 animated:YES];
}

-(void)textFieldDidChange :(UITextField *) textField{
   if([_NewpasswordTF.text isEqualToString:_ConfirmpassTF.text])
   {
       _confmpass2.hidden=false;
       _confmpass1.image= [UIImage imageNamed:@"Group 250.png"];
   }
    else  {
         _confmpass2.hidden=true;
         _confmpass1.image= [UIImage imageNamed:@"Group 249.png"];
     }
}

- (IBAction)memubtn:(id)sender {
    
    SWRevealViewController *sw=[[SWRevealViewController alloc]init];
   sw.tabBarItem.enabled=NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad {
    _view_alert.hidden=YES;
    [super viewDidLoad];
    _confmpass2.hidden =  YES;
    _view11.layer.cornerRadius=10;
    _view11.clipsToBounds=YES;
      [_ConfirmpassTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
      
    NSAttributedString *str1 = [[NSAttributedString alloc] initWithString:@"Old Password" attributes:@{ NSForegroundColorAttributeName : [UIColor lightGrayColor] }];
         self.OldpasswordTF.attributedPlaceholder = str1;
      NSAttributedString *str2 = [[NSAttributedString alloc] initWithString:@"New Password" attributes:@{ NSForegroundColorAttributeName : [UIColor lightGrayColor] }];
         self.NewpasswordTF.attributedPlaceholder = str2;
    NSAttributedString *str3 = [[NSAttributedString alloc] initWithString:@"Confirm Password" attributes:@{ NSForegroundColorAttributeName : [UIColor lightGrayColor] }];
            self.ConfirmpassTF.attributedPlaceholder = str3;
    
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
          graphView.backgroundColor = [UIColor clearColor];
          GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
          graphView1.backgroundColor = [UIColor clearColor];
          [self.view_footer1 addSubview:graphView];
          [self.view_footer2 addSubview:graphView1];
    self.navigationController.navigationBar.hidden=YES;
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault];
    _SubmitBtnobj.layer.cornerRadius=19;
    _SubmitBtnobj.clipsToBounds=YES;
    // Do any additional setup after loading the view from its nib.
    SWRevealViewController *revealController = [self revealViewController];
      revealController.panGestureRecognizer.enabled = YES;
        revealController.tapGestureRecognizer.enabled=YES;
      [revealController panGestureRecognizer];
      [revealController tapGestureRecognizer];
      
      [ _revealmenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    
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
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu{
    self.navigationController.navigationBar.hidden=YES;
    return NO;
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
- (IBAction)btn_cancel_alert:(id)sender {
    _view_alert.hidden=YES;
    
}
- (IBAction)btn_done_alert:(id)sender {
    LoginViewController * hVC =[[LoginViewController  alloc]init];
    [self.navigationController pushViewController:hVC animated:YES];
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
            _view_alert.hidden=NO;
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
