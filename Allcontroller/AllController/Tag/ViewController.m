#import "ViewController.h"
#import <Contacts/Contacts.h>
#import "MyWebserviceManager.h"
#import "FeedViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import "Base64.h"
#import "UIImageView+WebCache.h"
#import "SCLAlertView.h"
#import "UIView+RNActivityView.h"
#import "Reachability.h"
#import "FriendsViewController.h"
#import "BS1ViewController.h"
#import "EmotionlistTableViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import <Photos/Photos.h>
#import "FeedTagViewController.h"
#import "GraphView.h"
#import "chattypeViewController.h"
#import "GraphView1.h"
#import "smilepage1ViewController.h"
#import "Sisuroot-Swift.h"
@interface ViewController () <AVAudioRecorderDelegate, AVAudioPlayerDelegate>
{
    NSMutableArray *Colores1;
    NSMutableArray *Colores2;
    NSMutableArray *Colores3;
    BOOL flag;
    BOOL public;
    BOOL flag1;
    NSString *public_private;
    NSString *in_ou_oth;
    NSMutableArray *recordeddata;
    NSString *chkBtn;
    NSMutableArray *FilteredDevices;
    BOOL isfiltered;
    NSDictionary *result;
    NSMutableArray *publicarr;
    NSString *publicstr;
    NSString *privatestr;
    NSMutableArray *hardarr;
    NSMutableArray *Listarray_show;
    NSMutableArray *softarr;
    NSString *hardtagid;
    UIImageView *imgdetail;
    int inddd;
    CGRect view_main_fame;
    NSString *setimgstr;
    UITapGestureRecognizer *tapper;
    NSString *recordstr;
    AVAudioRecorder *audioRecorder;
    AVAudioPlayer *player;
    float someFloat;
    NSTimer *myTimer;
    NSMutableArray *arr2;
    NSMutableArray *arr1;
    int i;
    int j;
    NSString *base64_encoded_image11;
    int count;
    NSString *imageNameStr11;
    NSString *arr2str;
    NSString *arr1str;
    int n1;
    int n2;
    NSString *checkstr;
    NSString *base64_encoded_image1;
    NSString *imageNameStr1;
    NSString *voicestr;
    AVAudioPlayer *audioPlayer;
    NSString *mainemotionstr;
    NSString *subemotionid;
}

@property (nonatomic, strong) WARVChatPanelView *chatPanelView;
@end
@implementation ViewController

- (IBAction)btnchat:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
  
