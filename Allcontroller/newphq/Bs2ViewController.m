//
//  Bs2ViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 04/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "Bs2ViewController.h"
#import "EditViewController.h"
#import "MyWebserviceManager.h"
#import "FeedViewController.h"
#import "SWRevealViewController.h"

@interface Bs2ViewController ()
{
    NSMutableArray *accountarr;
}
@end

@implementation Bs2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden=YES;
    [self callviewdemo];
    _SandvBtnobj.layer.cornerRadius=21;
    _SandvBtnobj.clipsToBounds=YES;
    _scrollViewObj.contentSize = CGSizeMake(375, 500);
    _pickerviewobj.hidden=YES;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
     accountarr = [[NSMutableArray alloc]initWithObjects:@"High School",@"Intermediate",@"Graduate",@"Post Graduate", nil];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    
     SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = YES;
      revealController.tapGestureRecognizer.enabled=YES;
     [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
     [ _MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    
    return YES;
}
  // Do any additional setup after loading the view.
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    [_AgeTF resignFirstResponder];
    [_GoschoolTF resignFirstResponder];
    [_SchoollevelTF resignFirstResponder];
    [_unemploidTF resignFirstResponder];
    [_IncomeTF resignFirstResponder];
    [_EthnicityTF resignFirstResponder];
    [_GenderTF resignFirstResponder];
    [_emnumTF resignFirstResponder];
    [_emergencynemeTF resignFirstResponder];
    [_heightTF resignFirstResponder];
    [_weightTF resignFirstResponder];
    _pickerviewobj.hidden=YES;
    
    
    return YES;
}
-(void)hideKeyboard
{
    [_AgeTF resignFirstResponder];
    [_GoschoolTF resignFirstResponder];
    [_SchoollevelTF resignFirstResponder];
    [_unemploidTF resignFirstResponder];
    [_IncomeTF resignFirstResponder];
    [_EthnicityTF resignFirstResponder];
    [_GenderTF resignFirstResponder];
    [_emnumTF resignFirstResponder];
    [_heightTF resignFirstResponder];
    [_weightTF resignFirstResponder];
    [_emergencynemeTF resignFirstResponder];

    _pickerviewobj.hidden=YES;

    [self.scrollViewObj setContentOffset:CGPointMake(0, 10)animated:YES];
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==self.AgeTF)
    {
        // [_UserTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [_unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        [ _GenderTF endEditing:YES];
        [ _emnumTF endEditing:YES];
        [_heightTF endEditing:YES];
        [_weightTF endEditing:YES];
        [_emergencynemeTF endEditing:YES];

         //[_UserTF resignFirstResponder];
        _pickerviewobj.hidden=YES;
        [self.scrollViewObj setContentOffset:CGPointMake(0, 10)animated:YES];

    }
    
    else if(textField==_GoschoolTF)
    {
        [_AgeTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [_unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        [ _GenderTF endEditing:YES];
        [ _emnumTF endEditing:YES];
        [_heightTF endEditing:YES];
        [_weightTF endEditing:YES];
        // [_MobileTF resignFirstResponder];
        _pickerviewobj.hidden=YES;
        [_emergencynemeTF endEditing:YES];
        [self.scrollViewObj setContentOffset:CGPointMake(0, 20)animated:YES];

        //  [ _MobileTF endEditing:YES];
    }
    
    else if (textField==self.SchoollevelTF)
    {
        _pickerviewobj.hidden=NO;
        [_SchoollevelTF endEditing:YES];
        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        [ _GenderTF endEditing:YES];
        [ _emnumTF endEditing:YES];
        [_heightTF endEditing:YES];
        [_weightTF endEditing:YES];
        // [_EmailTF resignFirstResponder];
        _pickerviewobj.hidden=NO;
        [_emergencynemeTF endEditing:YES];
        [self.scrollViewObj setContentOffset:CGPointMake(0, 60)animated:YES];

    }
    else if (textField==self.unemploidTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 115)animated:YES];
        
        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        
        [ _GenderTF endEditing:YES];
        [ _emnumTF endEditing:YES];
        [_heightTF endEditing:YES];
        [_weightTF endEditing:YES];
        _pickerviewobj.hidden=YES;
        [_emergencynemeTF endEditing:YES];

    }
    
    else if(textField == _EthnicityTF)
    {
        
        [self.scrollViewObj setContentOffset:CGPointMake(0, 170)animated:YES];
        
        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        
        [ _GenderTF endEditing:YES];
        [ _emnumTF endEditing:YES];
        
        [_heightTF endEditing:YES];
        [_weightTF endEditing:YES];
        _pickerviewobj.hidden=YES;
        [_emergencynemeTF endEditing:YES];

    }
    else if(textField == _GenderTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 210)animated:YES];
        
        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        
        [ _EthnicityTF endEditing:YES];
        [ _emnumTF endEditing:YES];
        [_heightTF endEditing:YES];
        [_weightTF endEditing:YES];
        _pickerviewobj.hidden=YES;
        [_emergencynemeTF endEditing:YES];

    }
    
    else if(textField == _IncomeTF)
    {
        
        [self.scrollViewObj setContentOffset:CGPointMake(0, 135)animated:YES];
        
        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _unemploidTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        
        [ _GenderTF endEditing:YES];
        [ _emnumTF endEditing:YES];
        [_heightTF endEditing:YES];
        [_weightTF endEditing:YES];
        _pickerviewobj.hidden=YES;
        [_emergencynemeTF endEditing:YES];

    }
    
    
    //* weight measure
    
    else if(textField == _weightTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 210)animated:YES];
        
        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        [ _emnumTF endEditing:YES];
        [_heightTF endEditing:YES];
        [_GenderTF endEditing:YES];
        _pickerviewobj.hidden=YES;
        [_emergencynemeTF endEditing:YES];

    }
    
    //* height measure
    else if(textField == _heightTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 210)animated:YES];
        
        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        [ _emnumTF endEditing:YES];
        [_weightTF endEditing:YES];
        [_GenderTF endEditing:YES];
        _pickerviewobj.hidden=YES;
        [_emergencynemeTF endEditing:YES];

    }
    else if(textField == _emergencynemeTF)
    {
        
        [self.scrollViewObj setContentOffset:CGPointMake(0, 260)animated:YES];
        [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        [ _GenderTF endEditing:YES];
        [_heightTF endEditing:YES];
        [_weightTF endEditing:YES];
        _pickerviewobj.hidden=YES;
        [ _emnumTF endEditing:YES];

    }
    
    else if(textField == _emnumTF)
    {
        
        [self.scrollViewObj setContentOffset:CGPointMake(0, 280)animated:YES];
         [_AgeTF endEditing:YES];
        [_GoschoolTF endEditing:YES];
        [_SchoollevelTF endEditing:YES];
        [ _unemploidTF endEditing:YES];
        [ _IncomeTF endEditing:YES];
        [ _EthnicityTF endEditing:YES];
        [ _GenderTF endEditing:YES];
        [_heightTF endEditing:YES];
        [_weightTF endEditing:YES];
        _pickerviewobj.hidden=YES;

    }
    else
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 10)animated:YES];
        
        
    }
}


