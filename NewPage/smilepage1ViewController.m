
#import "smilepage1ViewController.h"
#import "LeftViewController.h"
#import "SWRevealViewController.h"
#import "FeedViewController.h"
#import "MyWebserviceManager.h"
#import "AFHTTPRequestOperationManager.h"
#import "Base64.h"
#import <Photos/Photos.h>
#import "UIView+RNActivityView.h"
#import "UIImageView+WebCache.h"
#import "Reachability.h"
#import "UIView+Toast.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "GalleryViewController.h"
#import "FriendsViewController.h"
#import "ViewController.h"
#import "ChatfriendViewController.h"
#import "BS1ViewController.h"
#import "ResponseViewController.h"
#import "UIView+RNActivityView.h"
#import "AFHTTPSessionManager.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "GraphView1.h"
#import "GraphView.h"
#import "chattypeViewController.h"
#import "Sisuroot-Swift.h"
@import AVFoundation;
@import AVKit;
@interface smilepage1ViewController ()
{
    int bgselect;
    int bgselect1;
    int ques_select;
    int filterquesselect;
    int fil_ques_Sel;
    NSString *rememberstr;
    NSString *searchtextstr;
    NSString *str_videoname;
    NSMutableURLRequest *request;
    NSData *imageData;
    NSString *img_name;
    NSString *todaydate;
}
@end
@implementation smilepage1ViewController


- (IBAction)swipedRight:(UISwipeGestureRecognizer *)recognizer
{
    bgselect=0;
    bgselect1=0;
    
    if(_searchbar.text.length==0)
    {
        if(ques_select>0)
        {
         ques_select--;
        }
        else if(ques_select==0)
        {
            ques_select=(int)_arr_ques.count-1;
        }
        _arr_ques1 = [[_arr_ans valueForKey:@"Answer"] objectAtIndex:ques_select];
        __arr_ques1video= [[_arr_ans_video valueForKey:@"Answer"] objectAtIndex:ques_select];
        [self bindData];
        [self bindDatavideo];
        _sel_quesid=[_arr_ques_id objectAtIndex:ques_select];
        _lbl_question.text =[_arr_ques objectAtIndex:ques_select];
    }
    else
    {
        if(filterquesselect>0)
        {
            filterquesselect--;
        }
        else if(filterquesselect==0)
        {
                filterquesselect=(int)_arr_search.count-1;
        }
        NSString *qq_sel_search=[_arr_search objectAtIndex:filterquesselect];
        fil_ques_Sel=(int)[_arr_ques_id indexOfObject:qq_sel_search];
         _arr_ques1 = [[_arr_ans valueForKey:@"Answer"] objectAtIndex:fil_ques_Sel];
         __arr_ques1video = [[_arr_ans_video valueForKey:@"Answer"] objectAtIndex:fil_ques_Sel];
        [self bindData];
        [self bindDatavideo];
        _sel_quesid=[_arr_ques_id objectAtIndex:fil_ques_Sel];
        _lbl_question.text=[_arr_ques objectAtIndex:fil_ques_Sel];
    }
}

- (IBAction)swipedLeft:(UISwipeGestureRecognizer *)recognizer
{
    if(_searchbar.text.length==0)
    {
        bgselect=0;
        bgselect1=0;
        if(ques_select<_arr_ques.count-1)
        {
            ques_select++;
        }
        else if(ques_select ==_arr_ques.count-1)
        {
             ques_select=0;
        }
        _arr_ques1 = [[_arr_ans valueForKey:@"Answer"] objectAtIndex:ques_select];
        __arr_ques1video = [[_arr_ans_video valueForKey:@"Answer"] objectAtIndex:ques_select];
        [self bindData];
        [self bindDatavideo];
        _sel_quesid=[_arr_ques_id objectAtIndex:ques_select];
        _lbl_question.text =[_arr_ques objectAtIndex:ques_select];
    }
    else
    {
        bgselect=0;
        bgselect1=0;
        if(filterquesselect<_arr_search.count-1)
        {
            filterquesselect++;
        }
        else  if(filterquesselect == _arr_search.count-1)
        {
            filterquesselect=0;
        }
        NSString *qq_sel_search=[_arr_search objectAtIndex:filterquesselect];
        fil_ques_Sel=(int)[_arr_ques_id indexOfObject:qq_sel_search];
        _arr_ques1 = [[_arr_ans valueForKey:@"Answer"] objectAtIndex:fil_ques_Sel];
        __arr_ques1video = [[_arr_ans_video valueForKey:@"Answer"] objectAtIndex:fil_ques_Sel];
        [self bindData];
        [self bindDatavideo];
        _sel_quesid=[_arr_ques_id objectAtIndex:fil_ques_Sel];
        _lbl_question.text=[_arr_ques objectAtIndex:fil_ques_Sel];
    }
    NSLog(@"swiped left");
}

