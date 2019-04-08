//
//  DemoGraphicViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 02/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "DemoGraphicViewController.h"
#import "EditViewController.h"
#import "MyWebserviceManager.h"
#import "ViewController.h"
#import "FeedViewController.h"
#import "SelectContactViewController.h"
#import "FriendsViewController.h"

@interface DemoGraphicViewController ()
{
    NSMutableArray *accountarr;
}
@end

@implementation DemoGraphicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [FIRAnalytics setScreenName:@"Demographic Form" screenClass:@"Demographic Form"];
    //_view1obj.hidden=YES;
    self.navigationController.navigationBar.hidden=YES;

    _view2obj.hidden=YES;
    _SavenNextBtnobj.layer.cornerRadius=21;
    _SavenNextBtnobj.clipsToBounds=YES;
    _SandvBtnobj.layer.cornerRadius=21;
    _SandvBtnobj.clipsToBounds=YES;
    _scrollViewObj.contentSize = CGSizeMake(375, 467);
    
    _pickerviewobj.hidden=YES;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
     accountarr = [[NSMutableArray alloc]initWithObjects:@"High School",@"Intermediate",@"Graduate",@"Post Graduate", nil];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    
    // Do any additional setup after loading the view from its nib.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //[textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];

    return YES;
}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    [_AgeTF resignFirstResponder];
    [_GoschoolTF resignFirstResponder];
    [_SchoollevelTF resignFirstResponder];
    [_unemploidTF resignFirstResponder];
    [_IncomeTF resignFirstResponder];
    [_EthnicityTF resignFirstResponder];
    [_GenderTF resignFirstResponder];
    [_EmergencyTF resignFirstResponder];
    [_emergencynemeTF resignFirstResponder];
    [_heightTF resignFirstResponder];
    [_weightTF resignFirstResponder];
    _pickerviewobj.hidden=YES;
    
    
    return YES;
}

  // Do any additional setup after loading the view.

 -(void)hideKeyboard
{
    [_AgeTF resignFirstResponder];
    [_GoschoolTF resignFirstResponder];
    [_SchoollevelTF resignFirstResponder];
    [_unemploidTF resignFirstResponder];
    [_IncomeTF resignFirstResponder];
    [_EthnicityTF resignFirstResponder];
    [_GenderTF resignFirstResponder];
    [_EmergencyTF resignFirstResponder];
    [_emergencynemeTF resignFirstResponder];
    [_heightTF resignFirstResponder];
    [_weightTF resignFirstResponder];
    _pickerviewobj.hidden=YES;

    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==self.AgeTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
        // [_UserTF endEditing:YES];
        _pickerviewobj.hidden=YES;

        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [_unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];

        [ _GenderTF endEditing:YES];
        [ _EmergencyTF endEditing:YES];
        [ _emergencynemeTF endEditing:YES];

        [ _heightTF endEditing:YES];
        [ _weightTF endEditing:YES];
        //[_UserTF resignFirstResponder];
        
    }
    
    else if(textField==_GoschoolTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
        [_AgeTF endEditing:YES];
        _pickerviewobj.hidden=YES;
        
       // [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [_unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        
        [ _GenderTF endEditing:YES];
        [ _EmergencyTF endEditing:YES];
        [ _emergencynemeTF endEditing:YES];
        
        [ _heightTF endEditing:YES];
        [ _weightTF endEditing:YES];

        //  [ _MobileTF endEditing:YES];
    }
    
    else if (textField==self.SchoollevelTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 40)animated:YES];
        
        _pickerviewobj.hidden=NO;
         [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        [ _SchoollevelTF endEditing:YES];

        [ _GenderTF endEditing:YES];
        [ _EmergencyTF endEditing:YES];
        [ _heightTF endEditing:YES];
        [ _weightTF endEditing:YES];
        // [_EmailTF resignFirstResponder];
        [ _emergencynemeTF endEditing:YES];

        
        
    }
    else if(textField == _IncomeTF)
    {
        _pickerviewobj.hidden=YES;

         [self.scrollViewObj setContentOffset:CGPointMake(0, 60)animated:YES];
        
        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _unemploidTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        
        [ _GenderTF endEditing:YES];
        [ _EmergencyTF endEditing:YES];
        [ _emergencynemeTF endEditing:YES];
        [ _heightTF endEditing:YES];
        [ _weightTF endEditing:YES];
        // [_EmailTF resignFirstResponder];
        [ _emergencynemeTF endEditing:YES];
    }
    
    else if(textField == _weightTF)
    {
        
         [self.scrollViewObj setContentOffset:CGPointMake(0, 75)animated:YES];
        _pickerviewobj.hidden=YES;

        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _unemploidTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        [ _GenderTF endEditing:YES];
        [ _EmergencyTF endEditing:YES];
        [ _heightTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _emergencynemeTF endEditing:YES];

    }
    
    else if(textField == _heightTF)
    {
        
         [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
        _pickerviewobj.hidden=YES;

        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _unemploidTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        
        [ _GenderTF endEditing:YES];
        [ _EmergencyTF endEditing:YES];
        [ _weightTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _emergencynemeTF endEditing:YES];

    }
    
    
    else if (textField==self.unemploidTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
        _pickerviewobj.hidden=YES;

        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        
        [ _GenderTF endEditing:YES];
        [ _EmergencyTF endEditing:YES];
        [ _weightTF endEditing:YES];
        [ _heightTF endEditing:YES];
        [ _emergencynemeTF endEditing:YES];

    }
    
   
   
    else if(textField == _EthnicityTF)
    {
        
        [self.scrollViewObj setContentOffset:CGPointMake(0, 40)animated:YES];
        _pickerviewobj.hidden=YES;

        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        
        [ _GenderTF endEditing:YES];
        [ _EmergencyTF endEditing:YES];

        [ _weightTF endEditing:YES];
        [ _heightTF endEditing:YES];
        [ _emergencynemeTF endEditing:YES];

    }
    else if(textField == _GenderTF)
    {
        _pickerviewobj.hidden=YES;

        [self.scrollViewObj setContentOffset:CGPointMake(0, 60)animated:YES];
        
        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        [ _EmergencyTF endEditing:YES];
        [ _weightTF endEditing:YES];
        [ _heightTF endEditing:YES];
        [ _emergencynemeTF endEditing:YES];

    }
    
    else if(textField == _emergencynemeTF)
    {
        
        [self.scrollViewObj setContentOffset:CGPointMake(0, 80)animated:YES];
        _pickerviewobj.hidden=YES;
        
        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _GenderTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        [ _weightTF endEditing:YES];
        [ _heightTF endEditing:YES];
        [ _EmergencyTF endEditing:YES];
        
    }
    else if(textField == _EmergencyTF)
    {
        
        [self.scrollViewObj setContentOffset:CGPointMake(0, 100)animated:YES];
        _pickerviewobj.hidden=YES;

        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _GenderTF endEditing:YES];
         [ _EthnicityTF endEditing:YES];
        [ _weightTF endEditing:YES];
        [ _heightTF endEditing:YES];
        [ _emergencynemeTF endEditing:YES];

    }
    else
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
        
        
    }
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