- (IBAction)btnyou:(id)sender {
    
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
      [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btnfaq:(id)sender {
    smilepage1ViewController *VC1=[[smilepage1ViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btnhome:(id)sender {
    FeedViewController *VC1=[[FeedViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    if(textField==_txt_ownword)
    {
        _VIEW_OWNWORDS.hidden=NO;
        self.VIEW_OWNWORDS.frame=CGRectMake(0, self.scrollViewObj.frame.size.height-60, self.view.frame.size.width, 56);
        _view_main.frame=  view_main_fame;
    }
   return YES;
}
-(void)viewDidAppear:(BOOL)animated
{
}

- (void)viewDidLoad {
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
      graphView.backgroundColor = [UIColor clearColor];
      GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
      graphView1.backgroundColor = [UIColor clearColor];
      [self.view_footer1 addSubview:graphView];
      [self.view_footer2 addSubview:graphView1];

    
     Listarray_show=[[NSMutableArray alloc]initWithObjects:@"Feeling great",@"Feeling okay",@"Feeling meh",@"I am struggling",@"I am having a hard time and wouldn’t mind a check-in",@"I am in a really dark place",@"I am happy",@"Having an awesome day",@"I feel connected",@"I love my friends",@"I love my family",@"I am bored",@"I am worried",@"I am stressed about homework",@"I am stressed about quiz",@"I am dealing with family drama",@"I am dealing with a breakup",@"Feeling overwhelmed",@"I am a bit sad",@"I am sick",@"I am lonely",@"Feeling confused",@"I feel bullied",@"I am very sad",nil];
    UIColor *color = [UIColor darkGrayColor];
    _txt_ownword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Express in your words" attributes:@{NSForegroundColorAttributeName: color}];
   // [super viewDidLoad];
    [self callfetchprofile];
    [self callnetconnection];
    
    _VIEW_OWNWORDS.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    _VIEW_OWNWORDS.layer.borderWidth=1.0f;
    
    _VIEW_OWNWORDS.hidden=YES;
    _txt_ownword.hidden=YES;
    self.voicerecordviewobj.hidden=YES;
    inddd = 0;
    _progressLabel.hidden=YES;
    publicstr=@"public";
    privatestr=@"private";
    _TagEmotionTF.text=@"What are you feeling?";
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    count =0;
    someFloat = 0;
    recordeddata=[[NSMutableArray alloc]init];
    _stopButton.hidden=YES;
     _Emotionlblobj.hidden=YES;
    NSMutableAttributedString *mutable = [[NSMutableAttributedString alloc] initWithString:self.CommentTF.placeholder];
        [mutable addAttribute: NSForegroundColorAttributeName value:[UIColor whiteColor] range:[self.CommentTF.placeholder rangeOfString:self.CommentTF.placeholder]];  self.CommentTF.attributedPlaceholder=mutable;
     _TagPostBtnobj.hidden=YES;
    ActivityIdenter.hidden=YES;
    _indcatorlbl.hidden=YES;
    _Emotionlblobj.clipsToBounds=YES;
    _datelbl.hidden=YES;
    _emonamelbl.hidden=YES;
    _Bglblobj.hidden=YES;
    _itaggedlbl.hidden=YES;
    _voicerecordviewobj.layer.cornerRadius=25;
    _voicerecordviewobj.clipsToBounds=YES;
    _recordButton.layer.cornerRadius=18;
    _recordButton.clipsToBounds=YES;
    _emocommentbackview.layer.cornerRadius=10;
    _emocommentbackview.clipsToBounds=YES;
    _Backgroundimg.layer.cornerRadius=15;
    _Backgroundimg.clipsToBounds=YES;
    _emobacklbl.layer.cornerRadius=8;
    _emobacklbl.clipsToBounds=YES;
    _view_comment.layer.cornerRadius=15;
       _view_comment.clipsToBounds=YES;
    
    //_view_inner.backgroundColor = [UIColor colorWithRed:(12.0/255.0) green:(113.0/255) blue:(207.0/255) alpha:1];
       
         UIBezierPath *maskPath = [UIBezierPath
             bezierPathWithRoundedRect:self.view_mask.bounds
             byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight)
             cornerRadii:CGSizeMake(15, 15)
         ];
         CAShapeLayer *maskLayer = [CAShapeLayer layer];
         maskLayer.frame = _view_mask.bounds;
         maskLayer.path = maskPath.CGPath;
         self.view_mask.layer.mask = maskLayer;
      
    _indcatorlbl.layer.cornerRadius=2;
    _indcatorlbl.clipsToBounds=YES;
    _indcatorlbl.layer.borderWidth =1.0f;
    
    isfiltered=false;
    _pickerviewobj11.hidden=YES;
    _hardTaglbl.hidden=YES;
    _SoftTaglbl.hidden=YES;
    _selecttaglbl.hidden=YES;
    _DoneBtnobj.hidden=YES;
    if ([_detailstr isEqualToString:@"done"])
    {
        _Backgroundimg.image=_Backimg;
        imageNameStr=_imageNameStr1;
        base64_encoded_image=_base64_encoded_image1;
        _voiceplayBtnobj.hidden=YES;
        _imgbuttonobj.hidden=NO;
        
        _BackBtnobj.hidden=NO;
        
    }
    
    if ([_tagmestr isEqualToString:@"tagme"])
    {
        _TagEmotionTF.text=@"What feeling do you read?";
        _HomeBtnobj.hidden=NO;
        _view_share_sel.hidden=YES;
        _TagPostBtnobj.hidden=NO;
        _itaggedlbl.hidden=YES;
        [self calltagMeFatch];
        _voiceplayBtnobj.hidden=YES;
        _imgbuttonobj.hidden=NO;
    }
    if ([_tagmestr isEqualToString:@"tagged"])
    {
        // _BackBtnobj.hidden=YES;
        _imgbuttonobj.hidden=YES;
        _TagEmotionTF.hidden=YES;
        _HomeBtnobj.hidden=NO;
        _CommentTF.hidden=YES;
        _view_share_sel.hidden=YES;
        _TagPostBtnobj.hidden=NO;
        _TagPostBtnobj.hidden=YES;
        [self calltagMeFatch];
        _Tagstmtlbl.text=@"Tagged Post";
        _datelbl.hidden=NO;
        _emonamelbl.hidden=NO;
        _Bglblobj.hidden=NO;
        _itaggedlbl.hidden=NO;
        _emocommentbackview.hidden=YES;
        _datelbl.hidden=NO;
        
        NSString *strdate=@"Date: ";
        NSString *strdate1=[_datestrarr valueForKey:@"date"];
        if ([strdate1 isEqual:[NSNull null]] || strdate1.length < 1)
        {
            
        }
        else
        {
            strdate=[strdate stringByAppendingString:strdate1];
            
        }
        
        _playButton1.hidden=YES;
        
        NSString *countstr2=[_datestrarr valueForKey:@"with_emotion_txt"];
        
        if ([countstr2 isEqual:(id)[NSNull null]] || countstr2.length < 1)
        {
            _emonamelbl.text=@"None";
        }
        else
        {
            _emonamelbl.text=[_datestrarr valueForKey:@"with_emotion_txt"];
            
        }
        
        NSString *countstr3=[_datestrarr valueForKey:@"emotionLatest"];
        
        if ([countstr3 isEqual:(id)[NSNull null]] || countstr3.length < 1)
        {
            // cell.EmotionBtnlblobj.text=@"";
            _voiceplayBtnobj.hidden=YES;
            //_emonamelbl.frame = CGRectMake(210, 522, 171, 45);
            
        }
        else
        {
            voicestr=[_datestrarr valueForKey:@"emotionLatest"];
            
            _voiceplayBtnobj.hidden=NO;
            
        }
     
        _datelbl.text=strdate;
    }
    
    
    if ([_str1 isEqualToString:@"done"])
    {
        _BackBtnobj.hidden=YES;
        _HomeBtnobj.hidden=NO;
        [self calldefaultcameragallery];
    }
    public_private=@"Private";
    public=false;
    
    flag=1;
    
    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    
    
    UILongPressGestureRecognizer *gesture1 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
    gesture1.delegate = self;
    [gesture1 setMinimumPressDuration:0];
    [_playButton1 addGestureRecognizer:gesture1];
    
    
    [super viewDidLoad];
    recordstr=@"deleterecorded";
    
    // Disable Stop/Play button when application launches
    [_playButton setEnabled:NO];
    
    // Set the audio file
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"MyAudioMemo.m4a",
                               nil];
    
    NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
    
    // Setup audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    // Define the recorder setting
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    // Initiate and prepare the recorder
    audioRecorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:nil];
    audioRecorder.delegate = self;
    audioRecorder.meteringEnabled = YES;
    [audioRecorder prepareToRecord];
    self.txt_ownword.delegate = self;
    [self.txt_ownword addTarget:self action:@selector(travelToOnTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
}


-(void)travelToOnTextFieldDidChange:(id)sender
{
    NSLog(@"Event Handler called");
    _bacl_ownword.backgroundColor = [UIColor colorWithRed:(61.0/255.0)
                                                             green:(181.0/255.0)
                                                              blue:(230.0/255.0)
                                                             alpha:(1.0)];
    _TagEmotionTF.text=_txt_ownword.text;
    //          [textField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)btnshare:(id)sender {
    if([public_private isEqualToString:@"Private"])
    {
        if([in_ou_oth isEqualToString:@"Inner"])
            {
                NSString *checkvoicestr;
                
                if ([_detailstr isEqualToString:@"done"])
                {
                    _Backgroundimg.image=_Backimg;
                    imageNameStr=_imageNameStr1;
                    base64_encoded_image=_base64_encoded_image1;
                    
                }
                
                [audioRecorder stop];
                [_recordButton setBackgroundImage:[UIImage imageNamed:@"microphone-(1).png"] forState:UIControlStateNormal];
                // _progressbarobj.hidden=YES;
                _progressLabel.hidden=YES;
                if ([recordstr isEqualToString:@"recorded"])
                {
                    NSURL* url = [NSURL URLWithString:audioRecorder.url.path];
                    
                    NSString *urr=[url absoluteString];
                    [recordeddata addObject:urr];
                    int lastindex=[recordeddata count]-1;
                    
                    NSString *laststr=[recordeddata objectAtIndex:lastindex];
                    checkvoicestr=laststr;
                    if ([laststr isEqualToString:@""])
                    {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please record your emotions" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                        [alert show];
                    }
                    else
                    {
                        
                        NSData *daataa = [[NSData alloc] initWithContentsOfFile:laststr];
                        base64_encoded_image11 =  [Base64 encode:daataa];
                        
                        NSDate *dtTime = [NSDate date];
                        NSDateFormatter *df = [[NSDateFormatter alloc] init];
                        [df setDateFormat:@"dd-MMM-yyyy hh-MM-ss"];
                        imageNameStr11 = [df stringFromDate:dtTime];
                        
                        NSArray *arra = [imageNameStr11 componentsSeparatedByString:@" "];
                        
                        imageNameStr11 = [NSString stringWithFormat:@"%@%@",[arra objectAtIndex:0],[arra objectAtIndex:1]];
                        
                        [audioRecorder stop];
                        
                        // NSData *data = [[NSData alloc] initWithContentsOfFile:audioRecorder.url.path];
                        // NSString *urr = [NSString stringWithUTF8String:[data bytes]];
                        
                        //[recordeddata addObject:imageNameStr];
                    }
                }
                NSString *msg  = @"0";
                if ([imageNameStr isEqual:(id)[NSNull null]] || imageNameStr.length < 1)
                {
                    msg = @"Please Select Image";
                }
                
                else if([_TagEmotionTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
                {
                    msg = @"Please select Emotion OR record voice";
                    
                }
                else if([_TagEmotionTF.text isEqualToString:@"What are you feeling?"] && checkvoicestr.length <1)
                {
                    msg = @"Please select Emotion OR record emotions";
                    
                }
                
                
                else if (_CommentTF.text.length >50)
                {
                    msg = @"Please enter comment in limit character";
                    
                }
                
                if (![msg isEqualToString:@"0"])
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                    [alert show];
                }
                
                else
                {
                    
                    if (public==false) {
                        
                        
                        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Inner_frnd_count"] integerValue] >0)
                        {
                             [self.view showActivityViewWithLabel:@"Loading"];
                            [self CallTagEmotion];
                    }
                        else
                        {
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You have no friends in your inner circle, please add from contacts" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                            alert.tag=1007;
                            [alert show];
                            
                        }
                        
                    }
                    else
                    {
                        public=true;
                        [self.view showActivityViewWithLabel:@"Loading"];
                        [self CallTagEmotionpublic];
                    }
                }
            }
        else  if([in_ou_oth isEqualToString:@"Outer"])
            {
                NSString *checkvoicestr;
                
                if ([_detailstr isEqualToString:@"done"])
                {
                    _Backgroundimg.image=_Backimg;
                    imageNameStr=_imageNameStr1;
                    base64_encoded_image=_base64_encoded_image1;
                    
                }
                
                [audioRecorder stop];
                [_recordButton setBackgroundImage:[UIImage imageNamed:@"microphone-(1).png"] forState:UIControlStateNormal];
                _progressLabel.hidden=YES;
                if ([recordstr isEqualToString:@"recorded"])
                {
                    NSURL* url = [NSURL URLWithString:audioRecorder.url.path];
                    
                    NSString *urr=[url absoluteString];
                    [recordeddata addObject:urr];
                    int lastindex=[recordeddata count]-1;
                    
                    NSString *laststr=[recordeddata objectAtIndex:lastindex];
                    checkvoicestr=laststr;
                    if ([laststr isEqualToString:@""])
                    {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please record your emotions" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                        [alert show];
                    }
                    else
                    {
                        
                        NSData *daataa = [[NSData alloc] initWithContentsOfFile:laststr];
                        
                        base64_encoded_image11 =  [Base64 encode:daataa];
                        
                        NSDate *dtTime = [NSDate date];
                        NSDateFormatter *df = [[NSDateFormatter alloc] init];
                        [df setDateFormat:@"dd-MMM-yyyy hh-MM-ss"];
                        imageNameStr11 = [df stringFromDate:dtTime];
                        
                        NSArray *arra = [imageNameStr11 componentsSeparatedByString:@" "];
                        
                        imageNameStr11 = [NSString stringWithFormat:@"%@%@",[arra objectAtIndex:0],[arra objectAtIndex:1]];
                        
                        [audioRecorder stop];
                    }
                }
                  
                 NSString *msg  = @"0";
                
                if ([imageNameStr isEqual:(id)[NSNull null]] || imageNameStr.length < 1)
                    
                {
                    msg = @"Please Select Image";
                }
                
                else if([_TagEmotionTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
                {
                    msg = @"Please select Emotion OR record emotions";
                    
                    
                }
                else if([_TagEmotionTF.text isEqualToString:@"What are you feeling?"] && checkvoicestr.length <1)
                {
                    msg = @"Please select Emotion OR record emotions";
                    
                }
                
                else if (_CommentTF.text.length >50)
                {
                    msg = @"Please enter comment in limit character";
                }
                
                if (![msg isEqualToString:@"0"])
                {
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                    [alert show];
                }
                
                else
                {
                    if (public==false) {
                        
                        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Outer_frnd_count"] integerValue] > 0)
                        {
                            NSLog(@"india");
                            [self.view showActivityViewWithLabel:@"Loading"];
                            
                            [self CallTagEmotionouter];
                            [_BackBtnobj setEnabled:NO];
                            [_HomeBtnobj setEnabled:NO];
                        }
                        else
                        {
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You have no friends in your outer circle, please add from contacts" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                            alert.tag=1007;
                            [alert show];
                        }
                     }
                }
            }
        else  if([in_ou_oth isEqualToString:@"Both"])
        {
            NSString *checkvoicestr;
            if ([_detailstr isEqualToString:@"done"])
            {
                _Backgroundimg.image=_Backimg;
                imageNameStr=_imageNameStr1;
                base64_encoded_image=_base64_encoded_image1;
                
            }
            
            [audioRecorder stop];
            // [_recordButton setBackgroundImage:[UIImage imageNamed:@"microphone-(1).png"] forState:UIControlStateNormal];
            _progressLabel.hidden=YES;
            if ([recordstr isEqualToString:@"recorded"])
            {
                NSURL* url = [NSURL URLWithString:audioRecorder.url.path];
                
                NSString *urr=[url absoluteString];
                [recordeddata addObject:urr];
                int lastindex=[recordeddata count]-1;
                
                NSString *laststr=[recordeddata objectAtIndex:lastindex];
                checkvoicestr=laststr;
                if ([laststr isEqualToString:@""])
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please record your emotions" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    [alert show];
                }
                else
                {
                    NSData *daataa = [[NSData alloc] initWithContentsOfFile:laststr];
                    base64_encoded_image11 =  [Base64 encode:daataa];
                    
                    NSDate *dtTime = [NSDate date];
                    NSDateFormatter *df = [[NSDateFormatter alloc] init];
                    [df setDateFormat:@"dd-MMM-yyyy hh-MM-ss"];
                    imageNameStr11 = [df stringFromDate:dtTime];
                    NSArray *arra = [imageNameStr11 componentsSeparatedByString:@" "];
                    
                    imageNameStr11 = [NSString stringWithFormat:@"%@%@",[arra objectAtIndex:0],[arra objectAtIndex:1]];
                    
                    [audioRecorder stop];
                    
                    // NSData *data = [[NSData alloc] initWithContentsOfFile:audioRecorder.url.path];
                    // NSString *urr = [NSString stringWithUTF8String:[data bytes]];
                    //[recordeddata addObject:imageNameStr];
                    
                    
                }
            }
                NSLog(@"Long Press");
                
                BOOL stricterFilter = NO;
                NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
                NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
                NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
                NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
                
                NSString *msg  = @"0";
                
                if ([imageNameStr isEqual:(id)[NSNull null]] || imageNameStr.length < 1)
                    
                {
                    msg = @"Please Select Image";
                }
                else if([_TagEmotionTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
                {
                    msg = @"Please select Emotion OR record emotions";
                }
                else if([_TagEmotionTF.text isEqualToString:@"What are you feeling?"] && checkvoicestr.length <1)
                {
                    msg = @"Please select Emotion OR record emotions";
                    
                }
                else if (_CommentTF.text.length >50)
                {
                    msg = @"Please enter comment in limit character";
                }
                
                if (![msg isEqualToString:@"0"])
                {
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                    [alert show];
                }
                else
                {
                   if (public==false) {
                        
                        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Inner_frnd_count"] integerValue] >0 && [[[NSUserDefaults standardUserDefaults]valueForKey:@"Outer_frnd_count"] integerValue] > 0)
                        {
                            [self.view showActivityViewWithLabel:@"Loading"];
                            [self CallTagEmotioninandout];
                        }
                        
                        else if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Inner_frnd_count"] integerValue] >0 && [[[NSUserDefaults standardUserDefaults]valueForKey:@"Outer_frnd_count"] integerValue] < 1)
                        {
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You have no friends in your outer circle, please add from contacts" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                            alert.tag=1007;
                            [alert show];
                        }
                        else if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Inner_frnd_count"] integerValue] <1 && [[[NSUserDefaults standardUserDefaults]valueForKey:@"Outer_frnd_count"] integerValue] > 0)
                        {
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You have no friends in inner circle, please add from contacts" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                            alert.tag=1007;
                            [alert show];
                        }
                        else if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Inner_frnd_count"] integerValue] < 1 && [[[NSUserDefaults standardUserDefaults]valueForKey:@"Outer_frnd_count"] integerValue] < 1)
                        {
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You have no friends in any of the circle, please add from contacts" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                            alert.tag=1007;
                            [alert show];
                            
                        }

                }
                
            }
            
        }
    }
    else  if([public_private isEqualToString:@"Public"])
    {
        NSString *checkvoicestr;
        
        if ([_detailstr isEqualToString:@"done"])
        {
            _Backgroundimg.image=_Backimg;
            imageNameStr=_imageNameStr1;
            base64_encoded_image=_base64_encoded_image1;
            
        }
        
        [audioRecorder stop];
        [_recordButton setBackgroundImage:[UIImage imageNamed:@"microphone-(1).png"] forState:UIControlStateNormal];
        // _progressbarobj.hidden=YES;
        _progressLabel.hidden=YES;
        if ([recordstr isEqualToString:@"recorded"])
        {
            NSURL* url = [NSURL URLWithString:audioRecorder.url.path];
            
            NSString *urr=[url absoluteString];
            [recordeddata addObject:urr];
            int lastindex=[recordeddata count]-1;
            
            NSString *laststr=[recordeddata objectAtIndex:lastindex];
            checkvoicestr=laststr;
            if ([laststr isEqualToString:@""])
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please record your emotions" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
            }
            else
            {
                
                NSData *daataa = [[NSData alloc] initWithContentsOfFile:laststr];
                base64_encoded_image11 =  [Base64 encode:daataa];
                
                NSDate *dtTime = [NSDate date];
                NSDateFormatter *df = [[NSDateFormatter alloc] init];
                [df setDateFormat:@"dd-MMM-yyyy hh-MM-ss"];
                imageNameStr11 = [df stringFromDate:dtTime];
                
                NSArray *arra = [imageNameStr11 componentsSeparatedByString:@" "];
                
                imageNameStr11 = [NSString stringWithFormat:@"%@%@",[arra objectAtIndex:0],[arra objectAtIndex:1]];
                
                [audioRecorder stop];
            }
        }
        BOOL stricterFilter = NO;
        NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
        NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
        NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        
        NSString *msg  = @"0";
        
        if ([imageNameStr isEqual:(id)[NSNull null]] || imageNameStr.length < 1)
            
        {
            msg = @"Please Select Image";
        }
        
        else if([_TagEmotionTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
        {
            msg = @"Please select Emotion OR record voice";
            
        }
        else if([_TagEmotionTF.text isEqualToString:@"What are you feeling?"] && checkvoicestr.length <1)
        {
            msg = @"Please select Emotion OR record emotions";
            
        }
        
        
        else if (_CommentTF.text.length >50)
        {
            msg = @"Please enter comment in limit character";
            
        }
        
        if (![msg isEqualToString:@"0"])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
          [self.view showActivityViewWithLabel:@"Loading"];
           [self CallTagEmotionpublic];
        }
    }
    else
    {
    }
}

- (void)longPressed:(UIGestureRecognizer *)longPress {
    if(([longPress state] == UIGestureRecognizerStateEnded) || ([longPress state] == UIGestureRecognizerStateEnded)) {
        NSLog(@"long press ended");
        _imgbuttonobj.hidden=YES;
        [audioRecorder stop];
        checkstr=@"nonvoice";
        if (count <= 3)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please record your message for at least 3 seconds" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            _progressLabel.text=@"0 Sec";
            _imgbuttonobj.hidden=NO;
            // NSString *urr=[url absoluteString];
            // [recordeddata addObject:urr];
            int lastindex=[recordeddata count]-1;
            if (lastindex >1)
            {
                [recordeddata removeObjectAtIndex:lastindex];
            }
            // NSString *laststr=[recordeddata objectAtIndex:lastindex];
            recordstr=@"deleterecorded";
            _voicerecordviewobj.hidden=YES;
        }
        count=0;
        // [audioRecorder record];
        //[_playButton1 setBackgroundImage:[UIImage imageNamed:@"noun_mic_2408687.png"] forState:UIControlStateNormal];
         
         UIImage *btnImage = [UIImage imageNamed:@"noun_mic_2408687.png"];
         [_playButton1 setImage:btnImage forState:UIControlStateNormal];
         
         
        self.deletebtnobj.hidden=NO;
        [self.myTimer1 invalidate];
        self.myTimer1 = nil;
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        [audioSession setActive:NO error:nil];
        
    }
    else if([longPress state] == UIGestureRecognizerStateBegan) {
        
        NSLog(@"long press detected");
        recordstr=@"recorded";
        
        _progressLabel.hidden=NO;
        self.myTimer1 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateUI:) userInfo:nil repeats:YES];
        
       // [_playButton1 setBackgroundImage:[UIImage imageNamed:@"noun_mic_2408687.png"] forState:UIControlStateNormal];
        UIImage *btnImage = [UIImage imageNamed:@"noun_mic_2408687.png"];
        [_playButton1 setImage:btnImage forState:UIControlStateNormal];
              
        if (!audioRecorder.recording) {
            AVAudioSession *session = [AVAudioSession sharedInstance];
            [session setActive:YES error:nil];
            // Start recording
            
            [audioRecorder record];
            self.voicerecordviewobj.hidden=NO;
            self.deletebtnobj.hidden=YES;
            
        }
        
        if (player.playing) {
            [player stop];
        }
    }
    
}

- (IBAction)playTapped:(id)sender {
    NSLog(@"playTapped");
    if (!audioRecorder.recording){
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:audioRecorder.url error:nil];
        [player setDelegate:self];
        [player play];
    }
}
- (IBAction)deleteTapped:(id)sender
{
    // NSURL* url = [NSURL URLWithString:audioRecorder.url.path];
    _progressLabel.text=@"0 Sec";
    _imgbuttonobj.hidden=NO;
    // NSString *urr=[url absoluteString];
    // [recordeddata addObject:urr];
    int lastindex=[recordeddata count]-1;
    if (lastindex >1)
    {
        [recordeddata removeObjectAtIndex:lastindex];
    }
    //NSString *laststr=[recordeddata objectAtIndex:lastindex];
    recordstr=@"deleterecorded";
    
    _voicerecordviewobj.hidden=YES;
    // [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
}
#pragma mark - AVAudioRecorderDelegate

- (void) audioRecorderDidFinishRecording:(AVAudioRecorder *)avrecorder successfully:(BOOL)flag{
    NSLog(@"audioRecorderDidFinishRecording");
    [_playButton setEnabled:YES];
    [audioPlayer stop];
    [_voiceplayBtnobj setBackgroundImage:[UIImage imageNamed:@"play_button_green.png"] forState:UIControlStateNormal];
}

#pragma mark - AVAudioPlayerDelegate

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
    [_voiceplayBtnobj setBackgroundImage:[UIImage imageNamed:@"play_button_green.png"] forState:UIControlStateNormal];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Done"
                                                    message: @"Finish playing the recording!"
                                                   delegate: nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    // test if our control subview is on-screen
    if (_playButton.superview != nil) {
        if ([touch.view isDescendantOfView:_playButton]) {
            // we touched our control surface
            return NO; // ignore the touch
        }
    }
    return YES; // handle the touch
}


//}

//- (void)tapOnce:(UIGestureRecognizer *)gesture
//
//
//
////}

//- (void)tapTwice:(UIGestureRecognizer *)gesture

//}


- (void)tapTrice:(UIGestureRecognizer *)gesture
{
    //self.view.backgroundColor = [UIColor yellowColor];
}
- (IBAction)BackBtnAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField==_TagEmotionTF)
    {
       [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
        [_CommentTF endEditing:YES];
        _pickerviewobj11.hidden=NO;
        _hardTaglbl.hidden=NO;
        _SoftTaglbl.hidden=NO;
        _DoneBtnobj.hidden=NO;
        _selecttaglbl.hidden=NO;
        _txt_ownword.hidden=NO;
        _VIEW_OWNWORDS.hidden=NO;
        
        if (flag==1)
        {
            [_pickerviewobj11 reloadData];
            _pickerviewobj11.delegate=self;
        }
         self.VIEW_OWNWORDS.frame=CGRectMake(0, self.scrollViewObj.frame.size.height-60, self.view.frame.size.width, 56);
        //_pickerviewObj.backgroundColor=[UIColor whiteColor];
         [_txt_ownword resignFirstResponder];
         [textField resignFirstResponder];
        
        
       // [textField resignFirstResponder];
        
    }
    else if(textField==self.CommentTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 60)animated:YES];
        // [_UserTF endEditing:YES];
        
        //[_UserTF resignFirstResponder];
        
    }
    else
    if (textField==self.txt_ownword)
    {
        view_main_fame=_view_main.frame;
        CGRect f = _view_main.frame;
        f.origin.y = -200; // new y
        _view_main.frame = f;
        
        CGRect f1 = _VIEW_OWNWORDS.frame;
        f1.origin.y = self.view_main.frame.origin.y+self.view_main.frame.size.height+30; // new y
        _VIEW_OWNWORDS.frame = f1;
    }

    else
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
        [_CommentTF endEditing:YES];
        
    }
}

- (IBAction)DoneBtn:(id)sender {
    _pickerviewobj11.hidden=YES;
    _DoneBtnobj.hidden=YES;
    _selecttaglbl.hidden=YES;
    _hardTaglbl.hidden=YES;
    _SoftTaglbl.hidden=YES;
    checkstr=@"nonvoice";
    _txt_ownword.hidden=YES;
     _VIEW_OWNWORDS.hidden=YES;
    [_CommentTF resignFirstResponder];
    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    if(view_main_fame.size.height!=0)
    {
    _view_main.frame=  view_main_fame;
    }
  
}


- (IBAction)btn_private:(id)sender {
    public_private = @"Private";
    _view_inn_out.hidden=NO;
    
    [_btn_private setImage:[UIImage imageNamed:@"Ellipse 13.png"] forState:UIControlStateNormal];
    [_btn_public setImage:[UIImage imageNamed:@"circlegray.png"] forState:UIControlStateNormal];
}

- (IBAction)btn_public:(id)sender {
    public_private = @"Public";
    _view_inn_out.hidden=YES;
    [_btn_public setImage:[UIImage imageNamed:@"Ellipse 13.png"] forState:UIControlStateNormal];
    [_btn_private setImage:[UIImage imageNamed:@"circlegray.png"] forState:UIControlStateNormal];
}
- (IBAction)btn_inner:(id)sender {
    in_ou_oth=@"Inner";
     [_btninner setImage:[UIImage imageNamed:@"checkbox_40px.png"] forState:UIControlStateNormal];
     [_btnouter setImage:[UIImage imageNamed:@"square.png"] forState:UIControlStateNormal];
     [_btnboth setImage:[UIImage imageNamed:@"square.png"] forState:UIControlStateNormal];
}
- (IBAction)btn_both:(id)sender {
    in_ou_oth=@"Both";
     [_btnboth setImage:[UIImage imageNamed:@"checkbox_40px.png"] forState:UIControlStateNormal];
     [_btnouter setImage:[UIImage imageNamed:@"square.png"] forState:UIControlStateNormal];
     [_btninner setImage:[UIImage imageNamed:@"square.png"] forState:UIControlStateNormal];
}


- (IBAction)btn_outer:(id)sender {
    in_ou_oth=@"Outer";
    [_btnouter setImage:[UIImage imageNamed:@"checkbox_40px.png"] forState:UIControlStateNormal];
     [_btninner setImage:[UIImage imageNamed:@"square.png"] forState:UIControlStateNormal];
     [_btnboth setImage:[UIImage imageNamed:@"square.png"] forState:UIControlStateNormal];
}

- (IBAction)HomeBtn:(id)sender {
    BS1ViewController *pvc=[[BS1ViewController alloc]init];
   [self.navigationController pushViewController:pvc animated:YES];
    
}

-(void)CallTagEmotioninandout
{
    
    
    if ([_detailstr isEqualToString:@"done"])
    {
        _Backgroundimg.image=_Backimg;
        imageNameStr=_imageNameStr1;
        base64_encoded_image=_base64_encoded_image1;
        
    }
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"addTag" forKey:@"name"];
    
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    
    if ([recordstr isEqualToString:@"recorded"] && _TagEmotionTF.text.length >1)
    {
        
        [paramDict setValue:@"1" forKey:@"emotion_type"];
        
    }
    else
    {
        if ([recordstr isEqualToString:@"recorded"])
        {
            [paramDict setValue:@"1" forKey:@"emotion_type"];
            
        }
        else
        {
            [paramDict setValue:@"0" forKey:@"emotion_type"];
            
        }
    }
    if ([_TagEmotionTF.text isEqualToString:@"What are you feeling?"])
    {
        [paramDict setValue:@"" forKey:@"emotion_txt"];
        
    }
    else
    {
        [paramDict setValue:_TagEmotionTF.text forKey:@"emotion_txt"];
        
    }
    
    [paramDict setValue:base64_encoded_image11 forKey:@"emotion"];
    [paramDict setValue:mainemotionstr forKey:@"tag_emotion"];
    [paramDict setValue:subemotionid forKey:@"tag_sub_emotion_id"];
    [paramDict setValue:_CommentTF.text forKey:@"comment_txt"];
    [paramDict setValue:@"3" forKey:@"Tag_circle"];
    
    [paramDict setValue:base64_encoded_image forKey:@"img_file"];
    [paramDict setValue:imageNameStr forKey:@"img_name"];
    [paramDict setValue:@"png" forKey:@"img_ext"];
    
    
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"addTag" :dict :paramDict];
    
}

