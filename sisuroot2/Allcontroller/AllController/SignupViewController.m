
#import "SignupViewController.h"
#import "ProfileViewController.h"
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
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
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
}

@end

@implementation SignupViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    activityIden.hidden=YES;
    _pickerviewobj.hidden=YES;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    arrayTableData = [[NSMutableArray alloc]init];
    accountarr = [[NSMutableArray alloc]initWithObjects:@"Free version",@"Standard account",@"Premium account", nil];
    
    
    _SignupBtnobj.layer.cornerRadius=19;
    _SignupBtnobj.clipsToBounds=YES;
    _SignupBtnobj.layer.borderWidth =1;
    //_SignupBtnobj.layer.borderColor = [[UIColor colorWithRed:255.0f green:69.0f blue:58.0f alpha:1.0f] CGColor]; // Not actually silver
    _SignupBtnobj.layer.borderColor = [[UIColor colorWithRed:(61/255.0)
                                                       green:(181/255.0)
                                                        blue:(230/255.0)
                                                       alpha:(1.0)] CGColor];
    _GmailBtnobj.layer.cornerRadius=19;
    _GmailBtnobj.clipsToBounds=YES;
    //
    //    [[GIDSignIn sharedInstance] signOut];
    //    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    //    signIn.uiDelegate = self;
    //    signIn.delegate = self;
    
    // [self callfetchprofile];
    //   [self.UserTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    //    [self.EmailTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    //    [self.PasswordTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
    
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    [_UserTF resignFirstResponder];
    [_EmailTF resignFirstResponder];
    [_PasswordTF resignFirstResponder];
    [_accountTF resignFirstResponder];
    [_mobileTF resignFirstResponder];
    
    
    
    return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==self.UserTF)
    {
        _pickerviewobj.hidden=YES;
         [_accountTF endEditing:YES];
        [_EmailTF endEditing:YES];
        [_PasswordTF endEditing:YES];
        [_mobileTF endEditing:YES];
    }
    else if(textField==_EmailTF)
    {
        _pickerviewobj.hidden=YES;
        [_accountTF endEditing:YES];
        [_UserTF endEditing:YES];
        [_PasswordTF endEditing:YES];
        [_mobileTF endEditing:YES];
    }
    
    else if(textField==_PasswordTF)
    {
        _pickerviewobj.hidden=YES;
        [_accountTF endEditing:YES];
        [_UserTF endEditing:YES];
        [_EmailTF endEditing:YES];
        [_mobileTF endEditing:YES];
    }
    else if(textField==self.mobileTF)
    {
        _pickerviewobj.hidden=YES;
        [_accountTF endEditing:YES];
        [_UserTF endEditing:YES];
        [_EmailTF endEditing:YES];
        [_PasswordTF endEditing:YES];
    }
    else if(textField==self.accountTF)
    {
        _pickerviewobj.hidden=NO;
        _accountTF.text=@"Free version";
        [_mobileTF endEditing:YES];
        [_UserTF endEditing:YES];
        [_EmailTF endEditing:YES];
        [_PasswordTF endEditing:YES];
        [_accountTF endEditing:YES];

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
    [_mobileTF resignFirstResponder];
    _pickerviewobj.hidden=YES;
}