- (IBAction)SaveandcontinueBtnAction:(id)sender {
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *laxString1 =@"^[7-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]";
    
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    //NSPredicate *emailTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", laxString1];
    
    NSString *msg  = @"0";
    
     if (_heightTF.text.length < 1)
    {
        msg = @"Please enter your height";
        
    }
    else if (_unemploidTF.text.length < 1)
     {
         msg = @"Please enter vocation or vocational goal";
         
     }
    else if (_EthnicityTF.text.length < 1)
    {
        msg = @"Please enter your ethnicity";
        
    }
    
    else if (_GenderTF.text.length < 1)
    {
        msg = @"Please enter your gender";
        
    }
    else if (_emergencynemeTF.text.length < 1)
    {
        msg = @"Please enter emergency contact name";
        
    }
    else if (_EmergencyTF.text.length < 1)
    {
        msg = @"Please enter emergency contact phone number";
        
    }
    if (![msg isEqualToString:@"0"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
         [self callvalidateemrnumber];
        // [self calldemographic];
}
}
-(void) calldemographic
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"DemographicForm" forKey:@"name"];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:_AgeTF.text forKey:@"age"];
    [paramDict setValue:_GoschoolTF.text forKey:@"YearInSchool"];
    [paramDict setValue:_SchoollevelTF.text forKey:@"achievement"];
    [paramDict setValue:_unemploidTF.text forKey:@"vocational_goal"];
    [paramDict setValue:_IncomeTF.text forKey:@"annual_income"];
    [paramDict setValue:_EthnicityTF.text forKey:@"ethnicity"];
    [paramDict setValue:_GenderTF.text forKey:@"gender"];
    [paramDict setValue:_emergencynemeTF.text forKey:@"emgname"];

    [paramDict setValue:_EmergencyTF.text forKey:@"emgnum"];
    [paramDict setValue:_weightTF.text forKey:@"weight"];
    [paramDict setValue:_heightTF.text forKey:@"height"];
    [paramDict setValue:@"1" forKey:@"form_status"];
    
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"UserId"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"DemographicForm" :dict :paramDict];
}
-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"DemographicForm"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            if ([[responseDictionary valueForKey:@"status_message"] isEqualToString:@"Registration done!"])
            {
//                FriendsViewController *EVC=[[FriendsViewController alloc]init];
//                [EVC setInvitestr:@"invite"];
//                [self.navigationController pushViewController:EVC animated:YES];
                
                SelectContactViewController *EVC=[[SelectContactViewController alloc]init];
                // [EVC setInvitestr:@"invite"];
                [self.navigationController pushViewController:EVC animated:YES];
            }
           
        }
    }
}