-(void)CallTagEmotionpublic
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"addTag" forKey:@"name"];
     NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
     [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    if ([recordstr isEqualToString:@"recorded"] && _TagEmotionTF.text.length >1)
    {
      [paramDict setValue:@"1" forKey:@"emotion_type"];
    }
    else
    {
        if ([recordstr isEqualToString:@"recorded"])
        {
            [paramDict setValue:@"1" forKey:@"emotion_type"];
            
        }
        else
        {
            [paramDict setValue:@"0" forKey:@"emotion_type"];
            
        }
    }
    if ([_TagEmotionTF.text isEqualToString:@"What are you feeling?"])
    {
        [paramDict setValue:@"" forKey:@"emotion_txt"];
        
    }
    else
    {
        [paramDict setValue:_TagEmotionTF.text forKey:@"emotion_txt"];
        
    }
    [paramDict setValue:base64_encoded_image11 forKey:@"emotion"];
    [paramDict setValue:mainemotionstr forKey:@"tag_emotion"];
    [paramDict setValue:subemotionid forKey:@"tag_sub_emotion_id"];
    [paramDict setValue:_CommentTF.text forKey:@"comment_txt"];
    [paramDict setValue:@"0" forKey:@"Tag_circle"];
    [paramDict setValue:base64_encoded_image forKey:@"img_file"];
    [paramDict setValue:imageNameStr forKey:@"img_name"];
    [paramDict setValue:@"png" forKey:@"img_ext"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"addTag" :dict :paramDict];
}

