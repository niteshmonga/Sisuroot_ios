#import "SignupViewController.h"
#import "MyWebserviceManager.h"
#import "EditViewController.h"
#import <Contacts/Contacts.h>
#import <ContactsUI/CNContactViewController.h>
#import "ViewController.h"
#import <AddressBook/AddressBook.h>
#import "UIView+RNActivityView.h"
#import <AddressBookUI/AddressBookUI.h>
#import "SCLAlertView.h"
#import "DemoGraphicViewController.h"
#import "LoginViewController.h"
#import "CountryListViewController.h"
#import "UIView+Toast.h"
#import "FeedViewController.h"
#import "UIView+RNActivityView.h"

@interface SignupViewController ()
{
    NSMutableDictionary *Arr;
    NSMutableArray *arrayTableData;
    NSString *name;
    NSMutableArray *contact1;
    NSString *contacts;
    NSString *idstr;
    NSMutableArray *accountarr;
    NSMutableArray *contactarray;
    NSString *accounttype;
    NSMutableArray *codearr;
    NSString *codestr;
    NSMutableArray *countries;
    NSMutableArray *sortedCountries;
}
@end
@implementation SignupViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"Username" attributes:@{ NSForegroundColorAttributeName : [UIColor lightGrayColor] }];
    self.UserTF.attributedPlaceholder = str;
    NSAttributedString *str1 = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{ NSForegroundColorAttributeName : [UIColor lightGrayColor] }];
         self.EmailTF.attributedPlaceholder = str1;
      NSAttributedString *str2 = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{ NSForegroundColorAttributeName : [UIColor lightGrayColor] }];
         self.PasswordTF.attributedPlaceholder = str2;
    NSAttributedString *str3 = [[NSAttributedString alloc] initWithString:@"Confirm Password" attributes:@{ NSForegroundColorAttributeName : [UIColor lightGrayColor] }];
            self.confirmpassword.attributedPlaceholder = str3;
     self.UserTF.textColor = [UIColor whiteColor];
     self.EmailTF.textColor = [UIColor whiteColor];
     self.PasswordTF.textColor = [UIColor whiteColor];
     self.confirmpassword.textColor = [UIColor whiteColor];
    [FIRAnalytics setScreenName:@"SignUp" screenClass:@"SignUp"];
    [super viewDidLoad];
    _confmpass2.hidden =  YES;
    self.navigationController.navigationBar.hidden=YES;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    arrayTableData = [[NSMutableArray alloc]init];
    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
    [_confirmpassword addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [_UserTF resignFirstResponder];
    [_EmailTF resignFirstResponder];
    [_PasswordTF resignFirstResponder];
    return YES;
}

-(void)textFieldDidChange :(UITextField *) textField{
   if([_PasswordTF.text isEqualToString:_confirmpassword.text])
   {
       _confmpass2.hidden=false;
       _confmpass1.image= [UIImage imageNamed:@"Group 250.png"];
   }
    else  {
         _confmpass2.hidden=true;
         _confmpass1.image= [UIImage imageNamed:@"Group 249.png"];
     }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==self.UserTF)
    {
        [_EmailTF endEditing:YES];
        [_PasswordTF endEditing:YES];
    }
    else if(textField==_EmailTF)
    {
        [_UserTF endEditing:YES];
        [_PasswordTF endEditing:YES];
    }
    
    else if(textField==_PasswordTF)
    {
        [_UserTF endEditing:YES];
        [_EmailTF endEditing:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) tapped:(UIGestureRecognizer *) sender
{
    [_UserTF resignFirstResponder];
    [_EmailTF resignFirstResponder];
    [_PasswordTF resignFirstResponder];
}

- (IBAction)backBtn:(id)sender {
   [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)SignupBtn:(id)sender
{
    NSString *foo = _EmailTF.text;
    NSString *trimmed = [foo stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    _EmailTF.text=trimmed;
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    NSString *msg  = @"0";
    
    if([_UserTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
    {
        msg = @"Please enter username";
        
     }
    
    else if([Arr valueForKey:@"username"]==_UserTF.text)
    {
        msg =@"This username already in used";
        
    }
    else if (_EmailTF.text.length < 1)
    {
        msg = @"Please enter your email address";
        
    }
    else if([emailTest evaluateWithObject:_EmailTF.text] == NO)
    {
        msg = @"Please enter valid email address";
        
    }
    else if([Arr valueForKey:@"email_id"]==_EmailTF.text)
    {
        msg =@"This email address already in used";
    }
    else if (_PasswordTF.text.length == 0 || [_PasswordTF.text isEqualToString:@" "])
    {
        msg = @"Please enter password";
    }
    else if (_PasswordTF.text.length < 5)
    {
        msg = @"Please enter valid password";
    }
    else if (![_PasswordTF.text isEqualToString:_confirmpassword.text])
    {
        msg = @"Password not match";
    }
    if (![msg isEqualToString:@"0"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
      [self callSignupService];
    }
}

-(void)callSignupService
{
    [self.view showActivityViewWithLabel:@"Loading"];
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"userRegistration" forKey:@"name"];
 
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:_UserTF.text forKey:@"customerUsername"];
    [paramDict setValue:_EmailTF.text forKey:@"customerEmail"];
    [paramDict setValue:_PasswordTF.text forKey:@"customerPassword"];
     [paramDict setValue:@"" forKey:@"customermobile"];
    [paramDict setValue:@"" forKey:@"phonenum_country_code"];

    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"udid"] forKey:@"udid"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
   [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"userRegistration" :dict :paramDict];
    
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
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"userRegistration"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            if ( [[responseDictionary valueForKey:@"status_message"]  isEqualToString: @"Registration done!"]  )
            {
               [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"id"] forKey:@"id"];
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"username"] forKey:@"username"];
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"email"] forKey:@"email"];
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"password"] forKey:@"password"];
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"] forKey:@"profile_img"];
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"email"] forKey:@"email"];
                idstr=[[responseDictionary valueForKey:@"data"]valueForKey:@"id"];
          FeedViewController *EVC=[[FeedViewController alloc]init];
                [self.navigationController pushViewController:EVC animated:YES];
             }
        else
            {
                 [self.view hideActivityView];
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"userRegistrationViaGmail"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
             [self.view hideActivityView];
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"id"] forKey:@"id"];
            Arr =[[NSMutableDictionary alloc]initWithDictionary:[responseDictionary valueForKey:@"data"]];
            
//            if ([Arr valueForKey:@"mobile_no"] == 0 || [[Arr valueForKey:@"mobile_no"] isEqualToString:@""])
//            {
//                EditViewController *EVC=[[EditViewController alloc]init];
//                [self.navigationController pushViewController:EVC animated:YES];
//            }
//            else
//            {
                FeedViewController *pvc=[[FeedViewController alloc]init];
                [self.navigationController pushViewController:pvc animated:YES];
                
            //}
         }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
             [self.view hideActivityView];
             Arr =[[NSMutableDictionary alloc]initWithDictionary:[responseDictionary valueForKey:@"data"]];
        }
    }
}

-(void) processFailed :(NSError *)responseDictionary
{
    [self.view hideActivityView];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        NSLog(@"You have clicked Cancel");
        
        if(alertView.tag==2001)
        {
            LoginViewController *lvc=[[LoginViewController alloc]init];
            [self.navigationController pushViewController:lvc animated:YES];
        }
    }
    else if(buttonIndex == 1)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }
}
@end
