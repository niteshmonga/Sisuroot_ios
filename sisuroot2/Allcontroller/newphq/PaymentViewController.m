//
//  PaymentViewController.m
//  Root
//
//  Created by Epikso on 12/10/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "PaymentViewController.h"
#import "FeedViewController.h"
#import "MyWebserviceManager.h"

@interface PaymentViewController ()
{
    BOOL ch1;
    NSMutableArray *month;
    NSMutableArray *year;
    NSString *chkBtn;
    NSString *cardidstr;
    NSString *frndidstr;
    NSString *transactionstr;
}
@end



@implementation PaymentViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    [cardEXpTF resignFirstResponder];
    [cardNameTF resignFirstResponder];
    [cardNoTF resignFirstResponder];
    [_yearTF resignFirstResponder];
    [cardCVVTF resignFirstResponder];
    
     return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    ch1=NO;
    activItyView.hidden = YES;
    [activItyView startAnimating];
   // [self callThisFetchMethode];
    
    _exdatepickerviewobj.hidden=YES;
    _pickerlblobj.hidden=YES;
    _donebtnobj.hidden=YES;
    
    month=[[NSMutableArray alloc]initWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12", nil];
    year=[[NSMutableArray alloc]initWithObjects:@"2018",@"2019",@"2020",@"2021",@"2022",@"2023",@"2024",@"2025",@"2026",@"2027",@"2028",@"2029",@"2030",@"2031",@"2032",@"2033",@"2034",@"2035",@"2036",@"2037",@"2038",@"2039",@"2040", nil];
    // Do any additional setup after loading the view from its nib.
    
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    
    payBtn.layer.cornerRadius = 18;
    [payBtn setClipsToBounds:YES];
}



-(void)hideKeyboard
{
    
    [cardEXpTF resignFirstResponder];
    [cardCVVTF resignFirstResponder];
    [cardNoTF resignFirstResponder];
    [cardNameTF resignFirstResponder];
    [_yearTF resignFirstResponder];
    
    _exdatepickerviewobj.hidden=YES;
    _pickerlblobj.hidden=YES;
    _donebtnobj.hidden=YES;
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
-(IBAction)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];

}

