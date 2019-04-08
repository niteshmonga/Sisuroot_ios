
#import "ViewController.h"
#import <Contacts/Contacts.h>
#import "MyWebserviceManager.h"
#import "ProfileViewController.h"
#import "FeedViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import "Base64.h"
#import "UIImageView+WebCache.h"
#import "SCLAlertView.h"
#import "UIView+RNActivityView.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
#import "Reachability.h"
#import "FriendsViewController.h"
#import "BS1ViewController.h"
#import "EmotionlistTableViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface ViewController () <AVAudioRecorderDelegate, AVAudioPlayerDelegate>
{
    NSMutableArray *Colores1;
    NSMutableArray *Colores2;
    NSMutableArray *Colores3;
    BOOL flag;
    BOOL public;
    BOOL flag1;
    NSMutableArray *recordeddata;
    NSString *chkBtn;
    NSMutableArray *FilteredDevices;
    BOOL isfiltered;
    NSDictionary *result;
    NSMutableArray *publicarr;
    NSString *publicstr;
    NSString *privatestr;
    NSMutableArray *hardarr;
    NSMutableArray *softarr;
    NSString *hardtagid;
    UIImageView *imgdetail;
    int inddd;
    NSString *setimgstr;
    UILongPressGestureRecognizer *longpress;
    UITapGestureRecognizer *tapOnce;
    UITapGestureRecognizer *tapTwice;
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    
    return YES;
}
-(void)viewDidAppear:(BOOL)animated
{
    [self emotionsListingcall];
    [self callfetchprofile];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self callfetchprofile];
    [self callnetconnection];
    
    
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
    //_playButton.hidden=YES;
    _Emotionlblobj.hidden=YES;
    [self emotionsListingcall];
    [self.CommentTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.TagEmotionTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
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
    
    _indcatorlbl.layer.cornerRadius=2;
    _indcatorlbl.clipsToBounds=YES;
    _indcatorlbl.layer.borderWidth =1.0f;
    
    isfiltered=false;
    _pickerviewobj11.hidden=YES;
    _pickerviewobj12.hidden=YES;
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
        // _BackBtnobj.hidden=YES;
        _TagEmotionTF.text=@"What feeling do you read?";
        
        _HomeBtnobj.hidden=NO;
        // _CommentTF.hidden=YES;
        _CircleBtnobj.hidden=YES;
        _Switchobj.hidden=YES;
        _Switchstmtlbl.hidden=YES;
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
        _CircleBtnobj.hidden=YES;
        _Switchobj.hidden=YES;
        _Switchstmtlbl.hidden=YES;
        _TagPostBtnobj.hidden=NO;
        _CircleBtnobj.hidden=YES;
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
    
    // Do any additional setup after loading the view from its nib.
    //pictableObj=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //pictableObj1=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _Switchstmtlbl.text=@"Private";
    public=false;
    
    flag=1;
    
    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    
    
    tapOnce = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapOnce:)];
    tapTwice = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapTwice:)];
    UITapGestureRecognizer *tapTrice = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapTrice:)];
    
    longpress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [_CircleBtnobj addGestureRecognizer:longpress];
    // [longPress release];
    
    tapOnce.numberOfTapsRequired = 1;
    tapTwice.numberOfTapsRequired = 2;
    // tapTrice.numberOfTapsRequired = 3;
    //stops tapOnce from overriding tapTwice
    [tapOnce requireGestureRecognizerToFail:tapTwice];
    [tapTwice requireGestureRecognizerToFail:tapTrice];
    
    [self.CircleBtnobj addGestureRecognizer:tapOnce];
    [self.CircleBtnobj addGestureRecognizer:tapTwice];
    // [self.CircleBtnobj addGestureRecognizer:tapTrice];
    
    
    
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
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