- (IBAction)btn_addfriends:(id)sender {
    UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUROOT" message:@"Do you want to send friend request?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:nil];
    [alertcrp addButtonWithTitle:@"YES"];
    alertcrp.tag=1;
    [alertcrp show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        if(alertView.tag==3)
        {
            _view_add_ques.hidden=YES;
            _str_add_question=@"";
            [self.view makeToast:@"Saved Successfully"  duration:2.0 position:CSToastPositionBottom];
            [self callThisWebservice];
            _txt_question.textColor = [UIColor lightGrayColor];
            _txt_question.text = @"What would you like to ask the community?";
            [_txt_question resignFirstResponder];
        }
    }
    else
    {
        if(alertView.tag==3)
        {
            _view_add_ques.hidden=YES;
            _view_main3.hidden=NO;
            _btn_back_add_frind.hidden=NO;
            _btn_back.hidden=YES;
            _view_video_cap.hidden=YES;
           _view_write_n_ans.hidden=NO;
            [_btn_video setImage:[UIImage imageNamed:@"facetime-button (1).png"] forState:UIControlStateNormal];
            [_btn_comment setImage:[UIImage imageNamed:@"write (1).png"] forState:UIControlStateNormal];
        }
        else
        {
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Inner" otherButtonTitles:@"Outer",nil];
            [actionSheet setTag:6];
            actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
            [actionSheet showInView:self.view];
        }
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
   if (textView==_txt_question)
    {
        if ([_txt_question.text isEqualToString:@"What would you like to ask the community?"]) {
            _txt_question.text=@"";
            _txt_question.textColor = [UIColor blackColor];
        }
    }
    else if(textView == _txtview_write_ans)
    {
        if ([_txtview_write_ans.text isEqualToString:@"Write Here..."]) {
            _txtview_write_ans.text=@"";
            _txtview_write_ans.textColor = [UIColor blackColor];
        }
    }
}

- (void)viewDidLoad {
    
    [FIRAnalytics setScreenName:@"Q&A" screenClass:@"Q&A"];
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
     graphView.backgroundColor = [UIColor clearColor];
     GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
     graphView1.backgroundColor = [UIColor clearColor];
     [self.view_footer1 addSubview:graphView];
     [self.view_footer2 addSubview:graphView1];
    [self currentdate];
   [self.view showActivityViewWithLabel:@"Loading"];
     self.navigationController.navigationBar.hidden=YES;
   
    self.searchbar.delegate=self;
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = NO;
    revealController.tapGestureRecognizer.enabled=NO;
  //  [revealController panGestureRecognizer];
 //   [revealController tapGestureRecognizer];
     [_btn_back addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
   
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = _view_ques.bounds;
    gradient.colors = @[(id)[UIColor colorWithRed:(5.0/255.0) green:(151.0/255) blue:(183.0/255) alpha:1].CGColor, (id)[UIColor colorWithRed:(35.0/255.0) green:(37.0/255) blue:(82.0/255) alpha:1].CGColor];
    [_view_ques.layer insertSublayer:gradient atIndex:0];
    
    CAGradientLayer *gradient1 = [CAGradientLayer layer];
    gradient1.frame = _view_ques.bounds;
    gradient1.colors = @[(id)[UIColor colorWithRed:(5.0/255.0) green:(151.0/255) blue:(183.0/255) alpha:1].CGColor, (id)[UIColor colorWithRed:(5.0/255.0) green:(7.0/255) blue:(43.0/255) alpha:1].CGColor];
    [_view3_header.layer  insertSublayer:gradient1 atIndex:0];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(queue, ^{
         [self callfetchprofile];
          dispatch_async(dispatch_get_main_queue(), ^{
        });
    });
    dispatch_queue_t queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(queue1, ^{
         [self callThisWebservice];
          dispatch_async(dispatch_get_main_queue(), ^{
        
        });
    });
    dispatch_queue_t queue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue2, ^{
         [self callThisWebservicevideo];
          dispatch_async(dispatch_get_main_queue(), ^{
        });
    });
   
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft ];
    [self.view_main1 addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight1 = [[UISwipeGestureRecognizer alloc] initWithTarget:revealController action:@selector(revealToggle:)];
       [swipeRight1 setDirection:UISwipeGestureRecognizerDirectionRight ];
       [self.view addGestureRecognizer:swipeRight1];

    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight ];
    [self.view_main1 addGestureRecognizer:swipeRight];
    
    _btn_back_add_frind.hidden=YES;
              _view_main3.hidden=YES;
               _view_search.hidden=NO;
              _VIEW_MAIN31.layer.cornerRadius=10;
              _VIEW_MAIN31.clipsToBounds=YES;
              [super viewDidLoad];
              _view_ques.layer.cornerRadius=10;
              _view_ques.clipsToBounds=YES;
        _view_add_ques.hidden=YES;
         _view_add_ques.layer.borderColor=UIColor.lightGrayColor.CGColor;
         _view_add_ques.layer.borderWidth=1.0f;
         _view_add_ques.layer.cornerRadius=5;
         _view_add_ques.clipsToBounds=YES;
        _btn_add.layer.cornerRadius=15;
        _btn_add.clipsToBounds=YES;
        _txt_question.layer.borderColor=UIColor.lightGrayColor.CGColor;
        _txt_question.layer.borderWidth=1.0f;
        _txt_question.layer.cornerRadius=5;
        _txt_question.clipsToBounds=YES;
        [self callnetconnection];
        _scrollview_obj.delegate=self;
        _scrollview_obj.contentSize=CGSizeMake(0, self.view_video_ques.frame.origin.y+self.view_video_ques.frame.size.height);
        _scrollview_obj.showsHorizontalScrollIndicator=NO;

        _txt_question.text = @"What would you like to ask the community?";
        _txt_question.textColor = [UIColor lightGrayColor];
        _txt_question.delegate = self;
        [_txt_question resignFirstResponder];
        _txtview_write_ans.text = @"Write Here...";
        _txtview_write_ans.textColor = [UIColor lightGrayColor];
        _txtview_write_ans.delegate = self;
        [_txtview_write_ans resignFirstResponder];
        [_btn_checkbox setImage:[UIImage imageNamed:@"uncheck_60px.png"] forState:UIControlStateNormal];
        rememberstr=@"0";
        [_btn_checkbox setSelected:NO];
        [_btn_checkbox1 setImage:[UIImage imageNamed:@"uncheck_60px.png"] forState:UIControlStateNormal];
        [_btn_checkbox1 setSelected:NO];
         ques_select=0;
         bgselect=0;
         bgselect1=0;
         filterquesselect=0;
         _view_main1.hidden=NO;
              
               
               _txtview_write_ans.layer.cornerRadius=5;
               _txtview_write_ans.clipsToBounds=YES;
               _txtview_write_ans.layer.borderColor=UIColor.lightGrayColor.CGColor;
               _txtview_write_ans.layer.borderWidth=1;
        _view_search.layer.cornerRadius=3;
        _view_search.clipsToBounds=YES;
        _img_profile.layer.cornerRadius=20;
           _img_profile.clipsToBounds=YES;
           _img_profile.layer.borderWidth =2;
           _img_profile.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
           _btn_profile.layer.cornerRadius=20;
           _btn_profile.clipsToBounds=YES;
           _btn_profile.layer.borderWidth =2;
           _btn_profile.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;

}

