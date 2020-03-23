
#import "VerifyPhoneNumberViewController.h"

@interface VerifyPhoneNumberViewController ()

@end

@implementation VerifyPhoneNumberViewController

- (void)viewDidLoad {
//    
//    _txtfield1.tag=1;
//    _txtfield2.tag=2;
//    _txtfield3.tag=3;
//    _txtfield4.tag=4;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)backBtn:(id)sender {
    // [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    BOOL shouldProcess = NO; //default to reject
    BOOL shouldMoveToNextField = NO; //default to remaining on the current field
    
    int insertStringLength = [string length];
    if(insertStringLength == 0){ //backspace
        shouldProcess = YES; //Process if the backspace character was pressed
    }
    else {
        if([[textField text] length] == 0) {
            shouldProcess = YES; //Process if there is only 1 character right now
        }
    }
    
    //here we deal with the UITextField on our own
    if(shouldProcess){
        //grab a mutable copy of what's currently in the UITextField
        NSMutableString* mstring = [[textField text] mutableCopy];
        if([mstring length] == 0){
            //nothing in the field yet so append the replacement string
            [mstring appendString:string];
            
            shouldMoveToNextField = YES;
        }
        else{
            //adding a char or deleting?
            if(insertStringLength > 0){
                [mstring insertString:string atIndex:range.location];
            }
            else {
                //delete case - the length of replacement string is zero for a delete
                [mstring deleteCharactersInRange:range];
            }
        }
        
        //set the text now
        [textField setText:mstring];
        
       
        
        if (shouldMoveToNextField) {
            //
            //MOVE TO NEXT INPUT FIELD HERE
            //
            if(textField==_txtfield1)
            {
            [_txtfield2 becomeFirstResponder];
            }
            else if(textField==_txtfield2)
            {
                 [_txtfield3 becomeFirstResponder];
            }
            else if(textField==_txtfield3)
            {
                [_txtfield4 becomeFirstResponder];
            }
        }
    }
    
    //always return no since we are manually changing the text field
    return NO;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField==_txtfield1)
    {
        _lbl1.backgroundColor = [UIColor grayColor];
        [_txtfield1 resignFirstResponder];
        [_txtfield2 becomeFirstResponder];
       
        
    }
    else if(textField==_txtfield2)
    {
        _lbl2.backgroundColor = [UIColor grayColor];
        [_txtfield2 resignFirstResponder];
        [_txtfield3 becomeFirstResponder];
    }
    
    else if(textField==_txtfield3)
    {
        _lbl3.backgroundColor = [UIColor grayColor];
        [_txtfield3 resignFirstResponder];
        [_txtfield4 becomeFirstResponder];
    }
    else if(textField==_txtfield4)
    {
        _lbl4.backgroundColor = [UIColor grayColor];
    }
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==_txtfield1)
    {
        _lbl1.backgroundColor = [UIColor colorWithRed:61.0f/255.0f
                                                green:181.0f/255.0f
                                                 blue:230.0f/255.0f
                                                alpha:1.0f];
        [_txtfield2 endEditing:YES];
        [_txtfield3 endEditing:YES];
        [_txtfield4 endEditing:YES];
        
    }
    else if(textField==_txtfield2)
    {
        _lbl2.backgroundColor = [UIColor colorWithRed:61.0f/255.0f
                                                green:181.0f/255.0f
                                                 blue:230.0f/255.0f
                                                alpha:1.0f];
        [_txtfield1 endEditing:YES];
        [_txtfield3 endEditing:YES];
        [_txtfield4 endEditing:YES];
    }
    
    else if(textField==_txtfield3)
    {
        _lbl3.backgroundColor = [UIColor colorWithRed:61.0f/255.0f
                                                green:181.0f/255.0f
                                                 blue:230.0f/255.0f
                                                alpha:1.0f];
        [_txtfield1 endEditing:YES];
        [_txtfield2 endEditing:YES];
        [_txtfield4 endEditing:YES];
    }
    else if(textField==_txtfield4)
    {
        _lbl4.backgroundColor = [UIColor colorWithRed:61.0f/255.0f
                                                green:181.0f/255.0f
                                                 blue:230.0f/255.0f
                                                alpha:1.0f];
        [_txtfield1 endEditing:YES];
        [_txtfield2 endEditing:YES];
        [_txtfield3 endEditing:YES];
      
    }
  
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