- (IBAction)CircleBtnAction:(id)sender {
    
    
    //[self MeFirst];
    //    if (flag==1) {
    //        flag=0;
    //        _FriendCircleView.hidden=NO;
    //    }
    //    else{
    //        flag=1;
    //        _FriendCircleView.hidden=YES;
    //
    //    }
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
        if([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
            
            switch ((int)[[UIScreen mainScreen] nativeBounds].size.height) {
                    
                case 1136:
                    printf("iPhone 5 or 5S or 5C");
                    _playButton1.frame = CGRectMake(230, 12, 36, 36);
                    break;
                case 1334:
                    printf("iPhone 6/6S/7/8");
                    _playButton1.frame = CGRectMake(285, 12, 36, 36);
                    break;
                case 2208:
                    printf("iPhone 6+/6S+/7+/8+");
                    _playButton1.frame = CGRectMake(325, 12, 36, 36);
                    
                    break;
                case 2436:
                    printf("iPhone X, XS");
                    _playButton1.frame = CGRectMake(288, 12, 36, 36);
                    
                    break;
                case 2688:
                    printf("iPhone XS Max");
                    _playButton1.frame = CGRectMake(325, 12, 36, 36);
                    
                    break;
                    
                case 1792:
                    printf("iPhone XR");
                    _playButton1.frame = CGRectMake(325, 12, 36, 36);
                    
                    break;
                default:
                    printf("unknown");
            }
        }
        
        [_playButton1 setBackgroundImage:[UIImage imageNamed:@"701492-128.png"] forState:UIControlStateNormal];
        self.deletebtnobj.hidden=NO;
        [self.myTimer1 invalidate];
        self.myTimer1 = nil;
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        [audioSession setActive:NO error:nil];
        
    }
    else if([longPress state] == UIGestureRecognizerStateBegan) {
        
        NSLog(@"long press detected");
        recordstr=@"recorded";
        
        if([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
            
            switch ((int)[[UIScreen mainScreen] nativeBounds].size.height) {
                    
                case 1136:
                    printf("iPhone 5 or 5S or 5C");
                    _playButton1.frame = CGRectMake(223, 4, 50, 50);
                    break;
                case 1334:
                    printf("iPhone 6/6S/7/8");
                    _playButton1.frame = CGRectMake(278, 4, 50, 50);
                    break;
                case 2208:
                    printf("iPhone 6+/6S+/7+/8+");
                    _playButton1.frame = CGRectMake(317, 4, 50, 50);
                    
                    break;
                case 2436:
                    printf("iPhone X ,XS");
                    _playButton1.frame = CGRectMake(278, 4, 50, 50);
                    
                    break;
                    
                case 2688:
                    printf("iPhone XS Max");
                    _playButton1.frame = CGRectMake(317, 4, 50, 50);
                    
                    break;
                    
                case 1792:
                    printf("iPhone XR");
                    _playButton1.frame = CGRectMake(317, 4, 50, 50);
                    
                    break;
                default:
                    printf("unknown");
            }
        }
        
        
        
        _progressLabel.hidden=NO;
        self.myTimer1 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateUI:) userInfo:nil repeats:YES];
        
        [_playButton1 setBackgroundImage:[UIImage imageNamed:@"701492-256.png"] forState:UIControlStateNormal];
        
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




- (void)longPress:(UILongPressGestureRecognizer*)gesture {
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
    //        else if ([recordstr isEqualToString:@"deleterecorded"])
    //        {
    //             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please record your emotions" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    //            [alert show];
    //        }
    
    //    if ([checkstr isEqualToString:@"nonvoice"])
    //    {
    
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
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
                    [_CircleBtnobj setImage:[UIImage imageNamed:@"both_circle-green150.png"] forState:UIControlStateNormal];
                    // [_CircleBtnobj setSelected:YES];
                    
                    [self.view showActivityViewWithLabel:@"Loading"];
                    
                    [self CallTagEmotioninandout];
                    [_CircleBtnobj setEnabled:NO];
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
//}

- (void)tapOnce:(UIGestureRecognizer *)gesture
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
    //        else if([recordstr isEqualToString:@"deleterecorded"])
    //        {
    //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please record your emotions" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    //            [alert show];
    //        }
    
    
    //        if ([checkstr isEqualToString:@"nonvoice"])
    //        {
    
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
        
        if (public==false) {
            
            
            if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Inner_frnd_count"] integerValue] >0)
            {
                [_CircleBtnobj setImage:[UIImage imageNamed:@"inner_circle_green150.png"] forState:UIControlStateNormal];
                NSLog(@"epikso");
                
                
                [self.view showActivityViewWithLabel:@"Loading"];
                
                
                [self CallTagEmotion];
                
                [_CircleBtnobj setEnabled:NO];
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
            [_CircleBtnobj setImage:[UIImage imageNamed:@"both_circle_golden150.png"] forState:UIControlStateNormal];
            
            [self.view showActivityViewWithLabel:@"Loading"];
            
            
            [self CallTagEmotionpublic];
            [_CircleBtnobj setEnabled:NO];
            
        }
        //            i=i+1;
        //            [_recordButton setBackgroundImage:[UIImage imageNamed:@"microphone.png"] forState:UIControlStateNormal];
        //
        //            _recordButton.hidden=NO;
        //            [_recordButton setUserInteractionEnabled:YES];
        //
        //            _stopButton.hidden=YES;
        
    }
}


//}

- (void)tapTwice:(UIGestureRecognizer *)gesture
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
            
            // NSData *data = [[NSData alloc] initWithContentsOfFile:audioRecorder.url.path];
            // NSString *urr = [NSString stringWithUTF8String:[data bytes]];
            
            //[recordeddata addObject:imageNameStr];
            
            
            
            
        }
    }
    //        else if ([recordstr isEqualToString:@"deleterecorded"])
    //        {
    //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please record your emotions" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    //            [alert show];
    //        }
    
    //    if ([checkstr isEqualToString:@"nonvoice"])
    //    {
    
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
            
            if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Outer_frnd_count"] integerValue] > 0)
            {
                
                [_CircleBtnobj setImage:[UIImage imageNamed:@"outer_circle_green150.png"] forState:UIControlStateNormal];
                // [_CircleBtnobj setSelected:YES];
                
                NSLog(@"india");
                [self.view showActivityViewWithLabel:@"Loading"];
                
                [self CallTagEmotionouter];
                [_CircleBtnobj setEnabled:NO];
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
//}


- (void)tapTrice:(UIGestureRecognizer *)gesture
{
    //self.view.backgroundColor = [UIColor yellowColor];
}
- (IBAction)BackBtnAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)HardTagBtn:(id)sender {
    
    //    chkBtn = @"country";
    //
    //    if([chkBtn isEqualToString:@"country"])
    //    {
    //        [_pickerviewobj11 reloadData];
    //    }
    //    if ([chkBtn isEqualToString:@"city"])
    //    {
    //        [_pickerviewobj12 reloadData];
    //
    //
    //    }
    //    _pickerviewobj11.hidden=NO;
    //    _pickerviewobj12.hidden=NO;
    //    _hardTaglbl.hidden=NO;
    //    _SoftTaglbl.hidden=NO;
    //    _DoneBtnobj.hidden=NO;
    //
    //    _selecttaglbl.hidden=NO;
    //    //_pickerviewObj.backgroundColor=[UIColor whiteColor];
    //
    //    [_CommentTF resignFirstResponder];
    //    [_TagEmotionTF resignFirstResponder];
}
//    if (flag==1) {
//        flag=0;
//
//
//        pictableObj.hidden=NO;
//    }
//    else{
//        flag=1;
//        pictableObj.hidden=YES;
//
//    }