- (IBAction)btn_save_question:(id)sender {
    if([_txt_question.text isEqualToString:@"What would you like to ask the community?"] || [_txt_question.text isEqualToString:@""])
    {
        [self.view makeToast:@"Write something"
        duration:2.0
        position:CSToastPositionBottom];
    }
    else
    {
        [self calladdquestions];
    }
}

- (IBAction)btn_add_ques_exit:(id)sender {
    _view_add_ques.hidden=YES;
}

-(void) tapped:(UIGestureRecognizer *) sender
{
    [_searchbar resignFirstResponder];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar                   // return NO to not become first
{
    tapper =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar                        // return NO to not resign first
{
    [self.view removeGestureRecognizer:tapper];
    return YES;
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length==0)
    {
        bgselect=0;
        bgselect1=0;
        [self callThisWebservice];
        [self callThisWebservicevideo];
    }
    else
    {
      [self callsearchmethod];
      searchtextstr=searchText;
    }
}

- (IBAction)btn_checkbox:(id)sender {
    if([_btn_checkbox isSelected]==YES)
    {
        [_btn_checkbox setImage:[UIImage imageNamed:@"uncheck_60px.png"] forState:UIControlStateNormal];
        rememberstr=@"0";
        [_btn_checkbox setSelected:NO];
    }
    else
    {
        [_btn_checkbox setImage:[UIImage imageNamed:@"check_60px (1).png"] forState:UIControlStateNormal];
         rememberstr=@"1";
        [_btn_checkbox setSelected:YES];
    }
}

- (IBAction)btn_checkbox1:(id)sender {
    if([_btn_checkbox1 isSelected]==YES)
    {
        [_btn_checkbox1 setImage:[UIImage imageNamed:@"uncheck_60px.png"] forState:UIControlStateNormal];
        rememberstr=@"0";
        [_btn_checkbox1 setSelected:NO];
    }
    else
    {
        [_btn_checkbox1 setImage:[UIImage imageNamed:@"check_60px (1).png"] forState:UIControlStateNormal];
        rememberstr=@"1";
        [_btn_checkbox1 setSelected:YES];
    }
}


- (IBAction)btn_save_video:(id)sender {
    NSString *strr=_videoURL.path.lastPathComponent;
    img_name=[NSString stringWithFormat:@"tst%@",strr];
    imageData = [NSData dataWithContentsOfFile:[_videoURL path]];
    if(strr!=nil && ![strr isEqualToString:@""])
    {
        dispatch_queue_t queue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(queue2, ^{
           
              dispatch_async(dispatch_get_main_queue(), ^{
                   [self makePhotoUploadRequest];
            });
        });
        
           
    }
    else
    {
        [self.view makeToast:@"Please Capture Video" duration:2.0 position:CSToastPositionBottom];
    }
}

- (IBAction)btn_ans_cancel:(id)sender {
    _txtview_write_ans.textColor = [UIColor lightGrayColor];
    _txtview_write_ans.text = @"Write Here...";
    [_txtview_write_ans resignFirstResponder];
    
    _view_main3.hidden=YES;
                _view_search.hidden=NO;
               _view_main1.hidden=NO;
               _btn_back_add_frind.hidden=YES;
               _btn_back.hidden=NO;
     
 }
- (IBAction)btn_video_cancel:(id)sender {
    _txtview_write_ans.textColor = [UIColor lightGrayColor];
    _txtview_write_ans.text = @"Write Here...";
    [_txtview_write_ans resignFirstResponder];
    _view_main3.hidden=YES;
     _view_search.hidden=NO;
    _view_main1.hidden=NO;
    _btn_back_add_frind.hidden=YES;
    _btn_back.hidden=NO;
    //[self bindDatavideo];
    
}
- (IBAction)btn_ans_save:(id)sender {
    
    if([_txtview_write_ans.text isEqualToString:@"Write Here..."] || [_txtview_write_ans.text isEqualToString:@""])
    {
        [self.view makeToast:@"Write something"
        duration:2.0
        position:CSToastPositionBottom];
    }
    else
    {
        [self callwebsubmitanswer:rememberstr:@"0":_txtview_write_ans.text];
    }
}

- (IBAction)btn_Cap_n_video:(id)sender {
    _view_video_cap.hidden=NO;
    _view_write_n_ans.hidden=YES;
    _str_click=@"YES";
    [_btn_video setImage:[UIImage imageNamed:@"facetime-button.png"] forState:UIControlStateNormal];
    [_btn_comment setImage:[UIImage imageNamed:@"write.png"] forState:UIControlStateNormal];
   
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {

        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
        // [picker setVideoMaximumDuration:120];
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)btn_Add_n_comment:(id)sender {
      _view_video_cap.hidden=YES;
    _view_write_n_ans.hidden=NO;
    [_btn_video setImage:[UIImage imageNamed:@"facetime-button (1).png"] forState:UIControlStateNormal];
    [_btn_comment setImage:[UIImage imageNamed:@"write (1).png"] forState:UIControlStateNormal];
}

- (IBAction)btn_back_add_friend:(id)sender {
    _view_main3.hidden=YES;
     _view_search.hidden=NO;
    _btn_back_add_frind.hidden=YES;
    _btn_back.hidden=NO;
    _str_add_question=@"";
    
}

- (IBAction)btn_write_Ans:(id)sender {
    _view_main3.hidden=NO;
    _view_search.hidden=YES;
    _btn_back_add_frind.hidden=NO;
    _btn_back.hidden=YES;
    _view_video_cap.hidden=YES;
    _view_write_n_ans.hidden=NO;
    [_btn_video setImage:[UIImage imageNamed:@"facetime-button (1).png"] forState:UIControlStateNormal];
    [_btn_comment setImage:[UIImage imageNamed:@"write (1).png"] forState:UIControlStateNormal];
    [_btn_checkbox setImage:[UIImage imageNamed:@"uncheck_60px.png"] forState:UIControlStateNormal];
          
    rememberstr=@"0";
    [_btn_checkbox setSelected:NO];
    [_btn_checkbox1 setImage:[UIImage imageNamed:@"uncheck_60px.png"] forState:UIControlStateNormal];
    [_btn_checkbox1 setSelected:NO];
    if(_searchbar.text.length==0)
    {
    _sel_quesid=[_arr_ques_id objectAtIndex:ques_select];
    }
    else
    {
        _sel_quesid=[_arr_ques_id objectAtIndex:fil_ques_Sel];
    }
}

- (IBAction)btn_name:(id)sender {
    if(![_btn_name.text isEqualToString:@""])
    {
        _lbl_name.text=_btn_name.text;
        _btn_back_add_frind.hidden=NO;
        _btn_back.hidden=YES;
    }
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

-(void) processFailed :(NSError *)responseDictionary
{
    [self.view hideActivityView];
    [self.view makeToast:@"No question found"  duration:2.0 position:CSToastPositionBottom];
    NSLog(@"error");
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"AddActivityQuestion"])
     {
         _sel_quesid = [NSString stringWithFormat:@"%d", [[responseDictionary valueForKey:@"Qes_id"] intValue]];
         ques_select=(int)_arr_ques_id.count;
         [self callThisWebservice];
         [self callThisWebservicevideo];
         _str_add_question=@"ques";
        _str_sel_ques_text= _txt_question.text;
         [_btn_checkbox setImage:[UIImage imageNamed:@"uncheck_60px.png"] forState:UIControlStateNormal];
         rememberstr=@"0";
         [_btn_checkbox setSelected:NO];
         [_btn_checkbox1 setImage:[UIImage imageNamed:@"uncheck_60px.png"] forState:UIControlStateNormal];
         [_btn_checkbox1 setSelected:NO];
             _view_add_ques.hidden=YES;
             _view_main3.hidden=NO;
          _view_search.hidden=YES;
             _btn_back_add_frind.hidden=NO;
             _btn_back.hidden=YES;
             _view_video_cap.hidden=YES;
             _view_write_n_ans.hidden=NO;
             [_btn_video setImage:[UIImage imageNamed:@"facetime-button (1).png"] forState:UIControlStateNormal];
             [_btn_comment setImage:[UIImage imageNamed:@"write (1).png"] forState:UIControlStateNormal];
     }
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Chat_Status"] isEqual:@"0"])
            {
                [_chatbtnobj setUserInteractionEnabled:YES];
            }
            else
            {
                _chatbtnobj.alpha = 0.5;
                [_chatbtnobj setUserInteractionEnabled:NO];
            }
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"SOS_Status"] isEqual:@"0"])
            {
                [_btn_sos setUserInteractionEnabled:YES];
            }
            else
            {
               _btn_sos.alpha = 0.5;
               [_btn_sos setUserInteractionEnabled:NO];
            }
             if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Sisuchat_Status"] integerValue]==1)
            {
               if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"count"] isEqual:@"0"])
                {
                    _chatnotification.hidden=YES;
                }
                else
                {
                    _chatnotification.text=[[responseDictionary valueForKey:@"data"]valueForKey:@"count"];
                }
            }
            else
            {
                _chatnotification.text=[[responseDictionary valueForKey:@"data"]valueForKey:@"count"];
                NSInteger b = [_chatnotification.text integerValue];
                
                NSString *str = [[responseDictionary valueForKey:@"data"]valueForKey:@"therapist_chat_count"];
                NSInteger j=[str integerValue];;
                j=b+j;
                NSString* myNewString = [NSString stringWithFormat:@"%li", (long)j];
                _chatnotification.text=myNewString;
            }
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"count"] isEqual:@"0"] && [[[responseDictionary valueForKey:@"data"]valueForKey:@"therapist_chat_count"] integerValue]==0)
            {
                _chatnotification.hidden=YES;
                
            }
           NSString *imgStr = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"];
            
            
            if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
            {
                _img_profile.image = [UIImage imageNamed:@"user.png"];
            }
            else if([[[responseDictionary valueForKey:@"data"] valueForKey:@"img_status"] integerValue]==1)
            {
                [_img_profile setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
                _img_profile.contentMode=UIViewContentModeScaleToFill;
            }
            else
            {
                [_img_profile setImageWithURL:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]placeholderImage:nil];
                _img_profile.contentMode=UIViewContentModeScaleToFill;
            } } }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"ActivityQuestion"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] == 200)
        {
            _arr_ans =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            _arr_ques =[_arr_ans valueForKey:@"question"];
            _arr_ques_id = [_arr_ans valueForKey:@"id"];
             if(_searchbar.text.length==0)
              {
                _arr_ques1 = [[_arr_ans valueForKey:@"Answer"] objectAtIndex:ques_select];
                _lbl_question.text = [_arr_ques objectAtIndex:ques_select];
                  _sel_quesid=[_arr_ques_id objectAtIndex:ques_select];
               }
              else
              {
                    _arr_ques1 = [[_arr_ans valueForKey:@"Answer"] objectAtIndex:fil_ques_Sel];
                    _lbl_question.text = [_arr_ques objectAtIndex:fil_ques_Sel];
                   _sel_quesid=[_arr_ques_id objectAtIndex:fil_ques_Sel];
                }
            if([_str_text_ans isEqualToString:@"0"])
            {
                _str_text_ans=@"1";
                bgselect=0;
            }
             [self bindData];
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"ActivityQuestionvideo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] == 200)
        {
            _arr_ans_video =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            _arr_ques =[_arr_ans_video valueForKey:@"question"];
             _arr_ques_id = [_arr_ans_video valueForKey:@"id"];
            
            if(_searchbar.text.length==0)
              {
                  __arr_ques1video = [[_arr_ans_video valueForKey:@"Answer"] objectAtIndex:ques_select];
                _lbl_question.text = [_arr_ques objectAtIndex:ques_select];
               }
              else
              {
                  __arr_ques1video = [[_arr_ans_video valueForKey:@"Answer"] objectAtIndex:fil_ques_Sel];
                    _lbl_question.text = [_arr_ques objectAtIndex:fil_ques_Sel];
                }
            if([_str_text_ans isEqualToString:@"0"])
            {
              _str_text_ans=@"1";
                bgselect1=0;
            }
            [self bindDatavideo];
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"activity_ans_view"])
    {
        [self.view hideActivityView];
        if ([[responseDictionary valueForKey:@"status"] integerValue] == 200) {
         }
    }

    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"activity_answer"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] == 200)
        {
            [self.view makeToast:@"Saved Successfully"
                        duration:2.0
                        position:CSToastPositionBottom];
            _lbl_ans.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"answer"];
            if([[[responseDictionary valueForKey:@"data"] valueForKey:@"anonymous"]isEqualToString:@"0"])
                {
                 _btn_name.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"username"];
                }
                else
                {
                    _btn_name.text=@"";
                }
                _lbl_like.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"view_count"];
                _btn_fav.hidden=NO;
                [_btn_fav setImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
           if([_str_add_question isEqualToString:@"ques"])
           {
            _lbl_question.text=_str_sel_ques_text;
               _str_add_question=@"";
               _lbl_video_like.text=@"";
               _lbl_video_ques.text=@"";
               [_playerViewController.view removeFromSuperview];
               _novideo.hidden=NO;
               _btn_video_fav.hidden=YES;
           }
            else
            {
                _str_text_ans=@"0";
            }
            
            _txtview_write_ans.textColor = [UIColor lightGrayColor];
             _txtview_write_ans.text = @"Write Here...";
            [_txtview_write_ans resignFirstResponder];
            _view_main3.hidden=YES;
             _view_search.hidden=NO;
            _view_main1.hidden=NO;
            _btn_back_add_frind.hidden=YES;
            _btn_back.hidden=NO;
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
               dispatch_async(queue, ^{
                   // [self callfetchprofile];
                     dispatch_async(dispatch_get_main_queue(), ^{
                          [self callThisWebservice];
                   });
               });
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"search_activity_que"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            filterquesselect = 0;
            _arr_search =[[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]] valueForKey:@"id"];
            bgselect=0;
            bgselect1=0;
            NSString *qq_sel_search=[_arr_search objectAtIndex:filterquesselect];
            fil_ques_Sel=[_arr_ques_id indexOfObject:qq_sel_search];
            _sel_quesid=[_arr_ques_id objectAtIndex:fil_ques_Sel];
            _arr_ques1 = [[_arr_ans valueForKey:@"Answer"] objectAtIndex:fil_ques_Sel];
            __arr_ques1video=[[_arr_ans_video valueForKey:@"Answer"] objectAtIndex:fil_ques_Sel];
            [self bindData];
            [self bindDatavideo];
            _lbl_question.text=[_arr_ques objectAtIndex:fil_ques_Sel];
        }
    }
}
-(void) textViewShouldEndEditing:(UITextView *)textView {
      if(textView==_txtview_write_ans)
       {
           if(_txtview_write_ans.text.length == 0) {
               _txtview_write_ans.textColor = [UIColor lightGrayColor];
               _txtview_write_ans.text = @"Write Here...";
               [_txtview_write_ans resignFirstResponder];
           }
       }
       else if(textView==_txt_question)
       {
           if(_txt_question.text.length == 0) {
               _txt_question.textColor = [UIColor lightGrayColor];
               _txt_question.text = @"What would you like to ask the community?";
               [_txt_question resignFirstResponder];
           }
       }
}