-(void)CallTagEmotion
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"addTag" forKey:@"name"];
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    if ([recordstr isEqualToString:@"recorded"] && _TagEmotionTF.text.length >1)
    {
        [paramDict setValue:@"1" forKey:@"emotion_type"];
    }
    else
    {
        if ([recordstr isEqualToString:@"recorded"])
        {
            [paramDict setValue:@"1" forKey:@"emotion_type"];
        }
        else
        {
            [paramDict setValue:@"0" forKey:@"emotion_type"];
        }
    }
    if ([_TagEmotionTF.text isEqualToString:@"What are you feeling?"])
    {
        [paramDict setValue:@"" forKey:@"emotion_txt"];
        
    }
    else
    {
        [paramDict setValue:_TagEmotionTF.text forKey:@"emotion_txt"];
        
    }
    [paramDict setValue:base64_encoded_image11 forKey:@"emotion"];
    [paramDict setValue:mainemotionstr forKey:@"tag_emotion"];
    [paramDict setValue:subemotionid forKey:@"tag_sub_emotion_id"];
    [paramDict setValue:_CommentTF.text forKey:@"comment_txt"];
    [paramDict setValue:@"1" forKey:@"Tag_circle"];
    [paramDict setValue:base64_encoded_image forKey:@"img_file"];
    [paramDict setValue:imageNameStr forKey:@"img_name"];
    [paramDict setValue:@"png" forKey:@"img_ext"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"addTag" :dict :paramDict];
    
}