-(void)callvalidateemrnumber
{
    
    
    NSString *i=_EmergencyTF.text;
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
             [self calldemographic];
           
          }
         else
         {
             UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"This number not valid" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             dispatch_async(dispatch_get_main_queue(), ^{
                 [alertview show];
             });
             
         }
     }];
    
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//    [dict setValue:@"5e4b227c69d89a6d252e69a7dfaf8cdf" forKey:@"access_key"];
//    [dict setValue:_EmergencyTF.text forKey:@"number"];
//    [dict setValue:@"" forKey:@"country_code"];
//
//    [dict setValue:@"1" forKey:@"format"];

 //         NSLog(@"%@",responseObject);
//
//         NSString *message = [responseObject valueForKey:@"message"];
//         NSDictionary *dict =[responseObject valueForKey:@"Data"];
//
 //
//     }
//     //  activityIden.hidden = YES;
//          failure:^(AFHTTPRequestOperation *operation, NSError *error)
//    {
//
//
//    }];
}




- (IBAction)SavenNextBtnAction:(id)sender {
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *laxString1 =@"^[7-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]";
    
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    //NSPredicate *emailTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", laxString1];
    
    NSString *msg  = @"0";
    
    if([_AgeTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
    {
        msg = @"Please enter your age";
        
    }
    
    else if(_GoschoolTF.text.length < 1)
    {
        msg =@"Please enter year ";
        
    }
 
    else if (_SchoollevelTF.text.length < 1)
    {
        msg = @"Please enter heighest level in school";
        
    }
    else if (_IncomeTF.text.length < 1)
    {
        msg = @"Please enter your annual income";
        
    }
    else if (_weightTF.text.length < 1)
    {
        msg = @"Please enter your weight";
        
    }
    if (![msg isEqualToString:@"0"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        _view1obj.hidden=YES;
        _view2obj.hidden=NO;

    }
}
- (IBAction)HomeBtnAction:(id)sender {
//    FeedViewController *EVC=[[FeedViewController alloc]init];
//    [EVC setStr2:@"feed"];
//    [self.navigationController pushViewController:EVC animated:YES];
    
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
    _SchoollevelTF.text=[accountarr objectAtIndex:row];
    
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