-(void) textViewDidChange:(UITextView *)textView {
    
    if(textView==_txtview_write_ans)
    {
        if(_txtview_write_ans.text.length == 0) {
            _txtview_write_ans.textColor = [UIColor lightGrayColor];
            _txtview_write_ans.text = @"Write Here...";
            [_txtview_write_ans resignFirstResponder];
        }
    }
    else if(textView==_txt_question)
    {
        if(_txt_question.text.length == 0) {
            _txt_question.textColor = [UIColor lightGrayColor];
            _txt_question.text = @"What would you like to ask the community?";
            [_txt_question resignFirstResponder];
        }
    }
}
-(void)bindDatavideo
{
    [self.view hideActivityView];
    [_playerViewController.view removeFromSuperview];
    if(__arr_ques1video.count!=0)
    {
             [self.view showActivityViewWithLabel:@"Loading"];
            _btn_video_fav.hidden=NO;
            _novideo.hidden=YES;
            _lbl_video_like.text=[[__arr_ques1video valueForKey:@"view_count"] objectAtIndex:bgselect1];
            if([[[__arr_ques1video valueForKey:@"anonymous"] objectAtIndex:bgselect1]isEqualToString:@"0"])
            {
             _lbl_video_ques.text=[[__arr_ques1video valueForKey:@"username"] objectAtIndex:bgselect1];
            }
            else
            {
                _lbl_video_ques.text=@"";
            }
            NSString *urlString = [[[__arr_ques1video valueForKey:@"answer"] objectAtIndex:bgselect1] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
            NSURL *videoURL = [NSURL URLWithString:urlString];
            AVPlayer *player = [AVPlayer playerWithURL:videoURL];
            player.externalPlaybackVideoGravity=AVLayerVideoGravityResizeAspectFill;
            _playerViewController = [AVPlayerViewController new];
            [_playerViewController.view setFrame:CGRectMake(0, 0, self.view_video.frame.size.width, self.view_video.frame.size.height)];
            _playerViewController.player = player;
            [[AVAudioSession sharedInstance]
            setCategory: AVAudioSessionCategoryPlayback
                  error: nil];
            [player pause];
            [self.view_video addSubview:_playerViewController.view];
            if([[[__arr_ques1video valueForKey:@"like"] objectAtIndex:bgselect1]integerValue]==1)
            {
               [_btn_video_fav setImage:[UIImage imageNamed:@"favorite-heart-button.png"] forState:UIControlStateNormal];
            }
            else
            {
               [_btn_video_fav setImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
            }
     }
    else
    {
        [_btn_video_fav setImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
         _btn_video_fav.hidden=YES;
        _lbl_video_like.text=@"";
        _novideo.hidden=NO;
        _lbl_video_ques.text=@"";
        [self.view hideActivityView];
    }
}

-(void)bindData
{
    [self.view hideActivityView];
    if(_arr_ques1.count!=0)
    {
            _lbl_ans.text=[[_arr_ques1 valueForKey:@"answer"] objectAtIndex:bgselect];
            if([[[_arr_ques1 valueForKey:@"anonymous"] objectAtIndex:bgselect]isEqualToString:@"0"])
            {
            _btn_name.text=[[_arr_ques1 valueForKey:@"username"] objectAtIndex:bgselect];
            }
            else
            {
                _btn_name.text=@"";
            }
            _lbl_like.text=[[_arr_ques1 valueForKey:@"view_count"] objectAtIndex:bgselect];
            _btn_fav.hidden=NO;
         if([[[_arr_ques1 valueForKey:@"like"] objectAtIndex:bgselect]integerValue]==1)
          {
            [_btn_fav setImage:[UIImage imageNamed:@"favorite-heart-button.png"] forState:UIControlStateNormal];
          }
        else
            {
                [_btn_fav setImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
            }
    }
    else
    {
        _lbl_ans.text =@"";
        [_btn_fav setImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
        _lbl_like.text=@"";
        _btn_name.text=@"";
        _btn_fav.hidden=YES;
        [self.view hideActivityView];
    }
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"])
        [textView resignFirstResponder];
    return YES;
}

-(void) makePhotoUploadRequest{
    NSArray *keys = [[NSArray alloc]initWithObjects:@"user_id",@"Qes_id",@"ans_type",@"date",@"anonymous",nil];
    NSArray *values =[[NSArray alloc]initWithObjects:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"],_sel_quesid,@"1",todaydate ,rememberstr, nil];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];

    NSURL *baseUrl = [NSURL URLWithString:@"https://w2.sisuroot.com/servicebus/activity_answer.php"];
    NSString *charset = (NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    [request setURL:baseUrl];
    [request setHTTPMethod:@"POST"];
    NSString *boundary = @"0xKhTmLbOuNdArY";
    NSString *endBoundary = [NSString stringWithFormat:@"\r\n--%@\r\n", boundary];

    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; charset=%@; boundary=%@", charset, boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];

    NSMutableData *tempPostData = [NSMutableData data];
    [tempPostData appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
      for(int i=0;i<keys.count;i++){
               NSString *str = values[i];
               NSString *key =keys[i];
               NSLog(@"Key Value pair: %@-%@",key,str);
               [tempPostData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", key] dataUsingEncoding:NSUTF8StringEncoding]];
               [tempPostData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];
              // [tempPostData appendData:[@"\r\n--%@\r\n",boundary dataUsingEncoding:NSUTF8StringEncoding]];
                   [tempPostData appendData:[endBoundary dataUsingEncoding:NSUTF8StringEncoding]];
        }
    // Sample file to send as data
    [tempPostData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"answer\"; filename=\"%@\"\r\n",img_name ] dataUsingEncoding:NSUTF8StringEncoding]];
    [tempPostData appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [tempPostData appendData:imageData];
    [tempPostData appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:tempPostData];

//    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
     NSError *error = nil;
    [self.view_main3 showActivityViewWithLabel:@"Loading"];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    _jsonarray = [NSJSONSerialization JSONObjectWithData: returnData options: NSJSONReadingMutableContainers error: &error];
    [self showdata];
}

-(void)showdata
{
    [_playerViewController.view removeFromSuperview];
    self.view_main3.hidden=YES;
    _view_search.hidden=NO;
    self.view_main1.hidden=NO;
    self.btn_back_add_frind.hidden=YES;
    self.btn_back.hidden=NO;
    [self.view_main3 hideActivityView];
           self.btn_video_fav.hidden=NO;
           self.novideo.hidden=YES;
    _lbl_video_like.text=[[_jsonarray valueForKey:@"data"] valueForKey:@"view_count"];
    if([[[_jsonarray valueForKey:@"data"] valueForKey:@"anonymous"]isEqualToString:@"0"])
       {
       self.lbl_video_ques.text=[[_jsonarray valueForKey:@"data"] valueForKey:@"username"];
    }
    else
    {
        self.lbl_video_ques.text=@"";
    }
    if([_str_add_question isEqualToString:@"ques"])
              {
               _lbl_question.text=_str_sel_ques_text;
                  _str_add_question=@"";
                  self.lbl_ans.text=@"";
                  self.btn_name.text=@"";
                  self.lbl_like.text=@"";
                  self.btn_fav.hidden=YES;
              }
        else
               {
                   _str_text_ans=@"0";
                   
               }
   
    NSString *urlString = [[[_jsonarray valueForKey:@"data"] valueForKey:@"answer"] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
       NSURL *videoURL = [NSURL URLWithString:urlString];
           AVPlayer *player = [AVPlayer playerWithURL:videoURL];
           player.externalPlaybackVideoGravity=AVLayerVideoGravityResizeAspectFill;
           _playerViewController = [AVPlayerViewController new];
        [[AVAudioSession sharedInstance]
        setCategory: AVAudioSessionCategoryPlayback
              error: nil];
          // _playerViewController.videoGravity=AVLayerVideoGravityResizeAspect;
            [_playerViewController.view setFrame:CGRectMake(0, 0, self.view_video.frame.size.width, self.view_video.frame.size.height)];
           _playerViewController.player = player;
           [player pause];
           [self.view_video addSubview:_playerViewController.view];
           
              [_btn_video_fav setImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
              
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
                  dispatch_async(queue, ^{
                      // [self callfetchprofile];
                        dispatch_async(dispatch_get_main_queue(), ^{
                             [self callThisWebservicevideo];
                      });
                  });
//       [self callThisWebservice];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if([_str_click isEqualToString:@"YES"])
    {
        
        [_playerViewController.view removeFromSuperview];
        self.videoURL = info[UIImagePickerControllerMediaURL];
            
        AVPlayer *player = [AVPlayer playerWithURL:self.videoURL];
        player.externalPlaybackVideoGravity=AVLayerVideoGravityResizeAspectFill;
        _playerViewController = [AVPlayerViewController new];
        [[AVAudioSession sharedInstance]
        setCategory: AVAudioSessionCategoryPlayback
              error: nil];
        [_playerViewController.view setFrame:CGRectMake(0, 0, self.video_cap.frame.size.width, self.video_cap.frame.size.height)];
        _playerViewController.player = player;
        [player pause];
        [self.video_cap addSubview:_playerViewController.view];
        [picker dismissViewControllerAnimated:YES completion:NULL];
    }
    else
    {
    }
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

- (IBAction)btn_fav:(id)sender {
           if(_sel_quesid.length!=0)
            {
               if (_btn_fav.currentImage == [UIImage imageNamed:@"heart.png"])
                {
                           [self callviewWebservice:[[_arr_ques1 valueForKey:@"id"] objectAtIndex:bgselect]];
                            [self.btn_fav setImage:[UIImage imageNamed:@"favorite-heart-button.png"] forState:UIControlStateNormal];
                            NSInteger b = [self.lbl_like.text integerValue];
                            b++;
                            self.lbl_like.text=[NSString stringWithFormat:@"%li", (long)b];
                            [self callThisWebservice];
                }
        }
}
- (IBAction)btn_video_fav:(id)sender {
                if(_sel_quesid.length!=0)
               {
                  if (_btn_video_fav.currentImage == [UIImage imageNamed:@"heart.png"])
                   {
                           [self callviewWebservice:[[self._arr_ques1video valueForKey:@"id"] objectAtIndex:bgselect1]];
                           [self.btn_video_fav setImage:[UIImage imageNamed:@"favorite-heart-button.png"] forState:UIControlStateNormal];
                              NSInteger b = [self.lbl_video_like.text integerValue];
                               b++;
                               self.lbl_video_like.text=[NSString stringWithFormat:@"%li", (long)b];
                       [self callThisWebservicevideo];
                                                
                   }
           }
}

// button action
- (IBAction)btn_add:(id)sender {
    _view_add_ques.hidden=NO;
    _txt_question.textColor = [UIColor lightGrayColor];
    _txt_question.text = @"What would you like to ask the community?";
    [_txt_question resignFirstResponder];
}

- (IBAction)btn_next1:(id)sender {
    
        if(bgselect1<__arr_ques1video.count-1)
        {
            if(__arr_ques1video.count !=0)
            {
                bgselect1++;
                [self bindDatavideo];
            }
        }
        else  if(bgselect1 ==__arr_ques1video.count-1)
        {
            bgselect1=0;
            [self bindDatavideo];
        }
}

- (IBAction)btn_prev1:(id)sender {
    if(bgselect1>0)
        {
            bgselect1--;
            [self bindDatavideo];
        }
    else  if(bgselect1==0)
       {
           bgselect1=__arr_ques1video.count-1;
           [self bindDatavideo];
       }
    }

- (IBAction)btn_next:(id)sender {
    if(bgselect<_arr_ques1.count-1)
        {
            if(_arr_ques1.count !=0)
            {
               bgselect++;
              [self bindData];
            }
        }
    else  if(bgselect ==_arr_ques1.count-1)
            {
               bgselect=0;
              [self bindData];
            }
}

- (IBAction)btn_prev:(id)sender {
    if(bgselect>0)
    {
        bgselect--;
    }
    else  if(bgselect==0)
    {
        bgselect=_arr_ques1.count-1;
    }
    [self bindData];
}

// Switch page

- (IBAction)btn_home:(id)sender {
    FeedViewController *SVC=[[FeedViewController alloc]init];
    [SVC setStr2:@"done"];
    [self.navigationController pushViewController:SVC animated:YES];
}
- (IBAction)btn_friend:(id)sender {
    FriendsViewController *FVC=[[FriendsViewController alloc]init];
    
    [self.navigationController pushViewController:FVC animated:YES];
}
- (IBAction)btn_gallery:(id)sender {
    GalleryViewController *gvc=[[GalleryViewController alloc]init];
    [self.navigationController pushViewController:gvc animated:YES];
}

- (IBAction)btn_chat:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)btn_back:(id)sender {
}

- (IBAction)btn_sos:(id)sender {
    BS1ViewController *BSVC=[[BS1ViewController alloc]init];
    [self.navigationController pushViewController:BSVC animated:YES];
}

- (IBAction)btn_notification:(id)sender
{
    ResponseViewController *RVC=[[ResponseViewController alloc]init];
    [RVC setCountstr:_countlblstr];
    [self.navigationController pushViewController:RVC animated:YES];
}

- (IBAction)btnyou:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}

// Call APi

-(void)callnetconnection
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus status = [reachability currentReachabilityStatus];
    if(status == NotReachable)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"You should connect with wifi for optimal use." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        alert.tag=2000;
        [alert show];
    }
    else if (status == ReachableViaWiFi)
    {
        //WiFi
    }
    else if (status == ReachableViaWWAN)
    {
        //3G
    }
}
-(void)calladdquestions
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"AddActivityQuestion" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"user_id"];
    [dict1 setValue:_txt_question.text forKey:@"question"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"AddActivityQuestion" :dict :dict1];
}

-(void)callsearchmethod
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"search_activity_que" forKey:@"name"];
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"user_id"];
    [paramDict setValue:_searchbar.text forKey:@"key"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"search_activity_que" :dict :paramDict];
}

-(void)callThisWebservice
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"ActivityQuestion" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"user_id"];
    [dict1 setValue:@"0" forKey:@"status"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"ActivityQuestion" :dict :dict1];
}

