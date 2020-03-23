//
//  AllowContactViewController.m
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 14/09/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import "AllowContactViewController.h"
#import "MyWebserviceManager.h"
#import "EditViewController.h"
#import <Contacts/Contacts.h>
#import <ContactsUI/CNContactViewController.h>
#import "ViewController.h"
#import <Contacts/Contacts.h>
#import "LoginViewController.h"
#import <AddressBook/AddressBook.h>
#import "UIView+RNActivityView.h"
#import <AddressBookUI/AddressBookUI.h>

@interface AllowContactViewController ()
{
    NSMutableDictionary *Arr;
    NSMutableArray *arrayTableData;
    NSString *name;
    NSString *contacts;
    BOOL flag;
    NSMutableArray *contactarray;
}
@end

@implementation AllowContactViewController

- (void)viewDidLoad {
    
     [FIRAnalytics setScreenName:@"Allow Contact" screenClass:@"Allow Contact"];
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    activityIden.hidden=YES;
    
    flag=1;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    arrayTableData = [[NSMutableArray alloc]init];
    
    Arr =[[NSMutableDictionary alloc]initWithDictionary:_detail];
    
    _Access_conBtnobj.layer.cornerRadius=19;
    _Access_conBtnobj.clipsToBounds=YES;
    _Access_conBtnobj.layer.borderWidth =1;
    //_SignupBtnobj.layer.borderColor = [[UIColor colorWithRed:255.0f green:69.0f blue:58.0f alpha:1.0f] CGColor]; // Not actually silver
    _Access_conBtnobj.layer.borderColor = [[UIColor colorWithRed:(61.0/255.0)
                                                           green:(181.0/255.0)
                                                            blue:(230.0/255.0)
                                                           alpha:(1.0)] CGColor];
    
    
    _CancelBtnobj.layer.cornerRadius=19;
    _CancelBtnobj.clipsToBounds=YES;
    _CancelBtnobj.layer.borderWidth =1;
    //_SignupBtnobj.layer.borderColor = [[UIColor colorWithRed:255.0f green:69.0f blue:58.0f alpha:1.0f] CGColor]; // Not actually silver
    _CancelBtnobj.layer.borderColor = [[UIColor colorWithRed:(61.0/255.0)
                                                       green:(181.0/255.0)
                                                        blue:(230.0/255.0)
                                                       alpha:(1.0)] CGColor];
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)ApnsBtn:(id)sender {
    if([_ApnsBtnobj isSelected]==YES)
    {
        
        
        _apnsimg.image = [UIImage imageNamed:@"icons8-full_moon.png"];
        [_ApnsBtnobj setSelected:NO];
        
    }
    else
    {
        _apnsimg.image = [UIImage imageNamed:@"icons8-ok_filled.png"];
        [_ApnsBtnobj setSelected:YES];
    }
    
}
- (IBAction)AllowcontactBtn:(id)sender {
    
    if([_AllowcontactBtnobj isSelected]==YES)
    {
        _contactimg.image = [UIImage imageNamed:@"icons8-full_moon.png"];
        
        [_AllowcontactBtnobj setSelected:NO];
        
    }
    else
    {
        //[self fetchContactsandAuthorization];
        
        _contactimg.image = [UIImage imageNamed:@"icons8-ok_filled.png"];
        
        [_AllowcontactBtnobj setSelected:YES];
    }
    
}
- (IBAction)termsnconditionsBtn:(id)sender {
}