- (IBAction)backBtn:(id)sender {
    // [self dismissViewControllerAnimated:YES completion:nil];
    
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
    NSString *laxString1 =@"^[7-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]";
    
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    //NSPredicate *emailTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", laxString1];
    NSString *phoneRegex = @"^[\+(00)][0-9]{6,14}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    NSString *msg  = @"0";
    
    if([_UserTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
    {
        msg = @"Please enter username";
     
    }
    
    else if([Arr valueForKey:@"username"]==_UserTF.text)
    {
        msg =@"This username already in used";
        
    }
    
    //    else if([Arr valueForKey:@"username"]==_UserTF.text)
    //    {
    //        msg =@"This username already taken";
    //    }
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
    else if (_mobileTF.text.length < 1)
    {
        msg = @"Please enter mobile number";
    }
    else if (_mobileTF.text.length < 10 || _mobileTF.text.length > 10)
    {
         msg = @"Please enter valid mobile number";
        
    }
    else if([phoneTest evaluateWithObject:_mobileTF.text])
    {
        msg =@"Please enter your valid mobile number";
        
    }
    
    if (![msg isEqualToString:@"0"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        if([_AllowcontactBtnobj isSelected]==YES)
        {
            [self callSignupService];
 
        }
    else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please allow for Access contacts" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
        }
    }
    
    
    
}

//-(void)callGoogleMethode :(NSDictionary *)responseObject
//{
//    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//    [dict setValue:@"userRegistrationViaGmail" forKey:@"name"];
//
//
//    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
//    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];

//    [paramDict setValue:[responseObject valueForKey:@"name"] forKey:@"name"];
//    [paramDict setValue:[responseObject valueForKey:@"email"] forKey:@"email"];
//    [paramDict setValue:[responseObject valueForKey:@"email_verified"] forKey:@"email_verified"];
//    [paramDict setValue:[responseObject valueForKey:@"picture"] forKey:@"picture"];
//    [paramDict setValue:[responseObject valueForKey:@"profile"] forKey:@"profile"];
//    [paramDict setValue:[responseObject valueForKey:@"family_name"] forKey:@"family_name"];
//    [paramDict setValue:[responseObject valueForKey:@"given_name"] forKey:@"given_name"];
//    [paramDict setValue:[responseObject valueForKey:@"gender"] forKey:@"gender"];
//    [paramDict setValue:[responseObject valueForKey:@"sub"] forKey:@"sub"];
//    [paramDict setValue:[responseObject valueForKey:@"locale"] forKey:@"locale"];
//
//    [webServiceManager setDelegateMethode:self];
//    [webServiceManager callMyWebServiceManager:@"userRegistrationViaGmail" :dict :paramDict];
//
//}

-(void)callSignupService
{
   // [self.view showActivityViewWithLabel:@"Loading"];

    if ([_accountTF.text isEqualToString:@"Free version"])
    {
        
        accounttype=@"0";
    }
    else if([_accountTF.text isEqualToString:@"Standard account"])
    {
        accounttype=@"1";

    }
    else if([_accountTF.text isEqualToString:@"Premium account"])
    {
        accounttype=@"2";

    }
    
   // [self.view showActivityViewWithLabel:@"Loading"];
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"userRegistration" forKey:@"name"];
    
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:_UserTF.text forKey:@"customerUsername"];
    [paramDict setValue:_EmailTF.text forKey:@"customerEmail"];
    [paramDict setValue:_PasswordTF.text forKey:@"customerPassword"];
    [paramDict setValue:_mobileTF.text forKey:@"customermobile"];
   
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"udid"] forKey:@"udid"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
    [paramDict setValue:accounttype forKey:@"AccountType"];

    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"userRegistration" :dict :paramDict];
    
}
-(void)callfetchprofile
{
    
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
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"userRegistration"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            [self.view hideActivityView];
            
 
            
            // Arr =[[NSMutableDictionary alloc]initWithDictionary:[responseDictionary valueForKey:@"data"]];
            
            if ( [[responseDictionary valueForKey:@"status_message"]  isEqualToString: @"Registration done!"]  )
            {
                
                
                
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"id"] forKey:@"id"];
                
                
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"username"] forKey:@"username"];
                
                  [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"email"] forKey:@"email"];
                
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"password"] forKey:@"password"];
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"] forKey:@"profile_img"];
                [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"email"] forKey:@"email"];
                idstr=[[responseDictionary valueForKey:@"data"]valueForKey:@"id"];
                [self fetchContactsandAuthorization];
                
                
                //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                //                [alert show];
                
                if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"email_verified_status"] isEqual:@"0"])
                {
                    
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"SISUROOT"
                                                                        message:@"Please check your email and verify your email address"
                                                                       delegate:self
                                                              cancelButtonTitle:@"OK"
                                                              otherButtonTitles:nil, nil];
                    
                    alertView.tag = 2001;
                    [alertView show];
                    
                    
                }
                
                else
                {
                    LoginViewController *EVC=[[LoginViewController alloc]init];
                    // [EVC setStrhome:@"demostr"];
                    [self.navigationController pushViewController:EVC animated:YES];
                }
                
                
            }
            
            else
            {
                 [self.view hideActivityView];
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
                //               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                //               [alert show];
                //               EditViewController *EVC=[[EditViewController alloc]init];
                //               [self.navigationController pushViewController:EVC animated:YES];
                //if([[responseDictionary valueForKey:@"data"] valueForKey:@"id"] !=0)
            }
            //ProfileViewController *pvc=[[ProfileViewController alloc]init];
            //[self.navigationController pushViewController:pvc animated:YES];
            
            
            
        }
        //       else
        //       {
        //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        //            [alert show];
        //
        
        // }
        
        
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"userRegistrationViaGmail"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
             [self.view hideActivityView];
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"id"] forKey:@"id"];
            Arr =[[NSMutableDictionary alloc]initWithDictionary:[responseDictionary valueForKey:@"data"]];
            
            if ([Arr valueForKey:@"mobile_no"] == 0 || [[Arr valueForKey:@"mobile_no"] isEqualToString:@""])
            {
                EditViewController *EVC=[[EditViewController alloc]init];
                [self.navigationController pushViewController:EVC animated:YES];
            }
            else
            {
                ProfileViewController *pvc=[[ProfileViewController alloc]init];
                [self.navigationController pushViewController:pvc animated:YES];
                
            }
            
         }
        
    }
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
             [self.view hideActivityView];
            //hud.hidden=YES;
            // fetcharr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            //  [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"UserImage"] forKey:@"UserImage"];
            
            //_Usernamelbl.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"username"];
            Arr =[[NSMutableDictionary alloc]initWithDictionary:[responseDictionary valueForKey:@"data"]];
            
        }
    }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"userPhoneImport"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
             [self.view hideActivityView];
            
        }
        else
        {
            //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //            [alert show];
            
            
            //LeftMenuViewController *uvc=[[LeftMenuViewController alloc]init];
            //            uvc.logout.hidden=NO;
            //            uvc.Login.hidden=YES;
            
        }
    }
}