-(void)callThisWebservicevideo
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"ActivityQuestionvideo" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"user_id"];
    [dict1 setValue:@"1" forKey:@"status"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"ActivityQuestion" :dict :dict1];
}

-(void)callviewWebservice:(NSString *)tagid
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"activity_ans_view" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:tagid forKey:@"id"];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"user_id"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"activity_ans_view" :dict :dict1];
}

-(void)callwebsubmitanswer:(NSString *)str_anony:(NSString *)str_ans_type:(NSString *)str_answer
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"activity_answer" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"user_id"];
    [dict1 setValue:_sel_quesid forKey:@"Qes_id"];
    [dict1 setValue:str_answer forKey:@"answer"];
    [dict1 setValue:str_ans_type forKey:@"ans_type"];
    [dict1 setValue:todaydate forKey:@"date"];
    [dict1 setValue:str_anony forKey:@"anonymous"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"activity_answer" :dict :dict1];
}

-(void) currentdate
{
    NSDate *currentDate = [[NSDate alloc] init];
    NSTimeZone *timeZone = [NSTimeZone defaultTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:SS"];
    todaydate=[dateFormatter stringFromDate:currentDate];
    [[NSUserDefaults standardUserDefaults] setValue:todaydate forKey:@"activity_ans_date"];
}
@end