- (IBAction)SoftTagBtn:(id)sender {
    //    chkBtn = @"city";
    //
    //
    //
    //
    //    [_pickerviewobj11 reloadData];
    //
    //
    //    _selecttaglbl.hidden=NO;
    //    _pickerviewobj11.hidden=NO;
    //    _DoneBtnobj.hidden=NO;
    //    [_CommentTF resignFirstResponder];
    
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField==_TagEmotionTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
        [_CommentTF endEditing:YES];
        
        if (flag==1)
        {
            //chkBtn = @"country";
            _TagEmotionTF.text=@"Love";
            
            [_pickerviewobj11 reloadData];
        }
        
        if (flag1==1) {
            
            // chkBtn = @"city";
            [_pickerviewobj12 reloadData];
        }
        
        _pickerviewobj11.hidden=NO;
        _pickerviewobj12.hidden=NO;
        _hardTaglbl.hidden=NO;
        _SoftTaglbl.hidden=NO;
        _DoneBtnobj.hidden=NO;
        _selecttaglbl.hidden=NO;
        //_pickerviewObj.backgroundColor=[UIColor whiteColor];
        
        [textField resignFirstResponder];
        
    }
    else if(textField==self.CommentTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 60)animated:YES];
        // [_UserTF endEditing:YES];
        
        //[_UserTF resignFirstResponder];
        
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
    _pickerviewobj12.hidden=YES;
    _hardTaglbl.hidden=YES;
    _SoftTaglbl.hidden=YES;
    checkstr=@"nonvoice";
    [_CommentTF resignFirstResponder];
    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    
}

-(void)callpublicSwitchBtn
{
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"publicPrivateButton" forKey:@"name"];
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    //[paramDict setValue:_ForgotTF.text forKey:@"email"];username
    [paramDict setValue:publicstr forKey:@"mode"];
    
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"publicPrivateButton" :dict :paramDict];
    
}


-(void)callprivateSwitchBtn
{
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"publicPrivateButton" forKey:@"name"];
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    //    [paramDict setValue:_ForgotTF.text forKey:@"email"];username
    [paramDict setValue:privatestr forKey:@"mode"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"publicPrivateButton" :dict :paramDict];
    
}

- (IBAction)SwitchAction:(id)sender {
    
    if ([_Switchobj isOn])
    {
        public=true;
        _Switchstmtlbl.text=@"Public";
        
        //[self callpublicSwitchBtn];
    }
    else
    {
        public=false;
        
        _Switchstmtlbl.text=@"Private";
        //[self callprivateSwitchBtn];
        
    }
    
    
}
- (IBAction)HomeBtn:(id)sender {
    
    BS1ViewController *pvc=[[BS1ViewController alloc]init];
    //[pvc setStr2:@"feed"];
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
    
    //[paramDict setValue:[_uidstr valueForKey:@"id"] forKey:@"id"];
    
    //[paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    
    // }
    
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
    //        if (![_locationTF.text isEqualToString:[NSNull null]] || ![_locationTF.text isEqualToString:@" "])
    //        {
    [paramDict setValue:mainemotionstr forKey:@"tag_emotion"];
    [paramDict setValue:subemotionid forKey:@"tag_sub_emotion_id"];
    [paramDict setValue:_CommentTF.text forKey:@"comment_txt"];
    [paramDict setValue:@"0" forKey:@"Tag_circle"];
    
    // }
    
    [paramDict setValue:base64_encoded_image forKey:@"img_file"];
    [paramDict setValue:imageNameStr forKey:@"img_name"];
    [paramDict setValue:@"png" forKey:@"img_ext"];
    
    
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"addTag" :dict :paramDict];
    
}