-(void)CallTagEmotionouter

{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"addTag" forKey:@"name"];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    if ([recordstr isEqualToString:@"recorded"] && _TagEmotionTF.text.length >1)
    {
       [paramDict setValue:@"1" forKey:@"emotion_type"];
    }
    else
    {
        if ([recordstr isEqualToString:@"recorded"])
        {
            [paramDict setValue:@"1" forKey:@"emotion_type"];
        }
        else
        {
            [paramDict setValue:@"0" forKey:@"emotion_type"];
        }
    }
    if ([_TagEmotionTF.text isEqualToString:@"What are you feeling?"])
    {
        [paramDict setValue:@"" forKey:@"emotion_txt"];
        
    }
    else
    {
        [paramDict setValue:_TagEmotionTF.text forKey:@"emotion_txt"];
        
    }
    [paramDict setValue:base64_encoded_image11 forKey:@"emotion"];
    [paramDict setValue:mainemotionstr forKey:@"tag_emotion"];
    [paramDict setValue:subemotionid forKey:@"tag_sub_emotion_id"];
    
    [paramDict setValue:_CommentTF.text forKey:@"comment_txt"];
    [paramDict setValue:@"2" forKey:@"Tag_circle"];
    [paramDict setValue:base64_encoded_image forKey:@"img_file"];
    [paramDict setValue:imageNameStr forKey:@"img_name"];
    [paramDict setValue:@"png" forKey:@"img_ext"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"addTag" :dict :paramDict];
}