- (IBAction)SaveandcontinueBtnAction:(id)sender {
    
    NSString *phoneRegex = @"^[\+(00)][0-9]{6,14}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
   
    NSString *msg  = @"0";
    
    if([_AgeTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
    {
        msg = @"Please enter your age";
        
    }
    
    else if (_GoschoolTF.text.length < 1)
    {
        msg =@"Please enter year ";
        
    }
    
    else if (_SchoollevelTF.text.length < 1)
    {
        msg = @"Please enter heighest level in school";
        
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
    else if (_IncomeTF.text.length < 1)
    {
        msg = @"Please enter your annual income";
        
    }
    
    else if (_weightTF.text.length < 1)
    {
        msg = @"Please enter your weight";
        
    }
    
    else if (_heightTF.text.length < 1)
    {
        msg = @"Please enter your height";
        
    }
    else if (_emergencynemeTF.text.length < 1)
    {
        msg = @"Please enter emergency contact name";
        
    }
    else if (_emnumTF.text.length < 1)
    {
        msg = @"Please enter emergency phone number";
        
    }
    else if (_emnumTF.text.length < 8)
    {
        msg = @"Please enter valid emergency phone number";
        
    }
    else if([phoneTest evaluateWithObject:_emnumTF.text])
    {
        msg =@"Please enter valid emergency phone number";
    }
    
    if (![msg isEqualToString:@"0"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
       [self calldemographic];
    }
}

-(void)calldemographic
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
    [paramDict setValue:_emnumTF.text forKey:@"emgnum"];
    [paramDict setValue:_weightTF.text forKey:@"weight"];
    [paramDict setValue:_heightTF.text forKey:@"height"];
    //[paramDict setValue:@"1" forKey:@"form_status"];
    [paramDict setValue:@"2" forKey:@"form_status"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"UserId"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"DemographicForm" :dict :paramDict];
}

-(void)callvalidateemrnumber
{
    NSString *i=_emnumTF.text;
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
}
-(void) processFailed :(NSError *)responseDictionary
{
    NSLog(@"error");
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"DemographicForm"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            FeedViewController *EVC=[[FeedViewController alloc]init];
            [EVC setStr2:@"feed"];
            [self.navigationController pushViewController:EVC animated:YES];
            // Arr =[[NSMutableDictionary alloc]initWithDictionary:[responseDictionary valueForKey:@"data"]];
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"DemographicList"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            //            NSString *phonestr = [[responseDictionary valueForKey:@"data"]valueForKey:@"age"];
            //
            //            if ([phonestr isEqual:(id)[NSNull null]] || phonestr.length < 1 )
            //            {
            //                _AgeTF.text=@"";
            //
            //            }
            //
            //            else
            //            {
            //                _AgeTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"age"];
            //
            //            }
            _AgeTF.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"age"];
            
            NSString *phonestr1 = [[responseDictionary valueForKey:@"data"]valueForKey:@"years_in_school"];
            
            if ([phonestr1 isEqual:(id)[NSNull null]] || phonestr1.length < 1 )
            {
                _GoschoolTF.text=@" ";
                
            }
            
            else
            {
                _GoschoolTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"years_in_school"];
                
            }
            //_GoschoolTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"years_in_school"];
            
            _SchoollevelTF.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"achievement"];
            
            //NSString *phonestr2 = [[responseDictionary valueForKey:@"data"]valueForKey:@"achievement"];
            
            //            if ([phonestr2 isEqual:(id)[NSNull null]] || phonestr2.length < 1 )
            //            {
            //                _SchoollevelTF.text=@"";
            //
            //            }
            //
            //            else
            //            {
            //                _SchoollevelTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"achievement"];
            //
            //            }
            
            NSString *phonestr11 = [[responseDictionary valueForKey:@"data"]valueForKey:@"weight"];
            
            if ([phonestr11 isEqual:(id)[NSNull null]] || phonestr11.length < 1 )
            {
                _weightTF.text=@" ";
                
            }
            else
            {
                _weightTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"weight"];
                
            }
            
            
            NSString *phonestr12 = [[responseDictionary valueForKey:@"data"]valueForKey:@"height"];
            
            if ([phonestr12 isEqual:(id)[NSNull null]] || phonestr12.length < 1 )
            {
                _heightTF.text=@" ";
                
            }
            else
            {
                _heightTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"height"];
                
            }
            
            
            
            _unemploidTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"vocational_goal"];
            
            //            NSString *phonestr3 = [[responseDictionary valueForKey:@"data"]valueForKey:@"vocational_goal"];
            //
            //            if ([phonestr3 isEqual:(id)[NSNull null]] || phonestr3.length < 1 )
            //            {
            //                _unemploidTF.text=@"";
            //
            //            }
            //            else
            //            {
            //                _unemploidTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"vocational_goal"];
            //
            // }
            _IncomeTF.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"annual_income"];
            
            //            NSString *phonestr4 = [[responseDictionary valueForKey:@"data"]valueForKey:@"annual_income"];
            //
            //            if ([phonestr4 isEqual:(id)[NSNull null]] || phonestr4.length < 1 )
            //            {
            //                _IncomeTF.text=@"";
            //
            //            }
            //            else
            //            {
            //                _IncomeTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"annual_income"];
            //
            //            }
            
            _EthnicityTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"ethnicity"];
            _GenderTF.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"gender"];
            _emergencynemeTF.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"Emgname"];

            _emnumTF.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"EmgNum"];
            
            // Arr =[[NSMutableDictionary alloc]initWithDictionary:[responseDictionary valueForKey:@"data"]];
            
        }
    }
    
}

-(void)callviewdemo
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"DemographicList" forKey:@"name"];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"DemographicList" :dict :paramDict];
    
}
- (IBAction)HomeBtnAction:(id)sender {
    
    FeedViewController *EVC=[[FeedViewController alloc]init];
    [EVC setStr2:@"feed"];
    [self.navigationController pushViewController:EVC animated:YES];
}
- (IBAction)BackBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
    
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