-(void)CallTagEmotion
{
    //    _Backgroundimg.image=_Backimg;
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"addTag" forKey:@"name"];
    
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    
    //[paramDict setValue:[_uidstr valueForKey:@"id"] forKey:@"id"];
    //[paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    // }
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
    //        if (![_locationTF.text isEqualToString:[NSNull null]] || ![_locationTF.text isEqualToString:@" "])
    //        {
    [paramDict setValue:mainemotionstr forKey:@"tag_emotion"];
    [paramDict setValue:subemotionid forKey:@"tag_sub_emotion_id"];
    [paramDict setValue:_CommentTF.text forKey:@"comment_txt"];
    [paramDict setValue:@"1" forKey:@"Tag_circle"];
    
    // }
    
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
    //[paramDict setValue:[_uidstr valueForKey:@"id"] forKey:@"id"];
    
    //[paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    // }
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
    //        if (![_locationTF.text isEqualToString:[NSNull null]] || ![_locationTF.text isEqualToString:@" "])
    //        {
    [paramDict setValue:mainemotionstr forKey:@"tag_emotion"];
    [paramDict setValue:subemotionid forKey:@"tag_sub_emotion_id"];
    
    [paramDict setValue:_CommentTF.text forKey:@"comment_txt"];
    [paramDict setValue:@"2" forKey:@"Tag_circle"];
    // }
    [paramDict setValue:base64_encoded_image forKey:@"img_file"];
    [paramDict setValue:imageNameStr forKey:@"img_name"];
    [paramDict setValue:@"png" forKey:@"img_ext"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"addTag" :dict :paramDict];
    
}


-(void)emotionsListingcall
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"emotionsListing" forKey:@"name"];
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    //    [paramDict setValue:_ForgotTF.text forKey:@"email"];username
    // [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"emotionListing" :dict :paramDict];
    
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
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"emotionsListing"])
    {
        if ([[responseDictionary valueForKey:@"success"] integerValue] ==1)
        {
            //Colores1 =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            hardarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            if ([[[NSMutableArray alloc]initWithArray:[hardtagid valueForKey:@"child"]] isEqual:@" "])
            {
                
            }
            else
            {
                softarr =[[NSMutableArray alloc]initWithArray:[hardtagid valueForKey:@"child"]];
                
            }
            //  [pictableObj2 reloadData];
            
        }
    }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"addTag"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            
            
            ProfileViewController *PVC=[[ProfileViewController alloc]init];
            [self.navigationController pushViewController:PVC animated:YES];
            //Colores1 =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"publicPrivateButton"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            //            ActivityIdenter.hidden=YES;
            //            _indcatorlbl.hidden=YES;
            
            //            ProfileViewController *PVC=[[ProfileViewController alloc]init];
            //            [self.navigationController pushViewController:PVC animated:YES];
            publicarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            
        }
    }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"tagMeFatch"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            _idstr=[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"id"];
            _tagidstr=[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"tag_id"];
            //Colores1 =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            //softarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            _TagEmotionTF.text=@"What feeling do you read?";
            
            // _TagEmotionTF.text = [[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"emotionName"];
            //            _str3=[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"tag_id"];
            //
            NSString *imgStr1 = [[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"tagImg"];
            
            setimgstr=imgStr1;
            if ([imgStr1 isEqual:(id)[NSNull null]] || imgStr1.length < 1 )
            {
                _Backgroundimg.image = [UIImage imageNamed:@" "];
                
            }
            else
            {
                //imgdetail=[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                [_Backgroundimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/tag_photo/realimage/%@",[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"tagImg"]]] placeholderImage:nil];
                _Backgroundimg.contentMode=UIViewContentModeScaleToFill;
                
                
                //                [_Tagimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ec2-18-216-29-175.us-east-2.compute.amazonaws.com/servicebus/tag_photo/realimage/%@",[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"tagImg"]]] placeholderImage:nil];
                //                _Tagimg.contentMode=UIViewContentModeScaleToFill;
                
            }
            
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"tagMePost"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            //            ActivityIdenter.hidden=YES;
            //            _indcatorlbl.hidden=YES;
            [self.view hideActivityView];
            
            ProfileViewController *PVC=[[ProfileViewController alloc]init];
            [PVC setTagstr1:@"tagstr"];
            [self.navigationController pushViewController:PVC animated:YES];
            //publicarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"AudioTest"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            
            //            SectionBvoicetestViewController *LVC3=[[SectionBvoicetestViewController alloc]init];
            //
            //            [self.navigationController pushViewController:LVC3 animated:YES];
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

//-(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize
//{
//    CGFloat scale = 1.00f;
//    /*You can remove the below comment if you dont want to scale the image in retina   device .Dont forget to comment UIGraphicsBeginImageContextWithOptions*/
//    //UIGraphicsBeginImageContext(newSize);
//    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
//    [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
//    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//}

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
        //        UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"message!" message:@"you want to crop this image" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
        //        [alertcrp addButtonWithTitle:@"Crop "];
        //        [alertcrp show];
    }
}
- (IBAction)GalleryBtn:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)CameraBtn:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:nil];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (pickerView==_pickerviewobj)
    {
        flag=1;
        return [hardarr count];
    }
    else if(pickerView==_pickerviewobj1)
    {
        flag1=1;
        return [[[hardarr objectAtIndex:inddd] valueForKey:@"child"] count];
    }
    
    return 0;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView==_pickerviewobj)
    {
        flag=1;
        return [[hardarr objectAtIndex:row] valueForKey:@"emotions"];
    }
    else if(pickerView==_pickerviewobj1)
    {
        flag1=1;
        return [[[[hardarr objectAtIndex:inddd] valueForKey:@"child"] objectAtIndex:row] valueForKey:@"soft_emotion"];
    }
    
    return 0;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView==_pickerviewobj)
    {
        
        inddd = row;
        flag=1;
        _TagEmotionTF.text = [[hardarr objectAtIndex:row]valueForKey:@"emotions"];
        hardtagid = [[hardarr objectAtIndex:row]valueForKey:@"id"];
        [_pickerviewobj1 reloadAllComponents];
    }
    else if(pickerView==_pickerviewobj1)
    {
        flag1=1;
        _TagEmotionTF.text = [[[[hardarr objectAtIndex:inddd] valueForKey:@"child"] objectAtIndex:row] valueForKey:@"soft_emotion"];
    }
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
    
    
    if (pickerView==_pickerviewobj)
    {
        flag=1;
        [tView setTextAlignment:UITextAlignmentCenter];
        
        tView.text = [[hardarr objectAtIndex:row] valueForKey:@"emotions"];
        NSString *nameStr1=tView.text;
        nameStr1=[nameStr1 stringByAppendingString:@"   >"];
        tView.text=nameStr1;
    }
    else if(pickerView==_pickerviewobj1)
    {              flag1=1;
        
        [tView setTextAlignment:UITextAlignmentCenter];
        
        tView.text = [[[[hardarr objectAtIndex:inddd] valueForKey:@"child"] objectAtIndex:row] valueForKey:@"soft_emotion"];
        
    }
    
    // tView.text=[wishvalues objectAtIndex:row];
    return tView;
}


