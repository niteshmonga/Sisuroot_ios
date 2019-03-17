//
//  EmotionViewController.m
//  Root_App
//
//  Created by BRIJESH KUMAR on 25/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import "EmotionViewController.h"
#import "SWRevealViewController.h"
#import "FeedViewController.h"
#import "MyWebserviceManager.h"

@interface EmotionViewController ()

@end

@implementation EmotionViewController
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    [_commentsTV resignFirstResponder];
    
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    [ _MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    _nameTF.text= [[NSUserDefaults standardUserDefaults]valueForKey:@"username"];
    _headlineTF.text= [[NSUserDefaults standardUserDefaults]valueForKey:@"email"];

    
    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
    
    _submitbtnobj.layer.cornerRadius=6;
    _submitbtnobj.clipsToBounds=YES;
    
      _commentsTV.layer.cornerRadius=8;
    _commentsTV.clipsToBounds=YES;
    _commentsTV.layer.borderWidth =2;

    _commentsTV.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;

    [self.headlineTF setValue:[UIColor darkGrayColor]
                  forKeyPath:@"_placeholderLabel.textColor"];
    [self.nameTF setValue:[UIColor darkGrayColor]
                   forKeyPath:@"_placeholderLabel.textColor"];
    
    
    UIToolbar * keyboardToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    keyboardToolBar.barStyle = UIBarStyleDefault;
    [keyboardToolBar setItems: [NSArray arrayWithObjects:
                                //                                    [[UIBarButtonItem alloc]initWithTitle:@"Previous" style:UIBarButtonItemStyleBordered target:self action:@selector(previousTextView)],
                                //
                                //                                    [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(nextTextView)],
                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(resignKeyboard)],
                                nil]];
    _commentsTV.inputAccessoryView = keyboardToolBar;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) tapped:(UIGestureRecognizer *) sender
{
    [_headlineTF resignFirstResponder];
    [_commentsTV resignFirstResponder];
}





- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView==_commentsTV)
    {
        UIToolbar * keyboardToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        
        keyboardToolBar.barStyle = UIBarStyleDefault;
        [keyboardToolBar setItems: [NSArray arrayWithObjects:
//                                    [[UIBarButtonItem alloc]initWithTitle:@"Previous" style:UIBarButtonItemStyleBordered target:self action:@selector(previousTextView)],
//
//                                    [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(nextTextView)],
                                    [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                    [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(resignKeyboard)],
                                    nil]];
        _commentsTV.inputAccessoryView = keyboardToolBar;
        
        if ([_commentsTV.text isEqualToString:@"Description"]) {
            
              _commentsTV.text=@"";
        }
        else
        {
            
        }
      
        
        
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

- (IBAction)SubmitAction:(id)sender {
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    NSString *msg  = @"0";
    
//    if([_headlineTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
//    {
//        msg = @"Please enter title";
//
//     }
    
     if ([_commentsTV.text isEqualToString:@"Description"])
    {
        msg = @"Please enter description";
    }
    else if (_commentsTV.text.length < 1 )
    {
        msg = @"Please enter description";
    }
    
    if (![msg isEqualToString:@"0"])
    {
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sisuroot" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    
    else
    {
        [self callbugreportService];
        
    }
    
 }

-(void)callbugreportService
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"bugreport" forKey:@"name"];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:_headlineTF.text forKey:@"title"];
    
    [paramDict setValue:_commentsTV.text forKey:@"comment"];
    [paramDict setValue:@"0" forKey:@"device_type"];

    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"bugreport" :dict :paramDict];
}


-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"bugreport"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Message Sent!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
            
            FeedViewController *fvc=[[FeedViewController alloc]init];
            [self.navigationController pushViewController:fvc animated:YES];
            
        }
        
    }
}

- (IBAction)HomeBtnAction:(id)sender
{
    FeedViewController *fvc=[[FeedViewController alloc]init];
    [self.navigationController pushViewController:fvc animated:YES];
}


-(BOOL)textFieldShouldBeginEditing: (UITextField *)textField
{
//    UIToolbar * keyboardToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
//
//    keyboardToolBar.barStyle = UIBarStyleDefault;
//    [keyboardToolBar setItems: [NSArray arrayWithObjects:
//                                [[UIBarButtonItem alloc]initWithTitle:@"Previous" style:UIBarButtonItemStyleBordered target:self action:@selector(previousTextField)],
//
//                                [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(nextTextField)],
//                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
//                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(resignKeyboard)],
//                                nil]];
//    textField.inputAccessoryView = keyboardToolBar;
   return YES;
}
- (void)nextTextField
{
    
     if ([_nameTF isEditing]) {
        
        [_nameTF resignFirstResponder];
        [_headlineTF becomeFirstResponder];
        //[_commentsTV becomeFirstResponder];

    }
    else if ([_headlineTF isEditing]) {
        
        [_headlineTF resignFirstResponder];
        [_commentsTV becomeFirstResponder];
        
    }
//    else if (_commentsTV) {
//
//
//
//    }
}

-(void)previousTextField
{
    if (_headlineTF) {
       [_headlineTF resignFirstResponder];
        [_nameTF becomeFirstResponder];
    }
    
//    else if (_headlineTF) {
//        [_headlineTF resignFirstResponder];
//        [_nameTF becomeFirstResponder];
//    }
    
}

-(void)resignKeyboard {
    
    [_nameTF resignFirstResponder];
    [_headlineTF resignFirstResponder];
    [_commentsTV resignFirstResponder];

}

@end
