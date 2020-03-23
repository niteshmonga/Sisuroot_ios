#import "EmotionViewController.h"
#import "SWRevealViewController.h"
#import "FeedViewController.h"
#import "MyWebserviceManager.h"
#import "chattypeViewController.h"
#import "smilepage1ViewController.h"
#import "GraphView.h"
#import "GraphView1.h"
#import "BS1ViewController.h"
#import "Sisuroot-Swift.h"

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
- (IBAction)sliderchange:(id)sender
{
    
    
}
- (IBAction)btn1:(id)sender {
     _emo_string=@"1";
     [_btn1 setImage:[UIImage imageNamed:@"Group 14762.png"] forState:UIControlStateNormal];
          [_btn2 setImage:[UIImage imageNamed:@"Group 18616.png"] forState:UIControlStateNormal];
           [_btn3 setImage:[UIImage imageNamed:@"Group 18615.png"] forState:UIControlStateNormal];
           [_btn4 setImage:[UIImage imageNamed:@"Group 18614.png"] forState:UIControlStateNormal];
           [_btn5 setImage:[UIImage imageNamed:@"Group 18613.png"] forState:UIControlStateNormal];

}
- (IBAction)btn2:(id)sender {
     _emo_string=@"2";
    [_btn1 setImage:[UIImage imageNamed:@"Group 18617.png"] forState:UIControlStateNormal];
        [_btn2 setImage:[UIImage imageNamed:@"Group 14763.png"] forState:UIControlStateNormal];
        [_btn3 setImage:[UIImage imageNamed:@"Group 18615.png"] forState:UIControlStateNormal];
        [_btn4 setImage:[UIImage imageNamed:@"Group 18614.png"] forState:UIControlStateNormal];
        [_btn5 setImage:[UIImage imageNamed:@"Group 18613.png"] forState:UIControlStateNormal];

}
- (IBAction)btn3:(id)sender {
     _emo_string=@"3";
    [_btn1 setImage:[UIImage imageNamed:@"Group 18617.png"] forState:UIControlStateNormal];
          [_btn2 setImage:[UIImage imageNamed:@"Group 18616.png"] forState:UIControlStateNormal];
          [_btn3 setImage:[UIImage imageNamed:@"Group 14764.png"] forState:UIControlStateNormal];
          [_btn4 setImage:[UIImage imageNamed:@"Group 18614.png"] forState:UIControlStateNormal];
          [_btn5 setImage:[UIImage imageNamed:@"Group 18613.png"] forState:UIControlStateNormal];

}
- (IBAction)btn4:(id)sender {
     _emo_string=@"4";
     [_btn1 setImage:[UIImage imageNamed:@"Group 18617.png"] forState:UIControlStateNormal];
          [_btn2 setImage:[UIImage imageNamed:@"Group 18616.png"] forState:UIControlStateNormal];
          [_btn3 setImage:[UIImage imageNamed:@"Group 18615.png"] forState:UIControlStateNormal];
          [_btn4 setImage:[UIImage imageNamed:@"Group 14765.png"] forState:UIControlStateNormal];
          [_btn5 setImage:[UIImage imageNamed:@"Group 18613.png"] forState:UIControlStateNormal];

}
- (IBAction)btn5:(id)sender {
     _emo_string=@"5";
      [_btn1 setImage:[UIImage imageNamed:@"Group 18617.png"] forState:UIControlStateNormal];
          [_btn2 setImage:[UIImage imageNamed:@"Group 18616.png"] forState:UIControlStateNormal];
          [_btn3 setImage:[UIImage imageNamed:@"Group 18615.png"] forState:UIControlStateNormal];
          [_btn4 setImage:[UIImage imageNamed:@"Group 18614.png"] forState:UIControlStateNormal];
          [_btn5 setImage:[UIImage imageNamed:@"Group 14766.png"] forState:UIControlStateNormal];

}

- (void)viewDidLoad {
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
      graphView.backgroundColor = [UIColor clearColor];
      GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
      graphView1.backgroundColor = [UIColor clearColor];
      [self.view_footer1 addSubview:graphView];
      [self.view_footer2 addSubview:graphView1];
    _emo_string=@"";
     _commentsTV.layer.cornerRadius=10;
     [FIRAnalytics setScreenName:@"Emotion" screenClass:@"Emotion"];
    [super viewDidLoad];
   // theViewSlider.noOfTicks = 5;
    //  theViewSlider.isTickType = YES;
      //[self.view insertSubview:[theViewSlider addTickMarksView] belowSubview:theViewSlider];
    self.navigationController.navigationBar.hidden=YES;
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = YES;
      revealController.tapGestureRecognizer.enabled=YES;
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    [ _MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
    UIToolbar * keyboardToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    keyboardToolBar.barStyle = UIBarStyleDefault;
    [keyboardToolBar setItems: [NSArray arrayWithObjects:
    [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(resignKeyboard)],
                                nil]];
    _commentsTV.inputAccessoryView = keyboardToolBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void) tapped:(UIGestureRecognizer *) sender
{
   [_commentsTV resignFirstResponder];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView==_commentsTV)
    {
        UIToolbar * keyboardToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        keyboardToolBar.barStyle = UIBarStyleDefault;
        [keyboardToolBar setItems: [NSArray arrayWithObjects:
                                    [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                    [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(resignKeyboard)],
                                    nil]];
        _commentsTV.inputAccessoryView = keyboardToolBar;
       if ([_commentsTV.text isEqualToString:@"Description"]) {
             _commentsTV.text=@"";
        }
    }
}

- (IBAction)btnchat:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btnyou:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btqa:(id)sender {
    smilepage1ViewController *FVC=[[smilepage1ViewController alloc]init];
    [self.navigationController pushViewController:FVC animated:YES];
}

- (IBAction)btn_sos:(id)sender {
  BS1ViewController *BSVC=[[BS1ViewController alloc]init];
       [self.navigationController pushViewController:BSVC animated:YES];
}

- (IBAction)btnsurvey:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://www.surveymonkey.com/r/6X5Z2TL"]];
}

- (IBAction)SubmitAction:(id)sender {
    NSString *msg  = @"0";
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
    {   [self callbugreportService];  }
 }


-(void)callbugreportService
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"bugreport" forKey:@"name"];
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:_headlineTF.text forKey:@"title"];
    [paramDict setValue:_commentsTV.text forKey:@"comment"];
    [paramDict setValue:_emo_string forKey:@"emotion"];
    [paramDict setValue:@"0" forKey:@"device_type"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"bugreport" :dict :paramDict];
}

-(void) processFailed :(NSError *)responseDictionary
{
     NSLog(@"error");
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
-(void)resignKeyboard {
    [_commentsTV resignFirstResponder];
}
@end