//- (IBAction)Extrabtn:(id)sender {
//    TagViewController *TVC=[[TagViewController alloc]init];
//    [self.navigationController pushViewController:TVC animated:YES];
//}
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
                imagePicker.sourceType =UIImagePickerControllerSourceTypeCamera;
                [self presentModalViewController:imagePicker animated:YES];
            }
            break;
        case 1:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
            {
                // Set source to the Photo Library
                imagePicker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                [self presentModalViewController:imagePicker animated:YES];
            }
            
            break;
        default:
            break;
    }
}

//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
//
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//
//}

//-(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize
//{
//    CGFloat scale = 1.00f;
//    /*You can remove the below comment if you dont want to scale the image in retina   device .Dont forget to comment UIGraphicsBeginImageContextWithOptions*/
//    //UIGraphicsBeginImageContext(newSize);
//    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
//    [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
//    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//}

//- (UIImage *)crop:(UIImage *)image inRect:(CGRect)cropRect
//{
//    CGImageRef cropRef = CGImageCreateWithImageInRect(image.CGImage, cropRect);
//    UIImage* cropImage = [UIImage imageWithCGImage:cropRef];
//    CGImageRelease(cropRef);
//
//    return cropImage;
//}

//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//
//    UIImage *originalImage = info[UIImagePickerControllerEditedImage];
//
//    // UIImage *originalImage = [info objectForKey:@"UIImagePickerControllerCropRect"];
//    CGSize destinationSize1 = CGSizeMake(800, 600);
//    UIGraphicsBeginImageContext(destinationSize1);
//    [originalImage drawInRect:CGRectMake(0,0,destinationSize1.width,destinationSize1.height)];
//    UIImage *newImage1 = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    // _Backgroundimg.image = newImage1;
//    NSData *daataa = UIImagePNGRepresentation([info objectForKey:UIImagePickerControllerEditedImage]);
//
//
//    base64_encoded_image =  [Base64 encode:daataa];
//
//
//    NSDate *dtTime = [NSDate date];
//    NSDateFormatter *df = [[NSDateFormatter alloc] init];
//    [df setDateFormat:@"dd-MMM-yyyy hh-MM-ss"];
//    imageNameStr = [df stringFromDate:dtTime];
//
//    NSArray *arra = [imageNameStr componentsSeparatedByString:@" "];
//
//    imageNameStr = [NSString stringWithFormat:@"%@%@",[arra objectAtIndex:0],[arra objectAtIndex:1]];
//
//
//
//    // [picker dismissModalViewControllerAnimated:YES];
//
//
//    ViewController *Tvc=[[ViewController alloc]init];
//    [Tvc setBackimg:newImage1];
//
//
//    [Tvc setImageNameStr1:imageNameStr];
//    [Tvc setBase64_encoded_image1:base64_encoded_image];
//    [Tvc setDetailstr:@"done"];
//
//    [self.navigationController pushViewController:Tvc animated:YES];
//
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//
//}

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
            
            // NSData *data = [[NSData alloc] initWithContentsOfFile:audioRecorder.url.path];
            // NSString *urr = [NSString stringWithUTF8String:[data bytes]];
            
            //[recordeddata addObject:imageNameStr];
            
            //            [self calltagmepost];
            //            i=i+1;
            //            [_recordButton setBackgroundImage:[UIImage imageNamed:@"microphone.png"] forState:UIControlStateNormal];
            //
            //            _recordButton.hidden=NO;
            //            [_recordButton setUserInteractionEnabled:YES];
            //
            //            _stopButton.hidden=YES;
            
        }
    }
    
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
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
    // ActivityIdenter.hidden=NO;
    
    NSLog(@"error");
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Network connection Error...." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    
    //alert.tag=2000;
    // [alert show];
    
}
- (IBAction)ImgBtnAction:(id)sender
{
    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    
    [_CommentTF endEditing:YES];
    
    if (flag==1)
    {
        //chkBtn = @"country";
        _TagEmotionTF.text=@"Love";
        
        [_pickerviewobj11 reloadData];
        
    }
    
    if (flag1==1) {
        
        // chkBtn = @"city";
        
        [_pickerviewobj12 reloadData];
    }
    
    
    _pickerviewobj11.hidden=NO;
    _pickerviewobj12.hidden=NO;
    _hardTaglbl.hidden=NO;
    _SoftTaglbl.hidden=NO;
    _DoneBtnobj.hidden=NO;
    
    _selecttaglbl.hidden=NO;
    [_CommentTF resignFirstResponder];
    //_pickerviewObj.backgroundColor=[UIColor whiteColor];
    
}

//- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
//{
//    if(alertView.tag==2000)
//    {
//       // [self callstorelocation];
//    }
//}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_pickerviewobj11)
    {
        flag=1;
        return [hardarr count];
    }
    else if(tableView==_pickerviewobj12)
    {
        flag1=1;
        return [[[hardarr objectAtIndex:inddd] valueForKey:@"child"] count];
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
    //[tapTwice setCancelsTouchesInView:YES];
    [longpress setCancelsTouchesInView:YES];
    //[tapOnce setCancelsTouchesInView:YES];
    
    cell.backemobtnobj.tag = indexPath.row;
    
    [cell.backemobtnobj addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    if (tableView==_pickerviewobj11)
    {
        flag=1;
        cell.arrowimg.hidden=NO;
        cell.emotionlbl.text= [[hardarr objectAtIndex:indexPath.row] valueForKey:@"emotions"];
        
    }
    else if(tableView==_pickerviewobj12)
    {
        
        flag1=1;
        cell.arrowimg.hidden=YES;
        cell.emotionlbl.text= [[[[hardarr objectAtIndex:inddd] valueForKey:@"child"] objectAtIndex:indexPath.row] valueForKey:@"soft_emotion"];
     }
    //     [tapTwice setCancelsTouchesInView:NO];
    //     [longpress setCancelsTouchesInView:NO];
    //     [tapOnce setCancelsTouchesInView:NO];
    //     [tapper setCancelsTouchesInView:NO];
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:NO];
    EmotionlistTableViewCell *cell = (EmotionlistTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    //cell.backimg.image=[UIImage imageNamed:@"light-gray.jpg"];
    //cell.contentView.backgroundColor = [UIColor lightGrayColor];
    if (tableView==_pickerviewobj11)
    {
       
        NSString *inde = [NSString stringWithFormat:@"%d", indexPath.row];
        NSNumber *num = [NSNumber numberWithInteger: [inde integerValue]];
        inddd = [num intValue];
        
        flag=1;
        _TagEmotionTF.text = [[hardarr objectAtIndex:indexPath.row]valueForKey:@"emotions"];
        mainemotionstr=[[hardarr objectAtIndex:indexPath.row]valueForKey:@"emotions"];
        hardtagid = [[hardarr objectAtIndex:indexPath.row]valueForKey:@"id"];
        [_pickerviewobj12 reloadData];
        
    }
    if(tableView==_pickerviewobj12)
    {
        flag1=1;
         subemotionid=[[[[hardarr objectAtIndex:inddd] valueForKey:@"child"] objectAtIndex:indexPath.row] valueForKey:@"id"];
        
        _TagEmotionTF.text = [[[[hardarr objectAtIndex:inddd] valueForKey:@"child"] objectAtIndex:indexPath.row] valueForKey:@"soft_emotion"];
       
    }
}

// [tableView deselectRowAtIndexPath:indexPath animated:YES];

//        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;


//}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    // Add your Colour.
    EmotionlistTableViewCell *cell = (EmotionlistTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [self setCellColor:[UIColor lightGrayColor] ForCell:cell];
    // cell.backimg.image=[UIImage imageNamed:@"white_shap.jpg"];
    //highlight colour
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    // Reset Colour.
    EmotionlistTableViewCell *cell = (EmotionlistTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [self setCellColor:[UIColor whiteColor] ForCell:cell]; //normal color
    //cell.backimg.image=[UIImage imageNamed:@"white_shap.jpg"];
    //cell.backimg.image=[UIImage imageNamed:@"light-gray.jpg"];
    
}
//
- (void)setCellColor:(UIColor *)color ForCell:(UITableViewCell *)cell {
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor whiteColor];
    
}



-(void)clickAction : (UIButton *) btn
{
    
    //      if (flag==1)
    //     {
    //
    //         NSString *inde = [NSString stringWithFormat:@"%ld", (long)btn.tag];
    //         NSNumber *num = [NSNumber numberWithInteger: [inde integerValue]];
    //         inddd = [num intValue];
    //
    //         flag=1;
    //         _TagEmotionTF.text = [[hardarr objectAtIndex:btn.tag]valueForKey:@"emotions"];
    //         hardtagid = [[hardarr objectAtIndex:btn.tag]valueForKey:@"id"];
    //         [_pickerviewobj12 reloadData];
    //     }
    //      else
    //     {
    //          flag1=1;
    //         _TagEmotionTF.text = [[[[hardarr objectAtIndex:inddd] valueForKey:@"child"] objectAtIndex:btn.tag] valueForKey:@"soft_emotion"];
    //      }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 38;
}
- (IBAction)voiceBtnAction:(id)sender
{
    
}
 
- (void)methodToUpdateProgress
{
    if(someFloat ==0){
        
        someFloat = someFloat + 10;
        
        // [_progressbarobj setProgress:someFloat animated:YES];
        
    }
    else
    {
        
        //_progressbarobj.hidden=YES;
        [audioRecorder stop];
        
    }
    
}
-(void)calltimerAction
{
    someFloat=0;
    //  _nextbtnobj.hidden=NO;
    [player stop];
    
    // [_nextbtnobj setUserInteractionEnabled:YES];
    [_recordButton setBackgroundImage:[UIImage imageNamed:@"microphone-(1).png"] forState:UIControlStateNormal];
    // _progressbarobj.hidden=YES;
    _progressLabel.hidden=YES;
    _recordButton.hidden=NO;
    _stopButton.hidden=YES;
    [_recordButton setUserInteractionEnabled:NO];
    
}
- (IBAction)recordAudio:(id)sender {
    //  _nextbtnobj.hidden=YES;
    someFloat=0;
    // _recordButton.hidden=YES;
    checkstr=@"voice";
    [_stopButton setBackgroundImage:[UIImage imageNamed:@"stoprecord.png"] forState:UIControlStateNormal];
    
    // [self methodToUpdateProgress];
    count =0;
    [audioRecorder record];
    //    if (!_audioRecorder.recording)
    //    {
    _stopButton.hidden=NO;
    
    //        _playButton.enabled = NO;
    //        _stopButton.enabled = YES;
    //        _progressbarobj.hidden=NO;
    //        [self methodToUpdateProgress];
    //        [_audioRecorder record];
    //
    //    }
    _progressLabel.hidden=NO;
    self.myTimer1 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateUI:) userInfo:nil repeats:YES];
    
    myTimer = [NSTimer scheduledTimerWithTimeInterval:30.0 repeats:NO block:^(NSTimer * _Nonnull timer)
               {
                   [self calltimerAction];
               }];
    
    
    
    
    
}