- (IBAction)AccessconBtn:(id)sender {
    
    if([_AllowcontactBtnobj isSelected]==YES)
    {
        [self fetchContactsandAuthorization];

        //        activityIden.hidden=NO;
        
        //        [activityIden startAnimating];
        
        if ([Arr valueForKey:@"mobile_no"] == 0 || [[Arr valueForKey:@"mobile_no"] isEqualToString:@""])
        {
            //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"edit" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //            [alert show];
            EditViewController *EVC=[[EditViewController alloc]init];
            [self.navigationController pushViewController:EVC animated:YES];
            [self.view hideActivityView];

        }
        else
        {
            ViewController *EVC=[[ViewController alloc]init];
            [EVC setStr1:@"done"];
            [self.navigationController pushViewController:EVC animated:YES];
            [self.view hideActivityView];

        }
     }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please allow for Access contacts" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
        
    }
    
    
}
- (IBAction)CancelBtn:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"id"];
    
    // SWRevealViewController *revealController = [self revealViewController];
    //  [[NSUserDefaults standardUserDefaults] setValue:@"0" forKey:@"contact_status"];
    
    LoginViewController *LVC=[[LoginViewController alloc]init];
    // UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
    [self.navigationController pushViewController:LVC animated:YES];
    
}
//-(void)callstorecontact
//{
//    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//    [dict setValue:@"userPhoneImport" forKey:@"name"];
//
//    //    NSString *name;
//    //    NSString *contact;
//
//
//    //    for (int i =0; i < arrayTableData.count ; i++)
//    //    {
//    //        if (i == 0)
//    //        {
//    //            name = [[arrayTableData objectAtIndex:i] valueForKey:@"fullName"];
//    //            contact = [[arrayTableData objectAtIndex:i] valueForKey:@"PhoneNumbers"];
//    //
//    //        }
//    //        else
//    //        {
//    //            name = [NSString stringWithFormat:@"%@,%@",name,[[arrayTableData objectAtIndex:i] valueForKey:@"fullName"]];
//    //            contact = [NSString stringWithFormat:@"%@,%@",contact,[[arrayTableData objectAtIndex:i] valueForKey:@"PhoneNumbers"]];
//    //
//    //        }
//
//    NSLog(@"%@",name);
//    NSLog(@"%@",contacts);
//
//
//    //}
//    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
//    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
//
//    [paramDict setObject:name forKey:@"name"];
//    [paramDict setObject:contacts forKey:@"phone_number"];
//
//
//    [webServiceManager setDelegateMethode:self];
//    [webServiceManager callMyWebServiceManager:@"userPhoneImport" :dict :paramDict];
//
//
//}
-(void) processFailed :(NSError *)responseDictionary
{
    [self.view hideActivityView];
    NSLog(@"error");
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"userPhoneImport"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            [self.view hideActivityView];

            
            
        }
        else
        {
            //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //        [alert show];
            
            
            //LeftMenuViewController *uvc=[[LeftMenuViewController alloc]init];
            //            uvc.logout.hidden=NO;
            //            uvc.Login.hidden=YES;
            
        }
        
        
    }
    
}
-(void)callstorecontact
{
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"userPhoneImport" forKey:@"name"];
     NSString *nameStr;
    NSString *mobileStr;
    for (int i = 0; i<contactarray.count; i++)
    {
        if (i == 0 )
        {
            nameStr = [[contactarray objectAtIndex:i] valueForKey:@"name"];
            mobileStr = [[contactarray objectAtIndex:i] valueForKey:@"mobile"];
            
        }
        else
        {
            nameStr  = [NSString stringWithFormat:@"%@,%@",nameStr, [[contactarray objectAtIndex:i] valueForKey:@"name"]];
            mobileStr  = [NSString stringWithFormat:@"%@,%@",mobileStr, [[contactarray objectAtIndex:i] valueForKey:@"mobile"]];
        }
    }
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [paramDict setObject:nameStr forKey:@"name"];
    [paramDict setObject:mobileStr forKey:@"contact"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"import" :dict :paramDict];
    
    
}
-(void)fetchContactsandAuthorization
{
    
    [self.view showActivityViewWithLabel:@"Loading"];

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
        UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"message!" message:@"please enable contact privacy setting" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertcrp addButtonWithTitle:@"Ok "];
        [alertcrp show];
    }
    
}



- (void)getContactsWithAddressBook:(ABAddressBookRef )addressBook {
    arrayTableData = [[NSMutableArray alloc] init];
    
    // CFArrayRef allPeople1 = ABAddressBookCopyArrayOfAllPeople(addressBook);
    
    
    //    CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
    //    CFIndex nPeople1 = ABAddressBookGetPersonCount(addressBook);
    
    CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(addressBook);
    NSLog(@"%@",people);
    CFIndex nPeople = ABAddressBookGetPersonCount(addressBook);
    
    for(int i=0; i<nPeople; i++)
    {
        //        int peopleCount = CFArrayGetCount(people);
        //        CFErrorRef *error = nil;
        //        for (int i = 0; i < peopleCount; i++)
        //        {
        //ABRecordRef person = CFArrayGetValueAtIndex(people, i);
        // error = nil;
        // ABAddressBookRemoveRecord(addressBook, person, error);
        
        // if (i <=1000)
        {
            NSMutableDictionary *contacName = [[NSMutableDictionary alloc] init];
            
            ABRecordRef person=CFArrayGetValueAtIndex(people, i);
            
            ABMultiValueRef multi = ABRecordCopyValue(person, kABPersonPhoneProperty);
            for (CFIndex j=0; j < ABMultiValueGetCount(multi); j++)
            {
                
                
                NSString* phone = [NSString stringWithFormat:@"%@",ABMultiValueCopyValueAtIndex(multi, j)];
                
                NSLog(@"nitesh test");
                
                NSLog(@"%@",phone);
                
                
                [contacName setObject:phone forKey:@"mobile"];
            }
            
            
            NSString *nameString1 = [NSString stringWithFormat:@"%@ ",ABRecordCopyValue(person, kABPersonSortByFirstName)];
            NSString *nameString2 = [NSString stringWithFormat:@" %@",ABRecordCopyValue(person, kABPersonSortByLastName)];
            
            NSString *nameString3=[nameString1 stringByAppendingString: nameString2];
            [contacName setObject:nameString3 forKey:@"name"];
            if (![nameString isEqualToString:@"(null)"])
            {
                [arrayTableData addObject:contacName];
                
                NSSortDescriptor *sortDescriptor;
                sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                             ascending:YES];
                contactarray = [arrayTableData sortedArrayUsingDescriptors:@[sortDescriptor]];
                
            }
            
            name=[contactarray valueForKey:@"name"];
            
            contacts=[contactarray valueForKey:@"mobile"];
            
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
        //       SignupViewController *lvc=[[SignupViewController alloc]init];
        //        [self.navigationController pushViewController:lvc animated:YES];
    }
    else if(buttonIndex == 1)
    {

        // [self fetchContactsandAuthorization];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];


    }
}

@end