-(void) processFailed :(NSError *)responseDictionary
{
    [self.view hideActivityView];
    
    // ActivityIdenter.hidden=NO;
    NSLog(@"%@",responseDictionary);
    
    NSLog(@"error");
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Error" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //    [alert show];
    
    
}

- (IBAction)GmailBtnAction:(id)sender {
    
    //    [GIDSignIn sharedInstance].uiDelegate = self;
    //    [GIDSignIn sharedInstance].delegate = self;
    //    [[GIDSignIn sharedInstance]signOut];
    //    [[GIDSignIn sharedInstance]signIn];
    //    [self fetchContactsandAuthorization]
}


-(void)callstorecontact
{
   // [self.view showActivityViewWithLabel:@"Loading"];
    
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"userPhoneImport" forKey:@"name"];
    
    
    NSString *nameStr;
    NSString *mobileStr;
    
    for (int i = 0; i<contactarray.count; i++)
    {
        if (i == 0 )
        {
            //            nameStr = [[contactarray objectAtIndex:i] valueForKey:@"name"];
            //            mobileStr = [[contactarray objectAtIndex:i] valueForKey:@"mobile"];
            
            nameStr=[nameStr stringByAppendingString:@";"];
            nameStr  = [NSString stringWithFormat:@"%@,%@", [[contactarray objectAtIndex:i] valueForKey:@"name"],[[contactarray objectAtIndex:i] valueForKey:@"mobile"]];
            
        }
        else
        {
            //            nameStr  = [NSString stringWithFormat:@"%@,%@",nameStr, [[contactarray objectAtIndex:i] valueForKey:@"name"]];
            //            mobileStr  = [NSString stringWithFormat:@"%@,%@",mobileStr, [[contactarray objectAtIndex:i] valueForKey:@"mobile"]];
            
            nameStr=[nameStr stringByAppendingString:@";"];
            
            nameStr  = [NSString stringWithFormat:@"%@ %@,%@",nameStr, [[contactarray objectAtIndex:i] valueForKey:@"name"],[[contactarray objectAtIndex:i] valueForKey:@"mobile"]];
        }
    }
    
    //}
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [paramDict setObject:nameStr forKey:@"name"];
    //[paramDict setObject:mobileStr forKey:@"contact"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"import" :dict :paramDict];
    
}

//- (UIStatusBarStyle)preferredStatusBarStyle {

//    return UIStatusBarStyleDefault;
//}

-(void)fetchContactsandAuthorization
{
    
    
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    // ABAddressBookRef addressBook = ABAddressBookCreate();
    
    __block BOOL accessGranted = NO;
    
    if (&ABAddressBookRequestAccessWithCompletion != NULL) { // We are on iOS 6
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            accessGranted = granted;
            dispatch_semaphore_signal(semaphore);
        });
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    }
    else
    { // We are on iOS 5 or Older
        accessGranted = YES;
        [self getContactsWithAddressBook:addressBook];
    }
    
    if (accessGranted)
    {
        [self getContactsWithAddressBook:addressBook];
    }
    else if (accessGranted==NO)
    {
        UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUROOT" message:@"please enable contact privacy setting" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertcrp addButtonWithTitle:@"Ok "];
        [alertcrp show];
    }
    
}



