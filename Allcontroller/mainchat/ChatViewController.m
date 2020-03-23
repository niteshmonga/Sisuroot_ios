#import "ChatViewController.h"
#import "ChatTableViewCell.h"
#import "chatfriendTableViewCell.h"
#import "ChatSendTableViewCell.h"
#import "ChatfriendViewController.h"
#import "MyWebserviceManager.h"
#import "BS1ViewController.h"
#import "UIImageView+WebCache.h"
#import "Base64.h"
#import "UIView+RNActivityView.h"
#import "DAKeyboardControl.h"
#import <Photos/Photos.h>
#import <sqlite3.h>
@interface ChatViewController () <UITableViewDataSource,UITableViewDelegate>
{
    NSMutableDictionary *strarr;
    NSMutableArray *strarr1;
    NSMutableArray *newarr;
    NSMutableArray *imgArr1;
    NSMutableArray *imgArr2;
    NSMutableArray *imgArr3;
    NSTimer *timer2;
    NSString *str;
    NSString *text;
    NSString *text1;
    NSString *senderidlbl;
    NSString *receiveridlbl;
    UILabel *label1;
    UILabel *label2;
    NSString *check;
    NSString *alltherapistIdString;
    NSString *trimmed;
    NSString *checktimer;
    BOOL isScrollingStart;
}
//@property (strong, nonatomic) TableArray *tableArray;
@end
@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [FIRAnalytics setScreenName:@"Chat" screenClass:@"Chat"];
    //checktimer=@"scrolldown1";
    checktimer=@"scrolldown2";
    if ([_detail2str isEqualToString:@"check12"])
    {
        if ([[_detail1 valueForKey:@"chat_status"]integerValue]==1)
        {
            _tapforgroupinfo.hidden=NO;
            _showgroupdetailbtnobj.hidden=NO;
            
        }
        else
        {
            _showgroupdetailbtnobj.hidden=YES;
            _tapforgroupinfo.hidden=YES;

         }
        
    }
    if ([_sisuchatstr isEqualToString:@"checktherapist"])
    {
        _showgroupdetailbtnobj.hidden=YES;
        _tapforgroupinfo.hidden=YES;

    }
    
    
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Sisuchat_Status"] isEqual:@"0"])
    {
        
        [_Addtherapistobj setUserInteractionEnabled:YES];
        
    }
    else
    {
        //        _SisuchatBtnobj.alpha = 0.5;
        //
        //        [_SisuchatBtnobj setUserInteractionEnabled:NO];
        [_Addtherapistobj setUserInteractionEnabled:YES];
        [_Addtherapistobj setBackgroundImage:[UIImage imageNamed:@"sos"] forState:UIControlStateNormal];
    }
    
    
    [self callviewstatus];
    [ self callallchathistory];
    
    timer2 = [NSTimer scheduledTimerWithTimeInterval:12.0 repeats:YES block:^(NSTimer * _Nonnull timer)
                       {
                          // checktimer=@"scrolldown2";

                             [ self callallchathistory];
                       }];
    _Addparticipantview.hidden=YES;
    //_Addtherapistobj.hidden=YES;
    _Gviewobj.hidden=YES;
    
    [_DoneBtnActionobj setUserInteractionEnabled:NO];
    
    
    strarr=[[NSMutableDictionary alloc]init];
    [_chatbtnobj setEnabled:NO];
    [_chatbtnobj setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    // Do any additional setup after loading the view from its nib.
    _textbacklbl.layer.cornerRadius=20;
    _textbacklbl.clipsToBounds=YES;
    //_textview.layer.cornerRadius=8;
    //_textview.clipsToBounds=YES;
    _viewobj.layer.cornerRadius=8;
    _viewobj.clipsToBounds=YES;
    //_chatTF.layer.borderWidth =1.0;
    _userimg.layer.cornerRadius=30;
    _userimg.layer.borderColor=[UIColor colorWithRed:(61.0/255.0) green:(181.0/255.0) blue:(230.0/255.0) alpha:1].CGColor;
    _userimg.clipsToBounds=YES;
    _userimg.layer.borderWidth =1.0;
    
    _Gimg.layer.cornerRadius=45;
    _Gimg.clipsToBounds=YES;
    
    _detail=[_detail1 valueForKey:@"friend_id"];
    _usernamelbl.text=[_detail1 valueForKey:@"friend_username"];
    _Gname.text=[_detail1 valueForKey:@"friend_username"];
    
    // [self callallchathistory];
    
    NSString *imgStr = [_detail1 valueForKey:@"friend_img"];
    
    
    if ([imgStr isEqual:(id)[NSNull null]] || [imgStr isEqualToString:@""])
    {
        _userimg.image = [UIImage imageNamed:@"user.png"];
        _Gimg.image = [UIImage imageNamed:@"user.png"];
        
    }
    else
    {
        
        if([[_detail1 valueForKey:@"img_status"] integerValue]==1)
        {
            NSString *imgStr = [_detail1 valueForKey:@"friend_img"];
            
            if ([imgStr isEqual:(id)[NSNull null]] || [imgStr isEqualToString:@""])
            {
                _userimg.image = [UIImage imageNamed:@"user.png"];
                _Gimg.image=[UIImage imageNamed:@"user.png"];
            }
            else
            {
                 [_userimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[_detail1  valueForKey:@"friend_img"]]] placeholderImage:nil];
                //[_userimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[_detail1  valueForKey:@"friend_img"]]] placeholderImage:nil];
                _userimg.contentMode=UIViewContentModeScaleToFill;
                
                 [_Gimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[_detail1  valueForKey:@"friend_img"]]] placeholderImage:nil];
                
                //[_Gimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[_detail1  valueForKey:@"friend_img"]]] placeholderImage:nil];
                _Gimg.contentMode=UIViewContentModeScaleToFill;
            }
        }
        else if([[_detail1 valueForKey:@"img_status"] integerValue]==0)
        {
            
            [_userimg setImageWithURL:[_detail1 valueForKey:@"friend_img"]placeholderImage:nil];
            _userimg.contentMode=UIViewContentModeScaleToFill;
 
            [_Gimg setImageWithURL:[_detail1 valueForKey:@"friend_img"]placeholderImage:nil];
            _Gimg.contentMode=UIViewContentModeScaleToFill;
            
        }
        
    }
    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
    
    _tableviewbj.rowHeight = UITableViewAutomaticDimension;
    _tableviewbj.estimatedRowHeight = 44;
    
    _textview.text = @"Write your message...";
    _textview.textColor = [UIColor lightGrayColor];
    _textview.delegate = self;
    
    
}
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView {
    _textview.text = @"";
    _textview.textColor = [UIColor blackColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView {

    if(_textview.text.length == 0) {
        _textview.textColor = [UIColor lightGrayColor];
        _textview.text = @"Write your message...";
        [_textview resignFirstResponder];
    }
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (textView == _textview)
    {
       if ([text isEqualToString:@"\n"])
        {
            CGRect newFrame1 = _viewobj.frame;
            
            if ( newFrame1.size.height  < 150)
            {
                newFrame1.origin.y = newFrame1.origin.y - 10;
                newFrame1.size.height = newFrame1.size.height + 10;
                _viewobj.frame = newFrame1;
                
                CGRect newFrame = _textview.frame;
                
                newFrame.origin.y = newFrame.origin.y - 10;
                newFrame.size.height = newFrame.size.height + 10;
                _textview.frame = newFrame;
             }
         }
        else
        {
            if([text isEqualToString:@""])
            {
                CGRect newFrame1 = _viewobj.frame;
                if ( newFrame1.size.height >60)
                {
                    newFrame1.origin.y = newFrame1.origin.y + 10;
                    newFrame1.size.height = newFrame1.size.height - 10;
                    _viewobj.frame = newFrame1;
                    CGRect newFrame = _textview.frame;
                    newFrame.origin.y = newFrame.origin.y + 10;
                    newFrame.size.height = newFrame.size.height - 10;
                    _textview.frame = newFrame;
                }
             }
        }
    }
    return YES;
}

- (void)textViewFitToContent:(UITextView *)textView
{
    CGFloat fixedWidth = _textview.frame.size.width;
    CGSize newSize = [_textview sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = _textview.frame;
 
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    _textview.frame = newFrame;
    _textview.scrollEnabled = NO;
}

-(void) showUIAlertWithMessage:(NSString*)Message andTitle:(NSString*)title
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:title message:Message delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [alert show];
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if(_textview.text.length == 0) {
        _textview.textColor = [UIColor lightGrayColor];
        _textview.text = @"Write your message...";
        [_textview resignFirstResponder];
    }
    
    [textView setUserInteractionEnabled:YES];
    [textView resignFirstResponder];
    return YES;
}


-(void) tapped:(UIGestureRecognizer *) sender
{
    [_textview resignFirstResponder];
    // [_passwordTF resignFirstResponder];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
     __weak ChatViewController *controller = self;
    
    self.view.keyboardTriggerOffset = _viewobj.frame.size.height;
    [self.view addKeyboardPanningWithActionHandler:^(CGRect keyboardFrameInView, BOOL opening, BOOL closing) {
        /*
         Try not to call "self" inside this block (retain cycle).
         But if you do, make sure to remove DAKeyboardControl
         when you are done with the view controller by calling:
         [self.view removeKeyboardControl];
         */
        
        CGRect toolBarFrame = self.viewobj.frame;
        toolBarFrame.origin.y = keyboardFrameInView.origin.y - toolBarFrame.size.height;
        self.viewobj.frame = toolBarFrame;
        
        CGRect tableViewFrame = self.tableviewbj.frame;
        tableViewFrame.size.height = toolBarFrame.origin.y - 90;
        self.tableviewbj.frame = tableViewFrame;
        
        [controller tableViewScrollToBottomAnimated:NO];
    }];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.view endEditing:YES];
    
    [self.view removeKeyboardControl];
    // [self.gateway dismiss];
}
-(void)viewWillappear:(BOOL)animated
{
    
    _detail=[_detail1 valueForKey:@"friend_id"];
    _usernamelbl.text=[_detail1 valueForKey:@"friend_username"];
     [_tableviewbj reloadData];
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
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if(textView==_textview)
    {
        checktimer=@"scrolldown2";

        [self callallchathistory];
        [_chatbtnobj setEnabled:YES];
        [_chatbtnobj setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}


- (IBAction)BackBtnAction:(id)sender {
    if ([_sisuchatstr isEqualToString:@"checktherapist"])
    {
      //  [self.delegate sendDataToA:@"showmhpview"];
//        ChatfriendViewController *cvc=[[ChatfriendViewController alloc]init];
//        [cvc setTherapistviewstr:@"showmhpview"];
//        [self.delegateMethode backFromChatScreen:@"showmhpview"];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    [self callviewstatus];
    [timer2 invalidate];
    timer2 = nil;
}

- (IBAction)SendBtnAction:(id)sender {
    //    [self.tableviewbj scrollToRowAtIndexPath:[self.tableArray indexPathForLastMessage]
    //                          atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    //   if (self.chatTF.text.length >60)
    //    {
    //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sisuroot" message:@"Character limit is less than 46" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //        [alert show];
    //    }
    //    else
    //    {
    checktimer=@"scrolldown2";
    NSString *str;
    str = [_textview.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] ;
    _textview.text=str;
    NSString *msg = @"0";
    if([_textview.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
    {
        msg = @"Please type something";
    }
    if(_textview.text.length < 1 || [_textview.text isEqualToString:@" "])
    {
        msg = @"Please type something";
    }
    if (![msg isEqualToString:@"0"])
    {
         UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUROOT" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
        [alertcrp addButtonWithTitle:@"ok"];
        [alertcrp show];
    }
    else
    {
        [_chatbtnobj setUserInteractionEnabled:NO];
         // [_chatbtnobj setEnabled:NO];
        [_chatbtnobj setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        //[_textview resignFirstResponder];
        // _textview = [[UITextView alloc] initWithFrame:CGRectMake(23, 12, 284, 34)];
        [self callchatService];
    }
    // }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
     NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        if ([check isEqualToString:@"therapist"])
        {
            _Addparticipantview.hidden=NO;
        }
    }
    else if (buttonIndex == 1)
    {
        
    }
    
}

-(void)callchatService
{
   
//    NSArray* words = [_textview.text componentsSeparatedByCharactersInSet :[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    NSString* nospacestring = [words componentsJoinedByString:@""];

    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"chatapi" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    
    if ([[_detail1 valueForKey:@"chat_status"] integerValue]==1)
    {
        [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"senderid"];
        [dict1 setValue:@"1" forKey:@"chat_status"];
        [dict1 setValue:_textview.text forKey:@"msg"];
        
        if ([_strdetail isEqualToString:@"search"]) {
            [dict1 setValue:[_detail1 valueForKey:@"group_id" ] forKey:@"receiverid"];
        }
        [dict1 setValue:[_detail1 valueForKey:@"group_id"] forKey:@"receiverid"];
    }

    else if ([[_detail1 valueForKey:@"chat_status"] integerValue]==0)
    {
        [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"senderid"];
        if ([_strdetail isEqualToString:@"search"])
        {
            [dict1 setValue:_detail forKey:@"receiverid"];
            
        }
        [dict1 setValue:@"0" forKey:@"chat_status"];
        if ([check isEqualToString:@"therapist"])
        {
            [dict1 setValue:alltherapistIdString forKey:@"theorepist_status"];
            
        }
        [dict1 setValue:_detail forKey:@"receiverid"];
        [dict1 setValue:_textview.text forKey:@"msg"];
    }
    else if ([[_detail1 valueForKey:@"chat_status"] integerValue]==2)
    {
        [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"senderid"];
        if ([_strdetail isEqualToString:@"search"])
        {
            [dict1 setValue:_detail forKey:@"receiverid"];
        }
        [dict1 setValue:@"2" forKey:@"chat_status"];
        [dict1 setValue:_detail forKey:@"receiverid"];
        [dict1 setValue:_textview.text forKey:@"msg"];
    }
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"chat" :dict :dict1];
     _textview.text=@" ";
    [_chatbtnobj setUserInteractionEnabled:YES];
    //    senderidlbl=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]];
    //
    //    if ([_strdetail isEqualToString:@"search"]) {
    //        receiveridlbl =_detail;
    //
    //    }
    //    else
    //    {
    //        receiveridlbl =_detail;
    //    }
    //    sqlite3_stmt *statement;
    //    const char *dbpath = [_databasePath UTF8String];
    //
    //    if (sqlite3_open(dbpath, &_DB) == SQLITE_OK) {
    //
    //        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO chats (msg,senderid,receiverid) VALUES (\"%@\",\"%@\",\"%@\")", _chatTF.text,senderidlbl,receiveridlbl];
    //        const char *insert_statement = [insertSQL UTF8String];
    //        sqlite3_prepare_v2(_DB, insert_statement, -1, &statement, NULL);
    //        if (sqlite3_step(statement) == SQLITE_DONE) {
    //
    //            [self showUIAlertWithMessage:@"User added to the database" andTitle:@"Message"];
    //            _chatTF.text=@"";
    //        }
    //        else
    //        {
    //            [self showUIAlertWithMessage:@"Failed to add the user" andTitle:@"Error"];
    //
    //        }
    //        sqlite3_finalize(statement);
    //        [self callchathistory];
    //        sqlite3_close(_DB);
    //    }
    
    
    
}
-(void)callchathistory
{
    _textview.text = @"";
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"chatapi1" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    if ([[_detail1 valueForKey:@"chat_status"] integerValue]==1)
    {
        [dict1 setValue:@"1" forKey:@"chat_status"];
        if ([_strdetail isEqualToString:@"search"]) {
            [dict1 setValue:[_detail1 valueForKey:@"group_id" ] forKey:@"senderid"];
        }
        [dict1 setValue:[_detail1 valueForKey:@"group_id"] forKey:@"senderid"];
    }
    else if ([[_detail1 valueForKey:@"chat_status"] integerValue]==0)
    {
        [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"receiverid"];
        if ([_strdetail isEqualToString:@"search"])
        {
          [dict1 setValue:_detail forKey:@"senderid"];
        }
        [dict1 setValue:@"0" forKey:@"chat_status"];
        
        [dict1 setValue:_detail forKey:@"senderid"];
    }
    else if ([[_detail1 valueForKey:@"chat_status"] integerValue]==2)
    {
        [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"receiverid"];
        if ([_strdetail isEqualToString:@"search"])
        {
            [dict1 setValue:_detail forKey:@"senderid"];
        }
        [dict1 setValue:@"2" forKey:@"chat_status"];
        
        [dict1 setValue:_detail forKey:@"senderid"];
    }
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"chathistory" :dict :dict1];
}
-(void)callallchathistory
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"chatapi2" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    if ([[_detail1 valueForKey:@"chat_status"] integerValue]==1)
    {
        [dict1 setValue:@"1" forKey:@"chat_status"];
        if ([_strdetail isEqualToString:@"search"]) {
            [dict1 setValue:[_detail1 valueForKey:@"group_id" ] forKey:@"sender"];
            
        }
        [dict1 setValue:[_detail1 valueForKey:@"group_id"] forKey:@"sender"];
    }
    else if ([[_detail1 valueForKey:@"chat_status"] integerValue]==0)
    {
        _addparticipantBtnobj.hidden=YES;
        _Addtherapistobj.hidden=NO;
        
        // [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"sender"];
        [dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"sender"];
        
        if ([_strdetail isEqualToString:@"search"]) {
            [dict1 setValue:[_detail1 valueForKey:@"friend_id"] forKey:@"receiver"];
            
        }
        [dict1 setValue:[_detail1 valueForKey:@"friend_id"] forKey:@"receiver"];
        //  [dict1 setValue:@"1" forKey:@"view_status"];
        
        [dict1 setValue:@"0" forKey:@"chat_status"];
        
    }
    
    else if ([[_detail1 valueForKey:@"chat_status"] integerValue]==2)
    {
        _addparticipantBtnobj.hidden=YES;
        _Addtherapistobj.hidden=YES;
        [dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"sender"];
       if ([_strdetail isEqualToString:@"search"]) {
            [dict1 setValue:[_detail1 valueForKey:@"friend_id"] forKey:@"receiver"];
        }
        [dict1 setValue:[_detail1 valueForKey:@"friend_id"] forKey:@"receiver"];
       [dict1 setValue:@"2" forKey:@"chat_status"];
    }
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"chathistory_idwise" :dict :dict1];
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"chatapi"])
    {
        if ([[responseDictionary valueForKey:@"sucess"] integerValue] ==1)
        {
            [_chatbtnobj setUserInteractionEnabled:YES];
            _textview.text=@"";
            if([_textview.text isEqualToString:@""])
            {
               CGRect newFrame1 = _viewobj.frame;
                if ( _textview.frame.size.height > 60)
                {
                    newFrame1.origin.y = newFrame1.origin.y + 30;
                    newFrame1.size.height = newFrame1.size.height - 30;
                    _viewobj.frame = newFrame1;
                    
                    CGRect newFrame = _textview.frame;
                    newFrame.origin.y = newFrame.origin.y + 30;
                    newFrame.size.height = newFrame.size.height - 30;
                    _textview.frame = newFrame;
                }
                else if ( _textview.frame.size.height > 70)
                {
                    newFrame1.origin.y = newFrame1.origin.y + 60;
                    newFrame1.size.height = newFrame1.size.height - 60;
                    _viewobj.frame = newFrame1;
                   CGRect newFrame = _textview.frame;
                     newFrame.origin.y = newFrame.origin.y + 60;
                    newFrame.size.height = newFrame.size.height - 60;
                    _textview.frame = newFrame;
                }
                else if ( _textview.frame.size.height > 100)
                {
                    newFrame1.origin.y = newFrame1.origin.y + 100;
                    newFrame1.size.height = newFrame1.size.height - 100;
                    _viewobj.frame = newFrame1;
                    CGRect newFrame = _textview.frame;
                    newFrame.origin.y = newFrame.origin.y + 100;
                    newFrame.size.height = newFrame.size.height - 100;
                    _textview.frame = newFrame;
                 }
              }
 
            [self callchathistory];
            // strarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"chatapi1"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==1)
        {
            newarr=[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            [newarr mutableCopy];
            
            //            if ([newarr isEqual:(id)[NSNull null]] || [newarr isEqual:@""] )
            //            {
            
            //            }
            //            else
            //            {
 
            int lastIndex = [newarr count] - 1;
            strarr =[newarr objectAtIndex:lastIndex];
            
            [self callallchathistory];
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"chatapi2"])
    {
        
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==1)
        {
            strarr1 =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            [strarr1 mutableCopy];
            if ([checktimer isEqualToString:@"scrolldown"])
            {
                [_tableviewbj reloadData];

            }
            else if ([checktimer isEqualToString:@"scrolldown1"])
            {
                [_tableviewbj reloadData];
                checktimer=@"scrolldown2";
            }
            
            else if ([checktimer isEqualToString:@"scrolldown2"])
            {
                 int lastIndex = [strarr1 count] - 1;
                [_tableviewbj reloadData];
                NSIndexPath* ip = [NSIndexPath indexPathForRow:lastIndex inSection:0];
                [_tableviewbj scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionTop animated:NO];
                
            }
            else
            {
                int lastIndex = [strarr1 count] - 1;
                [_tableviewbj reloadData];
                NSIndexPath* ip = [NSIndexPath indexPathForRow:lastIndex inSection:0];
                [_tableviewbj scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionTop animated:NO];
            }
          }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"chatListing1"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            if ([[responseDictionary valueForKey:@"data"] isEqual:[NSNull null]])
            {
            }
            else
            {
                NSArray *localArray =[[NSArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                imgArr1 = [[NSMutableArray alloc] init];
                for (int i = 0; i <localArray.count; i++)
                {
                    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                    dict = [[localArray objectAtIndex:i] mutableCopy];
                    [dict setValue:@"0" forKey:@"status"];
                    [imgArr1 addObject:dict];
                }
                [_AdduserTableview reloadData];
            }
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"addgroup"])
    {
        _Addparticipantview.hidden=YES;
        [self callallchathistory];
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"TherapistListing"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            if ([[responseDictionary valueForKey:@"data"] isEqual:[NSNull null]])
            {
                
            }
            else
            {
                NSArray *localArray =[[NSArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                
                imgArr2 = [[NSMutableArray alloc] init];
                
                for (int i = 0; i <localArray.count; i++)
                {
                    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                    dict = [[localArray objectAtIndex:i] mutableCopy];
                    [dict setValue:@"0" forKey:@"status"];
                    [imgArr2 addObject:dict];
                }
                
                [_AdduserTableview reloadData];
                
            }
        }
    }
    
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"forgroupTherapistListing"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            if ([[responseDictionary valueForKey:@"data"] isEqual:[NSNull null]])
            {
                
            }
            else
            {
                NSArray *localArray =[[NSArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                
                imgArr2 = [[NSMutableArray alloc] init];
                
                for (int i = 0; i <localArray.count; i++)
                {
                    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                    dict = [[localArray objectAtIndex:i] mutableCopy];
                    [dict setValue:@"0" forKey:@"status"];
                    [imgArr2 addObject:dict];
                }
                
                [_AdduserTableview reloadData];
                
            }
        }
    }
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"CheckChatStatus"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==1)
        {
            
        }
        
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"groupusers"])
    {
        imgArr3 =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
        [_Gtableviewobj reloadData];
     }
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
        if (isScrollingStart)
        {
            isScrollingStart=NO;
            [self scrollingStopped];
            checktimer=@"scrolldown1";

        }
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    if (isScrollingStart)
    {
        isScrollingStart=NO;
        [self scrollingStopped];
        checktimer=@"scrolldown1";

    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    isScrollingStart=YES;
    checktimer=@"scrolldown";
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    isScrollingStart=YES;
}
-(void)scrollingStopped
{
    NSLog(@"Scrolling stopped");
    checktimer=@"scrolldown1";

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView== _tableviewbj)
    {
        return [strarr1 count];
    }
    else
    {
        if ([check isEqualToString:@"participant"])
        {
            return [imgArr1 count];
            
        }
        else if ([check isEqualToString:@"therapist"])
        {
            return [imgArr2 count];
            
        }
        else
        {
            return [imgArr3 count];
        }
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView== _tableviewbj)
    {
        static NSString *simpleTableIdentifier = @"ListtableView";
        ChatSendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ChatSendTableViewCell" owner:self options:nil];
           cell = [nib objectAtIndex:0];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        int lastIndex = [strarr1 count];
       [strarr1 insertObject:strarr atIndex:lastIndex];
       if ([[_detail1 valueForKey:@"chat_status"]integerValue]==1)
        {
            if ([[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"group_sender_id"] isEqual:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]]] ) {
                cell.mytextview.text= [[strarr1 objectAtIndex:indexPath.row]valueForKey:@"group_message"];
                cell.mytimelbl.text=@"";
                cell.mytextview.textContainer.lineBreakMode = NSLineBreakByCharWrapping;
                cell.mytextview.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
                cell.mylblview.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
                cell.mytimelbl.lineBreakMode = NSLineBreakByWordWrapping;
                cell.frndlblview.hidden=YES;
                NSString *imgStr = [[strarr1 objectAtIndex:indexPath.row]valueForKey:@"profile_pic"];
                 if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
                    {
                                                                     cell.senderimg.image = [UIImage imageNamed:@"user.png"];
                                                                 }
                                                                 else if([[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"img_status"] integerValue]==1)
                                                                 {
                                                                     [cell.senderimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]]] placeholderImage:nil];
                                                                     cell.senderimg.contentMode=UIViewContentModeScaleToFill;
                                                                 }
                                                                 else
                                                                 {
                                                                     [cell.senderimg setImageWithURL:[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"profile_pic"] placeholderImage:nil];
                                                                     cell.senderimg.contentMode=UIViewContentModeScaleToFill;
                                                                  }
            }
            else
            {
                cell.frndtextview.text=[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"group_message"];
                cell.frndtimelbl.text=[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"username"];
                cell.frndtextview.textContainer.lineBreakMode = NSLineBreakByCharWrapping;
                cell.frndtextview.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
                cell.frndlblview.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
                cell.frndtimelbl.lineBreakMode = NSLineBreakByWordWrapping;
                cell.mylblview.hidden=YES;
                NSString *imgStr = [[strarr1 objectAtIndex:indexPath.row]valueForKey:@"profile_pic"];
                                                            if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
                                                            {
                                                                cell.recieverimg.image = [UIImage imageNamed:@"user.png"];
                                                            }
                                                            else if([[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"img_status"] integerValue]==1)
                                                            {
                                                                [cell.recieverimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]]] placeholderImage:nil];
                                                                cell.recieverimg.contentMode=UIViewContentModeScaleToFill;
                                                            }
                                                            else
                                                            {
                                                                [cell.recieverimg setImageWithURL:[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"profile_pic"] placeholderImage:nil];
                                                                cell.recieverimg.contentMode=UIViewContentModeScaleToFill;
                                                             }
             }
        }
        
        else if ([[_detail1 valueForKey:@"chat_status"]integerValue]==0)
        {
            _showgroupdetailbtnobj.hidden=YES;
            if ([[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"m_senderid"] isEqual:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]]] && [[[strarr1 objectAtIndex:indexPath.row] valueForKey:@"m_receiverid"] isEqual:_detail] ) {
               if ([[[strarr1 objectAtIndex:indexPath.row] valueForKey:@"theorepist_status"]integerValue]==1) {
                    cell.frndtimelbl.text=[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"theorepist_name"];
                    cell.frndtextview.text=[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"m_msg"];
                  
                    cell.frndtextview.textContainer.lineBreakMode = NSLineBreakByCharWrapping;
                    cell.frndtextview.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
                    cell.frndlblview.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
                   cell.frndtimelbl.lineBreakMode = NSLineBreakByWordWrapping;
                   cell.mylblview.hidden=YES;
                }
                else
                {
                    cell.mytextview.text=[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"m_msg"];
                    
                    cell.mytimelbl.text=@" ";
                    cell.mytextview.textContainer.lineBreakMode = NSLineBreakByCharWrapping;
                    cell.mytextview.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
                    cell.mylblview.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
                    cell.mytimelbl.lineBreakMode = NSLineBreakByWordWrapping;
                     cell.frndlblview.hidden=YES;
                 }
            }
            else if ([[[strarr1 objectAtIndex:indexPath.row] valueForKey:@"m_senderid"] isEqual:_detail] && [[[strarr1 objectAtIndex:indexPath.row] valueForKey:@"m_receiverid"] isEqual:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]]] )
            {
               if ([[[strarr1 objectAtIndex:indexPath.row] valueForKey:@"theorepist_status"]integerValue]==1) {
                    cell.frndtimelbl.text=[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"theorepist_name"];
                }
                else
                {
                    cell.frndtimelbl.text=@" ";
                }
                cell.frndtextview.text=[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"m_msg"];
                
               cell.frndtextview.textContainer.lineBreakMode = NSLineBreakByCharWrapping;
               cell.frndtextview.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
               cell.frndlblview.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
               cell.frndtimelbl.lineBreakMode = NSLineBreakByWordWrapping;
               cell.mylblview.hidden=YES;
            }
            if(cell.mytextview.text.length>1)
                {
                    NSString *imgStr = [[strarr1 objectAtIndex:indexPath.row]valueForKey:@"sender_img"];
                                                  if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
                                                  {
                                                      cell.senderimg.image = [UIImage imageNamed:@"user.png"];
                                                  }
                                                  else if([[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"sender_img_status"] integerValue]==1)
                                                  {
                                                      [cell.senderimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"sender_img"]]] placeholderImage:nil];
                                                      cell.senderimg.contentMode=UIViewContentModeScaleToFill;
                                                  }
                                                  else
                                                  {
                                                      [cell.senderimg setImageWithURL:[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"sender_img"] placeholderImage:nil];
                                                      cell.senderimg.contentMode=UIViewContentModeScaleToFill;
                                                   }
               }
                else
            {
                NSString *imgStr = [[strarr1 objectAtIndex:indexPath.row]valueForKey:@"sender_img"];
                               if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
                               {
                                   cell.recieverimg.image = [UIImage imageNamed:@"user.png"];
                               }
                               else if([[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"sender_img_status"] integerValue]==1)
                               {
                                   [cell.recieverimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"sender_img"]]] placeholderImage:nil];
                                   cell.recieverimg.contentMode=UIViewContentModeScaleToFill;
                               }
                               else
                               {
                                   [cell.recieverimg setImageWithURL:[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"sender_img"] placeholderImage:nil];
                                   cell.recieverimg.contentMode=UIViewContentModeScaleToFill;
                                }
               }

              
        }
         else if ([[_detail1 valueForKey:@"chat_status"]integerValue]==2)
        {
            
           _showgroupdetailbtnobj.hidden=YES;
            if ([[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"sender_id"] isEqual:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]]] && [[[strarr1 objectAtIndex:indexPath.row] valueForKey:@"receiver_id"] isEqual:_detail] ) {
                
                cell.mytextview.text=[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"msg"];
               
                cell.mytimelbl.text=@" ";
                cell.mytextview.textContainer.lineBreakMode = NSLineBreakByCharWrapping;
                cell.mytextview.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
                cell.mylblview.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
                cell.mytimelbl.lineBreakMode = NSLineBreakByWordWrapping;
                 cell.frndlblview.hidden=YES;
                NSString *imgStr = [[strarr1 objectAtIndex:indexPath.row]valueForKey:@"profile_pic"];
                if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
                   {
                                                                    cell.senderimg.image = [UIImage imageNamed:@"user.png"];
                                                                }
                                                                else if([[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"img_status"] integerValue]==1)
                                                                {
                                                                    [cell.senderimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]]] placeholderImage:nil];
                                                                    cell.senderimg.contentMode=UIViewContentModeScaleToFill;
                                                                }
                                                                else
                                                                {
                                                                    [cell.senderimg setImageWithURL:[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"profile_pic"] placeholderImage:nil];
                                                                    cell.senderimg.contentMode=UIViewContentModeScaleToFill;
                                                                 }
            }
            else if ([[[strarr1 objectAtIndex:indexPath.row] valueForKey:@"sender_id"] isEqual:_detail] && [[[strarr1 objectAtIndex:indexPath.row] valueForKey:@"receiver_id"] isEqual:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]]] )
            {
               cell.frndtextview.text=[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"msg"];
                
                cell.frndtimelbl.text=@" ";
                cell.frndtextview.textContainer.lineBreakMode = NSLineBreakByCharWrapping;
               cell.frndtextview.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
               cell.frndlblview.autoresizingMask = UIViewAutoresizingFlexibleHeight & UIViewAutoresizingFlexibleWidth;
              cell.frndtimelbl.lineBreakMode = NSLineBreakByWordWrapping;
              cell.mylblview.hidden=YES;
                NSString *imgStr = [[strarr1 objectAtIndex:indexPath.row]valueForKey:@"profile_pic"];
                if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
                {
                    cell.recieverimg.image = [UIImage imageNamed:@"user.png"];
                }
                else if([[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"img_status"] integerValue]==1)
                {
                    [cell.recieverimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]]] placeholderImage:nil];
                    cell.recieverimg.contentMode=UIViewContentModeScaleToFill;
                }
                else
                {
                    [cell.recieverimg setImageWithURL:[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"profile_pic"] placeholderImage:nil];
                    cell.recieverimg.contentMode=UIViewContentModeScaleToFill;
                 }
            }
    }
        return cell;
    }
    
    else if (tableView==_Gtableviewobj)
    {
        static NSString *simpleTableIdentifier = @"chatfriendTableView";
        chatfriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"chatfriendTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        cell.mhpinfo.hidden=YES;
        cell.mhpinfoimg.hidden=YES;

        cell.selectBtnobj.hidden=YES;
        cell.cellBtnobj.hidden=YES;
        cell.countlbl.hidden=YES;
        cell.onlinelbl.hidden=YES;
        
        cell.Usernamelbl.text=[[imgArr3 objectAtIndex:indexPath.row]valueForKey:@"username"];
        
        NSString *imgStr1 = [[imgArr3 objectAtIndex:indexPath.row]valueForKey:@"profile_img"];
        
        if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
        {
            cell.Userimg.image = [UIImage imageNamed:@"user.png"];
            
        }
        else
        {
            if([[[imgArr3 objectAtIndex:indexPath.row] valueForKey:@"image_status"] integerValue]== 1)
            {
                  [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[imgArr3 objectAtIndex:indexPath.row]valueForKey:@"profile_img"]] placeholderImage:nil];
            }
            else if([[[imgArr3 objectAtIndex:indexPath.row] valueForKey:@"image_status"] integerValue]== 0)
            {
                [cell.Userimg setImageWithURL:[[imgArr3 objectAtIndex:indexPath.row]valueForKey:@"profile_img"]placeholderImage:nil];
                cell.Userimg.contentMode=UIViewContentModeScaleToFill;
                
            }
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        return cell;
    }
   
    else
    {
        static NSString *simpleTableIdentifier = @"chatfriendTableView";
        
        chatfriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"chatfriendTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
            cell.mhpinfo.hidden=YES;
        cell.mhpinfoimg.hidden=YES;
        _showgroupdetailbtnobj.hidden=YES;

        cell.cellBtnobj.tag = indexPath.row;
        [cell.cellBtnobj addTarget:self action:@selector(EmotionAction1:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.selectBtnobj.hidden=YES;
        cell.cellBtnobj.hidden=NO;
        
        if ([check isEqualToString:@"therapist"])
        {
            _showgroupdetailbtnobj.hidden=YES;

            NSString *imgStr2 = [[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"friend_username"];
            
            if ([imgStr2 isEqual:(id)[NSNull null]] || [imgStr2 isEqualToString:@""])
            {
                
                
            }
            else
            {
                
                if ([[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"online_status"] isEqual:@"1"])
                {
                    cell.onlinelbl.hidden=NO;
                    cell.backlblobj.backgroundColor = [[UIColor alloc] initWithRed:177.0/255.0 green:248.0/255.0 blue:177.0/255.0 alpha:1.0];
                }
                else
                {
                    cell.onlinelbl.hidden=YES;
                }
                
                
                cell.countlbl.hidden=YES;
                cell.selectBtnobj.hidden=NO;
                
                if ([[[imgArr2 objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 0)
                {
                    
                    cell.selectBtnobj.image = [UIImage imageNamed:@"icons8-0_percents.png"];
                }
                else
                {
                    [_DoneBtnActionobj setUserInteractionEnabled:YES];
                    
                    cell.selectBtnobj.image = [UIImage imageNamed:@"icons8-ok_filled.png"];
                    
                }
                
                cell.Usernamelbl.text=[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"friend_username"];
                
                NSString *imgStr1 = [[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"friend_img"];
                
                if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
                {
                    cell.Userimg.image = [UIImage imageNamed:@"user.png"];
                    
                }
                else
                {
                    if([[[imgArr2 objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 1)
                        
                    {
                          [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"friend_img"]] placeholderImage:nil];
                        
                      //  [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"friend_img"]] placeholderImage:nil];
                    }
                    else if([[[imgArr2 objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 0)
                    {
                        [cell.Userimg setImageWithURL:[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"friend_img"]placeholderImage:nil];
                        cell.Userimg.contentMode=UIViewContentModeScaleToFill;
                        
                    }
                }
                
            }
        }
        else if ([check isEqualToString:@"participant"])
        {
            NSString *imgStr2 = [[imgArr1 objectAtIndex:indexPath.row]valueForKey:@"friend_username"];
            
            if ([imgStr2 isEqual:(id)[NSNull null]] || [imgStr2 isEqualToString:@""])
            {
                
            }
            else
            {
                cell.countlbl.hidden=YES;
                cell.selectBtnobj.hidden=NO;
                
                if ([[[imgArr1 objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 0)
                {
                    
                    cell.selectBtnobj.image = [UIImage imageNamed:@"icons8-0_percents.png"];
                }
                else
                {
                    [_DoneBtnActionobj setUserInteractionEnabled:YES];
                    
                    cell.selectBtnobj.image = [UIImage imageNamed:@"icons8-ok_filled.png"];
                    
                }
                
                cell.Usernamelbl.text=[[imgArr1 objectAtIndex:indexPath.row]valueForKey:@"friend_username"];
                
                NSString *imgStr1 = [[imgArr1 objectAtIndex:indexPath.row]valueForKey:@"friend_img"];
                
                if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
                {
                    cell.Userimg.image = [UIImage imageNamed:@"user.png"];
                    
                }
                else
                {
                    if([[[imgArr1 objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 1)
                        
                    {
                          [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[imgArr1 objectAtIndex:indexPath.row]valueForKey:@"friend_img"]] placeholderImage:nil];
                        
                      //  [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[imgArr1 objectAtIndex:indexPath.row]valueForKey:@"friend_img"]] placeholderImage:nil];
                    }
                    else if([[[imgArr1 objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 0)
                    {
                        [cell.Userimg setImageWithURL:[[imgArr1 objectAtIndex:indexPath.row]valueForKey:@"friend_img"]placeholderImage:nil];
                        cell.Userimg.contentMode=UIViewContentModeScaleToFill;
                        
                    }
                }
                
            }
            
        }
        
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
}

- (void)tableViewScrollToBottomAnimated:(BOOL)animated
{
    
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_tableviewbj)
    {
        return UITableViewAutomaticDimension;
    }
    else
    {
        return 87;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return   UITableViewAutomaticDimension;
    
    if (tableView==_tableviewbj)
    {
        
        //        if (indexPath.section == 1 && indexPath.row == 0) {
        //            return _textview.frame.size.height + 40;
        //        }
        return UITableViewAutomaticDimension;
    }
    else
    {
        return 87;
        
    }
    
}


-(void)inputbarDidChangeHeight:(CGFloat)new_height
{
    //Update DAKeyboardControl
    self.view.keyboardTriggerOffset = new_height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

-(void)EmotionAction1  : (UIButton *) btn
{
    if([check isEqualToString:@"therapist"])
    {
        NSMutableDictionary *localDict = [[NSMutableDictionary alloc] init];
        
        localDict = [imgArr2 objectAtIndex:btn.tag];
        
        if ([[localDict valueForKey:@"status"] integerValue] == 0)
        {
            [localDict setValue:@"1" forKey:@"status"];
            [_DoneBtnActionobj setUserInteractionEnabled:YES];
            
        }
        else
        {
            
            [localDict setValue:@"0" forKey:@"status"];
        }
        [_AdduserTableview reloadData];
    }
    else
    {
        NSMutableDictionary *localDict = [[NSMutableDictionary alloc] init];
        
        localDict = [imgArr1 objectAtIndex:btn.tag];
        
        if ([[localDict valueForKey:@"status"] integerValue] == 0)
        {
            [localDict setValue:@"1" forKey:@"status"];
            [_DoneBtnActionobj setUserInteractionEnabled:YES];
            
        }
        else
        {
            
            [localDict setValue:@"0" forKey:@"status"];
        }
        [_AdduserTableview reloadData];
    }
    
}

/*
 cell.textLabel.text=[[strarr1 objectAtIndex:indexPath.row]valueForKey:@"m_msg"];
 // cell.mylblview = [[UIView alloc] initWithFrame:frame];
 // cell.mylblview.backgroundColor = [UIColor clearColor];
 cell.textLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
 
 [cell.textLabel setNumberOfLines:0];
 [cell.textLabel setTextAlignment:NSTextAlignmentRight];
 [cell.textLabel setTextColor:[UIColor whiteColor]];
 // cell.textLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
 //cell.mylbl.sizeToFit;
 // cell.textLabel.sizeToFit;
 [[cell imageView] setImage:[UIImage imageNamed:@"bubble Mine"]];
 
 
 [cell.imageView addSubview:cell.textLabel];
 
 cell.imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
 
 cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
 
 // [cell.mylblviewimg addSubview:cell.mylbl];
 //  cell.mylblviewimg.sizeToFit;
 [cell.contentView addSubview:cell.imageView];
 
 //cell.mylblviewimg.autoresizingMask = UIViewAutoresizingFlexibleWidth;
 
 
 // cell.contentView.sizeToFit;
 
 
 // cell.mylblview.sizeToFit;
 //cell.mylbl.center = cell.mylblviewimg.center;
 
 // [cell.mylblview addSubview:cell.mylbl];
 
 
 
 // [ cell.mylbl sizetofit];
 //        if (cell.frndlbl.text.length <1) {
 //            cell.frndlblview.hidden=YES;
 //        }
 */
- (IBAction)setbacklgroundBtn:(id)sender {
    
    
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Camera" otherButtonTitles:@"Gallery", nil];
    [actionSheet setTag:6];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [actionSheet showInView:self.view];
}




-(void)actionSheet:(UIActionSheet *)profileactionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    switch (buttonIndex)
    {
        case 0:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                imagePicker.sourceType =UIImagePickerControllerSourceTypeCamera;
                [self presentModalViewController:imagePicker animated:YES];
            }
            break;
        case 1:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
                {
                    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
                    
                    if (status == PHAuthorizationStatusAuthorized)
                    {
                        imagePicker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                        [self presentModalViewController:imagePicker animated:YES];
                    }
                    
                    else if (status == PHAuthorizationStatusDenied) {
                        
                    }
                    
                    else if (status == PHAuthorizationStatusNotDetermined) {
                        
                        // Access has not been determined.
                        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                            
                            if (status == PHAuthorizationStatusAuthorized) {
                                // Access has been granted.
                                 imagePicker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                                [self presentModalViewController:imagePicker animated:YES];
                            }
                            
                            else {
                                // Access has been denied.
                            }
                        }];
                    }
                    
                    else if (status == PHAuthorizationStatusRestricted) {
                        // Restricted access - normally won't happen.
                    }
                    
                }
            
            break;
        default:
            break;
    }
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize
{
    CGFloat scale = 1.00f;
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
    [img drawInRect:CGRectMake(0,0,newSize.width/2,newSize.height/2)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    
    // UIImage *originalImage = [info objectForKey:@"UIImagePickerControllerCropRect"];
    _backimg.image=originalImage;
    
    
    
    CGRect rect = CGRectMake(0,0,200,200);
    
    UIImage *imggs = [self  imageResize :[info objectForKey:UIImagePickerControllerEditedImage] andResizeTo:rect.size];
    
    
    // NSData *daataa = UIImagePNGRepresentation([info objectForKey:UIImagePickerControllerEditedImage]);
    NSData *daataa = UIImagePNGRepresentation(imggs);
    
    base64_encoded_image =  [Base64 encode:daataa];
    
    NSDate *dtTime = [NSDate date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MMM-yyyy hh-MM-ss"];
    imageNameStr = [df stringFromDate:dtTime];
    
    NSArray *arra = [imageNameStr componentsSeparatedByString:@" "];
    
    imageNameStr = [NSString stringWithFormat:@"%@%@",[arra objectAtIndex:0],[arra objectAtIndex:1]];
    
    [picker dismissViewControllerAnimated:YES completion:Nil];
    // [self callbackgroundimage];
}

-(void) processFailed :(NSError *)responseDictionary
{
    // ActivityIdenter.hidden=NO;
    [ self callallchathistory];
    NSLog(@"error");
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"You should connect with wifi for optimal use." delegate:nil cancelButtonTitle:@"RETRY" otherButtonTitles:nil, nil];
    //    alert.tag=2000;
    //    [alert show];
    
}


//-(void) callbackgroundimage
//{
//    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//    [dict setValue:@"chatimg" forKey:@"name"];
//
//    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
//    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
//
//  //  [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"sender"];
//
//    [dict1 setValue:_backimg.image forKey:@"image"];
//
//
//    [webServiceManager setDelegateMethode:self];
//    [webServiceManager callMyWebServiceManagerByGet:@"/background_image_save" :dict :dict1];
//}

- (IBAction)AddparticipantBtnAction:(id)sender {
    _Addparticipantview.hidden=NO;
    check=@"participant";
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"chatListing1" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    if ([_strdetail isEqualToString:@"search"]) {
        [dict1 setValue:[_detail1 valueForKey:@"group_id" ] forKey:@"group_id"];
        
    }
    [dict1 setValue:[_detail1 valueForKey:@"group_id"] forKey:@"group_id"];
    // [dict1 setValue:[_detail1 valueForKey:@"group_id"] forKey:@"group_id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"addfrndingroupfetchall" :dict :dict1];
}

- (IBAction)BackaddparticipantBtn:(id)sender {
    _Addparticipantview.hidden=YES;
    
}

- (IBAction)DoneBtnAction:(id)sender {
    //    _Addparticipantview.hidden=YES;
    
    if ([check isEqualToString:@"therapist"])
    {
        _Addparticipantview.hidden=YES;
        
        //  NSString *allContactIdString;
        for (int i = 0; i < imgArr2.count; i++)
        {
            if ([[[imgArr2 objectAtIndex:i] valueForKey:@"status"] integerValue] == 1)
            {
                if (i == 0)
                {
                    alltherapistIdString = [[imgArr2 objectAtIndex:i] valueForKey:@"friend_id"];
                }
                else
                {
                    alltherapistIdString = [NSString stringWithFormat:@"%@,%@",alltherapistIdString,[[imgArr2 objectAtIndex:i] valueForKey:@"friend_id"]];
                }
            }
        }
        MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setValue:@"addgroup" forKey:@"name"];
        
        NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
         [dict1 setValue:alltherapistIdString forKey:@"user_id"];
        
        // [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"admin_id"];
        if ([_strdetail isEqualToString:@"search"]) {
            [dict1 setValue:[_detail1 valueForKey:@"group_id" ] forKey:@"group_id"];
            
        }
        [dict1 setValue:[_detail1 valueForKey:@"group_id"] forKey:@"group_id"];
        
        
        [webServiceManager setDelegateMethode:self];
        [webServiceManager callMyWebServiceManager:@"AddNewUserInGroup" :dict :dict1];
    }
    else if([check isEqualToString:@"participant"])
    {
        NSString *allContactIdString;
        for (int i = 0; i < imgArr1.count; i++)
        {
            if ([[[imgArr1 objectAtIndex:i] valueForKey:@"status"] integerValue] == 1)
            {
                if (i == 0)
                {
                    allContactIdString = [[imgArr1 objectAtIndex:i] valueForKey:@"friend_id"];
                }
                else
                {
                    allContactIdString = [NSString stringWithFormat:@"%@,%@",allContactIdString,[[imgArr1 objectAtIndex:i] valueForKey:@"friend_id"]];
                    
                }
            }
        }
        
        //        UIImageView *imagestr;
        //        imagestr.image = [UIImage imageNamed:@"icons8-ok_filled.png"];
        
        MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setValue:@"addgroup" forKey:@"name"];
        
        NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
        // [dict1 setValue:_GroupNameTF.text forKey:@"group_name"];
        //[dict1 setValue:imagestr forKey:@"image"];
        
        [dict1 setValue:allContactIdString forKey:@"user_id"];
        
        // [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"admin_id"];
        if ([_strdetail isEqualToString:@"search"]) {
            [dict1 setValue:[_detail1 valueForKey:@"group_id" ] forKey:@"group_id"];
            
        }
        [dict1 setValue:[_detail1 valueForKey:@"group_id"] forKey:@"group_id"];
        
        
        [webServiceManager setDelegateMethode:self];
        [webServiceManager callMyWebServiceManager:@"AddNewUserInGroup" :dict :dict1];
    }
}
- (IBAction)AddtherapistAction:(id)sender {
    _addparticipant.text=@"List";
    if ([[_detail1 valueForKey:@"chat_status"] integerValue]==1)
    {
       
        
        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Sisuchat_Status"] isEqual:@"0"])
        {
            
            UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"The content of your chats is monitored by a mental health professional to intervene in case of emergency." message:@"Do not share your personal identifiable  information in chats. In case of serious danger to you or to others, the personal identifiable information will be used. SISUROOT is not responsible for the content of your chat conversations. Do you agree?" delegate:self cancelButtonTitle:@"Agree" otherButtonTitles:nil];
            [alertcrp addButtonWithTitle:@"Disagree"];
            [alertcrp show];
            
            check=@"therapist";
            
            MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
            [dict setValue:@"forgroupTherapistListing" forKey:@"name"];
            
            NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
            //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
            
            // [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
            [dict1 setValue:[_detail1 valueForKey:@"group_id"] forKey:@"group_id"];
            
            [webServiceManager setDelegateMethode:self];
            [webServiceManager callMyWebServiceManager:@"forgroupTherapistListing" :dict :dict1];
            
        }
        else
        {
            BS1ViewController *bs1 = [[BS1ViewController alloc]init];
            [self.navigationController pushViewController:bs1 animated:YES];
            
        }
    }
    else
    {
        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Sisuchat_Status"] isEqual:@"0"])
        {
            
            UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"The content of your chats is monitored by a mental health professional to intervene in case of emergency." message:@"Do not share your personal identifiable  information in chats. In case of serious danger to you or to others, the personal identifiable information will be used. SISUROOT is not responsible for the content of your chat conversations. Do you agree?" delegate:self cancelButtonTitle:@"Agree" otherButtonTitles:nil];
            [alertcrp addButtonWithTitle:@"Disagree"];
            [alertcrp show];
            
            check=@"therapist";
            
            MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
            [dict setValue:@"TherapistListing" forKey:@"name"];
            
            NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
            //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
            
            [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
            
            [webServiceManager setDelegateMethode:self];
            [webServiceManager callMyWebServiceManager:@"TherapistListing" :dict :dict1];
        }
        else{
            
            
            BS1ViewController *bs1 = [[BS1ViewController alloc]init];
            [self.navigationController pushViewController:bs1 animated:YES];
        }
      }
}
-(void)callviewstatus
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"CheckChatStatus" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"receiver"];
    if ([_strdetail isEqualToString:@"search"])
    {
        [dict1 setValue:_detail forKey:@"sender"];
    }
    
    [dict1 setValue:@"1" forKey:@"view_status"];
    if ([[_detail1 valueForKey:@"chat_status"] integerValue]==1)
    {
        [dict1 setValue:[_detail1 valueForKey:@"group_id"] forKey:@"group_id"];
        [dict1 setValue:@"1" forKey:@"chat_status"];
        
    }
    else if ([[_detail1 valueForKey:@"chat_status"] integerValue]==0)
    {
        [dict1 setValue:[_detail1 valueForKey:@"friend_id"] forKey:@"sender"];
        [dict1 setValue:@"0" forKey:@"chat_status"];
        
    }
    else if ([[_detail1 valueForKey:@"chat_status"] integerValue]==2)
    {
        [dict1 setValue:[_detail1 valueForKey:@"friend_id"] forKey:@"sender"];
        [dict1 setValue:@"2" forKey:@"chat_status"];
        
    }
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"CheckChatStatus" :dict :dict1];
}


-(void)callgroupdetail
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"groupusers" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    // [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [dict1 setValue:[_detail1 valueForKey:@"group_id"] forKey:@"group_id"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"groupusers" :dict :dict1];
}

- (IBAction)GbackbtnAction:(id)sender {
    _Gviewobj.hidden=YES;
}

- (IBAction)ShowGroupDetailBtnAction:(id)sender {
    _Gviewobj.hidden=NO;
    //check=@"groupdetail";
    [self callgroupdetail];
}
@end