-(void) calltagMeFatch
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"tagMeFatch" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    [dict1 setValue:_str11 forKey:@"tag_id"];
    // [dict1 setValue:_str12 forKey:@"friend_username"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"tagMeFatch":dict :dict1];
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"addTag"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            FeedTagViewController *PVC=[[FeedTagViewController alloc]init];
            [self.navigationController pushViewController:PVC animated:YES];
        }
    }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"tagMeFatch"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            _idstr=[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"id"];
            _tagidstr=[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"tag_id"];
           _TagEmotionTF.text=@"What feeling do you read?";
             NSString *imgStr1 = [[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"tagImg"];
            
            setimgstr=imgStr1;
            if ([imgStr1 isEqual:(id)[NSNull null]] || imgStr1.length < 1 )
            {
                _Backgroundimg.image = [UIImage imageNamed:@" "];
                
            }
            else
            {
                [_Backgroundimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"tag_photo/realimage/",[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"tagImg"]]] placeholderImage:nil];
                _Backgroundimg.contentMode=UIViewContentModeScaleToFill;
          }
            
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"tagMePost"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            FeedTagViewController *PVC=[[FeedTagViewController alloc]init];
            [self.navigationController pushViewController:PVC animated:YES];
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"AudioTest"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
        }
        
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Inner_frnd_count"] forKey:@"Inner_frnd_count"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Outer_frnd_count"] forKey:@"Outer_frnd_count"];
        }
    }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *originalImage = info[UIImagePickerControllerEditedImage];
    
    // UIImage *originalImage = [info objectForKey:@"UIImagePickerControllerCropRect"];
    CGSize destinationSize1 = CGSizeMake(600, 400);
    UIGraphicsBeginImageContext(destinationSize1);
    [originalImage drawInRect:CGRectMake(0,0,destinationSize1.width,destinationSize1.height)];
    UIImage *newImage1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _Backgroundimg.image = newImage1;
    
    
    
    NSData *daataa = UIImagePNGRepresentation([info objectForKey:UIImagePickerControllerEditedImage]);
    // NSData *daataa = UIImagePNGRepresentation(imggs);
    
    base64_encoded_image =  [Base64 encode:daataa];
    
    NSDate *dtTime = [NSDate date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MMM-yyyy hh-MM-ss"];
    imageNameStr = [df stringFromDate:dtTime];
    
    NSArray *arra = [imageNameStr componentsSeparatedByString:@" "];
    
    imageNameStr = [NSString stringWithFormat:@"%@%@",[arra objectAtIndex:0],[arra objectAtIndex:1]];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    //[picker dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"image width is %f",_Backgroundimg.image.size.width);
    NSLog(@"image height is %f",_Backgroundimg.image.size.height);
    if (_Backgroundimg.image.size.width==400 && _Backgroundimg.image.size.height==400) {
    }
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* tView = (UILabel*)view;
    if (!tView)
    {
        //  inddd= row;
        tView = [[UILabel alloc] init];
        [tView setFont:[UIFont fontWithName:@"Helvetica" size:19]];
        tView.numberOfLines=2;
    }
     return tView;
}