- (void)getContactsWithAddressBook:(ABAddressBookRef )addressBook {
    
    
    arrayTableData = [[NSMutableArray alloc] init];
    
    
    CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(addressBook);
    // NSLog(@"%@",people);
    CFIndex nPeople = ABAddressBookGetPersonCount(addressBook);
    
    
    for(int i=0; i<nPeople; i++)
    {
        
        {
            NSString *name1;
            NSString *contact1;
            NSMutableDictionary *contacName = [[NSMutableDictionary alloc] init];
            
            ABRecordRef person=CFArrayGetValueAtIndex(people, i);
            
            ABMultiValueRef multi = ABRecordCopyValue(person, kABPersonPhoneProperty);
            for (CFIndex j=0; j < ABMultiValueGetCount(multi); j++)
            {
                
                NSString* phone = [NSString stringWithFormat:@"%@",ABMultiValueCopyValueAtIndex(multi, j)];
                contact1=phone;
                // NSLog(@"nitesh test"); [nitesh monga],8588079787;[nitesh new],701182717
                
                // NSLog(@"%@",phone);
                
                
                [contacName setObject:phone forKey:@"mobile"];
                
                
                
            }
            
            NSString *nameString1 = [NSString stringWithFormat:@"%@ ",ABRecordCopyValue(person, kABPersonSortByFirstName)];
            NSString *nameString2 = [NSString stringWithFormat:@" %@",ABRecordCopyValue(person, kABPersonSortByLastName)];
            
            NSString *nameString3=[nameString1 stringByAppendingString: nameString2];
            
            // nameString3=[nameString3 stringByAppendingString:nameString2];
            
            [contacName setObject:nameString3 forKey:@"name"];
            if (![nameString isEqualToString:@"(null)"])
            {
                [arrayTableData addObject:contacName];
                
                NSSortDescriptor *sortDescriptor;
                sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                             ascending:YES];
                contactarray = [arrayTableData sortedArrayUsingDescriptors:@[sortDescriptor]];
                
                name=[contactarray valueForKey:@"name"];
                // name = [name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                //[[name stringByReplacingOccurrencesOfString:@"(" withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
                
                contacts=[contactarray valueForKey:@"mobile"];
                //contacts = [contacts stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                //[[contacts stringByReplacingOccurrencesOfString:@"(" withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
                
                
                
                
                
            }
            else if([nameString isEqualToString:@"(null)"] || [nameString isEqualToString:@""])
            {
                name=@"";
                contacts=@"";
            }
            
            //            name=[contactarray valueForKey:@"name"];
            //
            //            contacts=[contactarray valueForKey:@"mobile"];
            
            //  [_contactList addObject:contacName];
            
        }
    }
    
    [self callstorecontact];
    
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
        
        // [self fetchContactsandAuthorization];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        
    }
    
}
- (IBAction)ApnsBtn:(id)sender {
    if([_ApnsBtnobj isSelected]==YES)
    {
        _apnsimg.image = [UIImage imageNamed:@"circle2.png"];
        [_ApnsBtnobj setSelected:NO];
        
    }
    else
    {
        _apnsimg.image = [UIImage imageNamed:@"circle1.png"];
        [_ApnsBtnobj setSelected:YES];
    }
    
}
- (IBAction)AllowcontactBtn:(id)sender {
    if([_AllowcontactBtnobj isSelected]==YES)
    {
        _contactimg.image = [UIImage imageNamed:@"circle2.png"];
        
        [_AllowcontactBtnobj setSelected:NO];
        
    }
    else
    {
        _contactimg.image = [UIImage imageNamed:@"circle1.png"];
        
        [_AllowcontactBtnobj setSelected:YES];
    }
    
}


- (IBAction)termsnconditionsBtn:(id)sender {
}

-(void)callvalidateemrnumber
{
    [self.view showActivityViewWithLabel:@"Loading"];

    NSString *i=_mobileTF.text;
    NSString *j =[NSString stringWithFormat:@"%d%@",+1,i];
    i=j;
    NSString *url1 = @"http://apilayer.net/api/validate?access_key=5e4b227c69d89a6d252e69a7dfaf8cdf&number=";
    NSString *mainUrl=[url1 stringByAppendingString:i];
    
    //    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    
    NSURL *url = [NSURL URLWithString:mainUrl];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
         NSLog(@"%@",dictionary);
         if ([[dictionary valueForKey:@"valid"] integerValue]==1)
         {
             [self callSignupService];
             
         }
         else
         {
             UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"This number not valid" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             dispatch_async(dispatch_get_main_queue(), ^{
                 [alertview show];
             });
             
         }
     }];
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [accountarr count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [accountarr objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _accountTF.text=[accountarr objectAtIndex:row];
    
    //    if(pickerView == firstPickerView)
    //    {
    //        NSString *strFirstPickerView = [yourarray objectAtIndex:row];
    //    }
    //    else if(pickerView == secondPickerView)
    //    {
    //        NSString *strSecondPickerView = [yourarray objectAtIndex:row];
    //    }
    //    else
    //    {
    //        NSString *strThirdPickerView = [yourarray objectAtIndex:row];
    //    }
}










@end