-(IBAction)paymentAction:(id)sender
{
    NSString *msg = @"0";
    if (cardNameTF.text.length == 0 ||  cardNameTF.text.length <=0)
    {
        msg = @"Please enter card holder name";
    }
    else   if (cardNoTF.text.length == 0 || cardNoTF.text.length <=0)
    {
        msg = @"Please enter card number";
    }
    
    else   if (cardEXpTF.text.length == 0)
    {
        msg = @"Please enter card expiry date";
    }
    else   if (_yearTF.text.length == 0)
    {
        msg = @"Please enter card expiry date";
    }
    else   if (cardCVVTF.text.length == 0)
    {
        msg = @"Please enter card CVV number";
    }
    
    //    else   if (ch1 == NO)
    //    {
    //        msg = @"Please accept terms & conditions";
    //    }
    
    if (![msg isEqualToString:@"0"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else
    {
        
        //        if ([_typeString isEqualToString:@"my"])
        //        {
        //            [self callThisMethode1];
        //        }
        //        else
        //            [self callThisMethode];
        
       // [self callpaymentmethod];
    }
}
- (IBAction)HomeBtnAction:(id)sender
{
    FeedViewController *LVC3=[[FeedViewController alloc]init];
    [self.navigationController pushViewController:LVC3 animated:YES];
}







//-(void)callpaymentmethod
//{
//    // [payBtn setUserInteractionEnabled:NO];
//    //activItyView.hidden = NO;
//    [self.view showActivityViewWithLabel:@"Loading"];
//
//    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//    [dict setValue:@"payment" forKey:@"name"];
//
//    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
//    [dict1 setValue:cardNoTF.text forKey:@"card_number"];
//
//    // NSArray *arra = [cardEXpTF.text componentsSeparatedByString:@"/"];
//
//    [dict1 setValue:cardEXpTF.text  forKey:@"exp_month"];
//    [dict1 setValue:_yearTF.text   forKey:@"exp_year"];
//
//    [dict1 setValue:cardCVVTF.text forKey:@"cvv"];
//
//    [dict1 setValue:_amountNo forKey:@"amount"];
//
//    NSUInteger r = arc4random_uniform(16);
//    NSUInteger invoicenumber=10000+r;
//    NSString *text = [NSString stringWithFormat:@"%li",  invoicenumber];
//
//    // 567891234
//
//    [dict1 setValue:@"567891234" forKey:@"invoice_number"];
//    [dict1 setValue:namelbl.text forKey:@"card_name"];
//
//    // [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"mobile"] forKey:@"mobile"];
//
//    // [dict1 setValue:cardidstr forKey:@"card_id"];
//
//    // [dict1 setValue:frndidstr forKey:@"sender_id"];
//
//    [dict1 setValue:[_localDict valueForKey:@"card_id"]  forKey:@"card_id"];
//    [dict1 setValue:[_localDict valueForKey:@"end_date"]  forKey:@"end_date"];
//
//    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"mobile"] forKey:@"sender_id"];
//
//    [dict1 setValue:[_localDict valueForKey:@"reciever_id"] forKey:@"reciever_id"];
//
//    [webServiceManager setDelegateMethode:self];
//    [webServiceManager callMyWebServiceManagerByGet:@"stripe_payment" :dict :dict1];
//
//}



- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField==cardEXpTF)
    {
        chkBtn = @"mm";
        
        
        [_exdatepickerviewobj reloadAllComponents];
        _exdatepickerviewobj.hidden=NO;
        _pickerlblobj.hidden=NO;
        _donebtnobj.hidden=NO;
        [cardEXpTF resignFirstResponder];
        [cardNameTF resignFirstResponder];
        [cardNoTF resignFirstResponder];
        [cardCVVTF resignFirstResponder];
        
    }
    
    if (textField==_yearTF) {
        
        chkBtn = @"year";
        
        [_exdatepickerviewobj reloadAllComponents];
        _exdatepickerviewobj.hidden=NO;
        _pickerlblobj.hidden=NO;
        _donebtnobj.hidden=NO;
        [_yearTF resignFirstResponder];
        [cardNameTF resignFirstResponder];
        [cardNoTF resignFirstResponder];
        [cardCVVTF resignFirstResponder];
        
    }
    
    if (textField==cardNameTF) {
        
        // chkBtn = @"year";
        
        _exdatepickerviewobj.hidden=YES;
        _pickerlblobj.hidden=YES;
        _donebtnobj.hidden=YES;
        
    }
    if (textField==cardNoTF) {
        
        // chkBtn = @"year";
        
        _exdatepickerviewobj.hidden=YES;
        _pickerlblobj.hidden=YES;
        _donebtnobj.hidden=YES;
        
    }
    
    if (textField==cardCVVTF) {
        
        // chkBtn = @"year";
        
        _exdatepickerviewobj.hidden=YES;
        _pickerlblobj.hidden=YES;
        _donebtnobj.hidden=YES;
        
    }
    
    //_pickerviewObj.backgroundColor=[UIColor whiteColor];
    
}


- (IBAction)donebtnAction:(id)sender {
    _exdatepickerviewobj.hidden=YES;
    _donebtnobj.hidden=YES;
    _pickerlblobj.hidden=YES;
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if([chkBtn isEqualToString:@"mm"])
    {
        return [month count];
        
    }
    else
    {
        return [year count];
        
    }
    return 0;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if([chkBtn isEqualToString:@"mm"])
    {
        return [month objectAtIndex:row];
        
    }
    else if([chkBtn isEqualToString:@"year"])
    {
        
        return [year objectAtIndex:row];
        
    }
    
    return 0;
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if ([chkBtn isEqualToString:@"mm"])
    {
         cardEXpTF.text = [month objectAtIndex:row];
    }
    
    if ([chkBtn isEqualToString:@"year"])
    {
        
      _yearTF.text = [year objectAtIndex:row];
        
     }
  }

@end