- (void)updateUI:(NSTimer *)timer
{
    count++;
    
    if (count <=10)
    {
        self.progressLabel.text = [NSString stringWithFormat:@"%d Sec",count*1];
        // _progressbarobj.progress = (float)count/60.0f;
    }
    else
    {
        [self.myTimer1 invalidate];
        self.myTimer1 = nil;
    }
}


- (IBAction)playAudio:(id)sender {
    //    if (!audioRecorder.recording)
    //    {
    //        _stopButton.enabled = YES;
    //        _recordButton.enabled = NO;
    //
    //        NSError *error;
    //
    //        player = [[AVAudioPlayer alloc]
    //                        initWithContentsOfURL:audioRecorder.url
    //                        error:&error];
    //
    //        player.delegate = self;
    //
    //        if (error)
    //            NSLog(@"Error: %@",
    //                  [error localizedDescription]);
    //        else
    //            [player play];
    //        _progressbarobj.hidden=YES;
    //        [self.myTimer1 invalidate];
    //        self.myTimer1 = nil;
    //    }
    
}

- (IBAction)stopAudio:(id)sender {
    
    // _stopButton.enabled = NO;
    // _playButton.enabled = YES;
    // _recordButton.enabled = YES;
    
    
    if (audioRecorder.recording)
    {
        [audioRecorder stop];
        [self.myTimer1 invalidate];
        self.myTimer1 = nil;
        [_stopButton setBackgroundImage:[UIImage imageNamed:@"play1.png"] forState:UIControlStateNormal];
        
    }
    else if(!audioRecorder.recording)
    {
        
        if (player.playing)
        {
            [player stop];
            [_stopButton setBackgroundImage:[UIImage imageNamed:@"play1.png"] forState:UIControlStateNormal];
            
        }
        else
        {
            NSError *error;
            
            player = [[AVAudioPlayer alloc]
                      initWithContentsOfURL:audioRecorder.url
                      error:&error];
            
            player.delegate = self;
            
            if (error)
                NSLog(@"Error: %@",
                      [error localizedDescription]);
            else
                [player play];
            [self.myTimer1 invalidate];
            self.myTimer1 = nil;
            
            
            
            [_stopButton setBackgroundImage:[UIImage imageNamed:@"pause1.png"] forState:UIControlStateNormal];
            
        }
        
        
    }
    
    //    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    //    [audioSession setActive:NO error:nil];
    //    NSString *urr=[recorder.url absoluteString];
    //    [recordeddata addObject:urr];
}