-(void)calldefaultcameragallery
{
    UIActionSheet *selectImgAS = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Camera" otherButtonTitles:@"Gallery", nil];
    [selectImgAS setTag:6];
    selectImgAS.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [selectImgAS showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)myActionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    switch (buttonIndex)
    {
        case 0:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                //imagePicker.allowsEditing = NO;
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
                            imagePicker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                            [self presentModalViewController:imagePicker animated:YES];
                            // Access has been granted.
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

- (IBAction)TagpostBtn:(id)sender {
    
    NSString *checkvoicestr;
    [audioRecorder stop];
    [_recordButton setBackgroundImage:[UIImage imageNamed:@"microphone-(1).png"] forState:UIControlStateNormal];
    _progressLabel.hidden=YES;
    if ([recordstr isEqualToString:@"recorded"])
    {
        
        NSURL* url = [NSURL URLWithString:audioRecorder.url.path];
        
        NSString *urr=[url absoluteString];
        [recordeddata addObject:urr];
        int lastindex=[recordeddata count]-1;
        
        NSString *laststr=[recordeddata objectAtIndex:lastindex];
        checkvoicestr=laststr;
        if ([laststr isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please record your emotions" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
            
            NSData *daataa = [[NSData alloc] initWithContentsOfFile:laststr];
            base64_encoded_image11 =  [Base64 encode:daataa];
            
            NSDate *dtTime = [NSDate date];
            NSDateFormatter *df = [[NSDateFormatter alloc] init];
            [df setDateFormat:@"dd-MMM-yyyy hh-MM-ss"];
            imageNameStr11 = [df stringFromDate:dtTime];
            
            NSArray *arra = [imageNameStr11 componentsSeparatedByString:@" "];
            
            imageNameStr11 = [NSString stringWithFormat:@"%@%@",[arra objectAtIndex:0],[arra objectAtIndex:1]];
            
            [audioRecorder stop];
        }
    }
    NSString *msg  = @"0";
    
    if ([setimgstr isEqual:(id)[NSNull null]] || setimgstr.length < 1)
        
    {
        msg = @"Please Select Image";
    }
    else if([_TagEmotionTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
    {
        msg = @"Please select Emotion OR record emotions";
        
    }
    else if([_TagEmotionTF.text isEqualToString:@"What feeling do you read?"] && checkvoicestr.length < 1)
    {
        msg = @"Please select Emotion OR record emotions";
        
    }
    
    
    if (![msg isEqualToString:@"0"])
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    else
    {
        [self calltagmepost];
        
    }
}





-(void)calltagmepost
{
    [self.view showActivityViewWithLabel:@"Loading"];
    [_TagPostBtnobj setEnabled:NO];
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"tagMePost" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
    //[dict1 setValue:[[userarr objectAtIndex:btn.tag] valueForKey:@"id"] forKey:@"product_id"];
    // [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"reuest_id"]] forKey:@"requestToId"];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:_tagidstr forKey:@"tag_id"];
    
    [dict1 setValue:_idstr forKey:@"tagging_to"];
    if ([recordstr isEqualToString:@"recorded"] && _TagEmotionTF.text.length >1)
    {
        [dict1 setValue:@"1" forKey:@"emotion_type"];
    }
    else
    {
        if ([recordstr isEqualToString:@"recorded"])
        {
            [dict1 setValue:@"1" forKey:@"emotion_type"];
        }
        else
        {
            [dict1 setValue:@"0" forKey:@"emotion_type"];
        }
    }
    if ([_TagEmotionTF.text isEqualToString:@"What feeling do you read?"])
    {
        [dict1 setValue:@"" forKey:@"emotion_txt"];
    }
    else
    {
        [dict1 setValue:_TagEmotionTF.text forKey:@"emotion_txt"];
    }
    [dict1 setValue:mainemotionstr forKey:@"tagMe_emotion"];
    [dict1 setValue:subemotionid forKey:@"tagMe_sub_emotion_id"];
    [dict1 setValue:base64_encoded_image11 forKey:@"emotion"];
    [dict1 setValue:_CommentTF.text forKey:@"comment"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"tagMePost":dict :dict1];
}
-(void) processFailed :(NSError *)responseDictionary
{
    NSLog(@"error");
    [_BackBtnobj setEnabled:YES];
    [_HomeBtnobj setEnabled:YES];
    [self.view hideActivityView];
}
- (IBAction)ImgBtnAction:(id)sender
{
    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    [_CommentTF endEditing:YES];
    if (flag==1)
    {
        //chkBtn = @"country";
       _TagEmotionTF.text=@"Feeling great";
       [_pickerviewobj11 reloadData];
    }
    _pickerviewobj11.hidden=NO;
    _hardTaglbl.hidden=NO;
    _SoftTaglbl.hidden=NO;
    _DoneBtnobj.hidden=NO;
    _VIEW_OWNWORDS.hidden=NO;
    _txt_ownword.hidden=NO;
    _selecttaglbl.hidden=NO;
    [_CommentTF resignFirstResponder];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_pickerviewobj11)
    {
        flag=1;
        return [Listarray_show count];
    }
    else
    {
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Emotionlist";
    EmotionlistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"EmotionlistTableViewCell" owner:self options:nil];
         cell = [nib objectAtIndex:0];
    }
    cell.backemobtnobj.tag = indexPath.row;
    [cell.backemobtnobj addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    if (tableView==_pickerviewobj11)
    {
        flag=1;
        cell.arrowimg.hidden=NO;
        cell.emotionlbl.textColor = [UIColor whiteColor];
        cell.emotionlbl.text= [Listarray_show objectAtIndex:indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_pickerviewobj11)
    {
        NSString *inde = [NSString stringWithFormat:@"%d", indexPath.row];
        NSNumber *num = [NSNumber numberWithInteger: [inde integerValue]];
        inddd = [num intValue];
        flag=1;
        _TagEmotionTF.text = [Listarray_show objectAtIndex:indexPath.row];
        mainemotionstr=[Listarray_show objectAtIndex:indexPath.row];
        int myInteger = indexPath.row+1;
        hardtagid =[NSString stringWithFormat:@"%i", myInteger];
    }
}
-(void)clickAction : (UIButton *) btn
{
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 38;
}

- (void)methodToUpdateProgress
{
    if(someFloat ==0)
    {
      someFloat = someFloat + 10;
    }
    else
    {
      [audioRecorder stop];
    }
}
-(void)calltimerAction
{
    someFloat=0;
    [player stop];
    [_recordButton setBackgroundImage:[UIImage imageNamed:@"microphone-(1).png"] forState:UIControlStateNormal];
    _progressLabel.hidden=YES;
    _recordButton.hidden=NO;
    _stopButton.hidden=YES;
    [_recordButton setUserInteractionEnabled:NO];
}

- (void)updateUI:(NSTimer *)timer
{
    count++;
    if (count <=10)
    {
        self.progressLabel.text = [NSString stringWithFormat:@"%d Sec",count*1];
    }
    else
    {
        [self.myTimer1 invalidate];
        self.myTimer1 = nil;
    }
}

-(void)audioRecorderEncodeErrorDidOccur:
(AVAudioRecorder *)recorder
                                  error:(NSError *)error
{
    NSLog(@"Encode Error occurred");
}

-(void)callvoicetest
{
    [self.view showActivityViewWithLabel:@"Loading"];
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"AudioTest" forKey:@"name"];
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:base64_encoded_image forKey:@"fileA"];
    [paramDict setValue:@"A" forKey:@"section"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"VoiceTest" :dict :paramDict];
}

- (IBAction)VoiceBtnAction:(id)sender
{
    if (audioPlayer.playing)
    {
       [audioPlayer stop];
       [_voiceplayBtnobj setBackgroundImage:[UIImage imageNamed:@"play_button_green.png"] forState:UIControlStateNormal];
    }
    else
    {
        NSString *voicename=voicestr;
        // NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/EmotionAudio/%@",voicename];
         NSString *mainUrl =[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"EmotionAudio/",voicename];
        NSURL *url = [NSURL URLWithString:mainUrl];
        NSData *data = [NSData dataWithContentsOfURL:url];
        audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:nil];
        [audioPlayer play];
        audioPlayer.delegate = self;
        [_voiceplayBtnobj setBackgroundImage:[UIImage imageNamed:@"pause_button_green.png"] forState:UIControlStateNormal];
    }
}

-(void)callfetchprofile
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"getProfileInfo" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"getProfileInfo" :dict :dict1];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        NSLog(@"You have clicked Cancel");
        if(alertView.tag == 1007)
        {
            FriendsViewController *Hgn= [[FriendsViewController alloc]init];
            [Hgn setStr1:@"done"];
            [self.navigationController pushViewController:Hgn animated:YES];
        }
        else
        {
        }
    }
}

-(void)callnetconnection
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus status = [reachability currentReachabilityStatus];
    if(status == NotReachable)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"You should connect with wifi for optimal use." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
@end