//-(void)audioPlayerDidFinishPlaying:
//(AVAudioPlayer *)player successfully:(BOOL)flag
//{
//   // _recordButton.hidden = YES;
//    [audioRecorder stop];
//    // [_recordButton setUserInteractionEnabled:YES];
//    _stopButton.hidden = NO;
//    // [_stopButton setBackgroundImage:[UIImage imageNamed:@"play1.png"] forState:UIControlStateNormal];
//
//}

//-(void)audioPlayerDecodeErrorDidOccur:
//(AVAudioPlayer *)player
//                                error:(NSError *)error
//{
//    NSLog(@"Decode Error occurred");
//}
//
//-(void)audioRecorderDidFinishRecording:
//(AVAudioRecorder *)recorder
//                          successfully:(BOOL)flag
//{
//}

-(void)audioRecorderEncodeErrorDidOccur:
(AVAudioRecorder *)recorder
                                  error:(NSError *)error
{
    NSLog(@"Encode Error occurred");
}


- (IBAction)NextBtnAction:(id)sender
{
    
    //    _stopButton.enabled = NO;
    //    _playButton.enabled = NO;
    
    [audioRecorder stop];
    
    NSURL* url = [NSURL URLWithString:audioRecorder.url.path];
    
    NSString *urr=[url absoluteString];
    [recordeddata addObject:urr];
    int lastindex=[recordeddata count]-1;
    
    NSString *laststr=[recordeddata objectAtIndex:lastindex];
    if ([laststr isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please record your voice first" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        
        NSData *daataa = [[NSData alloc] initWithContentsOfFile:laststr];
        
        base64_encoded_image =  [Base64 encode:daataa];
        
        NSDate *dtTime = [NSDate date];
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"dd-MMM-yyyy hh-MM-ss"];
        imageNameStr = [df stringFromDate:dtTime];
        
        NSArray *arra = [imageNameStr componentsSeparatedByString:@" "];
        
        imageNameStr = [NSString stringWithFormat:@"%@%@",[arra objectAtIndex:0],[arra objectAtIndex:1]];
        
        [audioRecorder stop];
        
        
        i=i+1;
        [_recordButton setBackgroundImage:[UIImage imageNamed:@"microphone.png"] forState:UIControlStateNormal];
        
        _recordButton.hidden=NO;
        [_recordButton setUserInteractionEnabled:YES];
        
        _stopButton.hidden=YES;
        
    }
    
}

- (IBAction)HomeBtnAction:(id)sender {
    
    BS1ViewController *LVC3=[[BS1ViewController alloc]init];
    
    [self.navigationController pushViewController:LVC3 animated:YES];
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



//-(void)callvoicetest2
//{
//    [self.view showActivityViewWithLabel:@"Loading"];
//
//    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//    [dict setValue:@"AudioTest1" forKey:@"name"];
//
//    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
//
//    [paramDict setValue:base64_encoded_image forKey:@"fileB"];
//    // [paramDict setValue:base64_encoded_image1 forKey:@"fileB"];
//    [paramDict setValue:@"B" forKey:@"section"];
//
//    //    [paramDict setValue:@"mp3" forKey:@"ext"];
//    [paramDict setValue:_questionlbl2.text forKey:@"title"];
//    // [paramDict setValue:@"B" forKey:@"titleB"];
//    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
//    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
//    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
//    [webServiceManager setDelegateMethode:self];
//    [webServiceManager callMyWebServiceManager:@"VoiceTest" :dict :paramDict];
//}

//
//- (void)chatPanelViewShouldBeginRecord:(WARVChatPanelView *)view
//{
//    //prepare for recording ..
//    [self performSelector:@selector(prepareForRecord) withObject:nil afterDelay:1.5f];
//}
//
//- (void)prepareForRecord
//{
//    [self.chatPanelView didBeginRecord];
//}
//
//- (void)chatPanelViewShouldCancelRecord:(WARVChatPanelView *)view
//{
//    //if system didn't prepare for record
//    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(prepareForRecord) object:nil];
//}
//
//- (void)chatPanelViewShouldFinishedRecord:(WARVChatPanelView *)view
//{
//    //if system didn't prepare for record
//    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(prepareForRecord) object:nil];
//}

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
        NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/EmotionAudio/%@",voicename];
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
    
    //[dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
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
@end

