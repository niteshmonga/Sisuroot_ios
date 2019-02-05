#import "SectionCvoicetestViewController.h"
#import "sectionAvoicetestViewController.h"
#import "VoiceTestViewController.h"
#import "SWRevealViewController.h"
#import "MyWebserviceManager.h"
#import "FeedViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "Base64.h"
#import "UIView+RNActivityView.h"
#import "BS1ViewController.h"

@interface SectionCvoicetestViewController () <AVAudioRecorderDelegate, AVAudioPlayerDelegate>
{
    AVAudioRecorder *audioRecorder;
    AVAudioPlayer *player;
    float someFloat;
    
    NSTimer *myTimer;
    NSMutableArray *arr2;
    NSMutableArray *arr1;
    int i;
    int j;
    NSMutableArray *recordeddata;
    
    NSString *base64_encoded_image;
    int count;
    NSString *imageNameStr;
    NSString *arr2str;
    NSString *arr1str;
    int n1;
    int n2;
    NSString *base64_encoded_image1;
    NSString *imageNameStr1;
}
@end

@implementation SectionCvoicetestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _stopButton.hidden=YES;
    _playButton.hidden=YES;
    
    // _progressbarobj = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    _progressLabel.layer.cornerRadius=18;
    _progressLabel.clipsToBounds=YES;
    // _progressLabel.layer.borderWidth =1.0f;
    
    _nextbtnobj.layer.cornerRadius=6;
    _nextbtnobj.clipsToBounds=YES;
    //_nextbtnobj.layer.borderWidth =1.0f;
    
    _playButton.layer.cornerRadius=6;
    _playButton.clipsToBounds=YES;
    _stopButton.layer.cornerRadius=6;
    _stopButton.clipsToBounds=YES;
    
 
    [self.view addSubview:_progressbarobj];
    _progressbarobj.center = self.view.center;
    
    count =0;
    recordeddata=[[NSMutableArray alloc]init];
    
    _progressbarobj.hidden=YES;
    _progressLabel.hidden=YES;
    i=0;
    self.navigationController.navigationBar.hidden=YES;
    [_nextbtnobj setUserInteractionEnabled:NO];
    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    [_MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    // _progressbarobj = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    someFloat = 0;
    
    // myTimer = [NSTimer scheduledTimerWithTimeInterval:100 target:self selector:@selector(methodToUpdateProgress1) userInfo:nil repeats:YES];
    
    arr2=[[NSMutableArray alloc]initWithObjects:@"Have you noticed any changes in your appetite? How is your appetite?"
          ,@"Have you noticed any changes to your weight? How active are you?"
          ,@"Do you actually enjoy food as you usually would?"
           ,@"What has your sleep been like lately?"
          ,@"Do you find it difficult to fall asleep? (Initial insomnia)"
           ,@"Do you find it difficult to stay asleep? (Middle insomnia)"
          ,@"What time do you wake up?Is that usual for you? (Early morning wakening)"
           ,nil];
    
    
    arr1=[[NSMutableArray alloc]initWithObjects:@"Q2: Have you been able to focus on things lately?"
          ,@"Q2: What’s your concentration like?"
          ,@"Q2: When you watch TV, are you able to follow what you watch?"
          ,@"Q2: Do you find it difficult to read books because you can’t concentrate? (if mention of reading as a hobby)"
          ,@"Q2: Have you had problems making decisions?"
          ,@"How has having to make decisions affected you lately? (empathy)"
          ,@"Q2: Can you watch a half-hour television show from start to finish without losing your focus?",nil];
    
    int count = [arr2 count];
    for (int i = 0; i < count; ++i) {
        int nElements = count - i;
        n2 = (arc4random() % nElements) + i;
        [arr2 exchangeObjectAtIndex:i withObjectAtIndex:n2];
    }
    arr2str=[arr2 objectAtIndex:0];
    
    int count1 = [arr1 count];
    for (int i = 0; i < count1; ++i)
    {
        int nElements = count1 - i;
        n1 = (arc4random() % nElements) + i;
        [arr1 exchangeObjectAtIndex:i withObjectAtIndex:n1];
        
    }
    arr1str=[arr1 objectAtIndex:0];
    
    //   NSArray *dirPaths;
    //   NSString *docsDir;
    NSString *aboutstr=@"Please tell us about";
    // _questionlbl.text=arr2str;
    _questionlbl2.text=arr1str;
    // _questionlbl2.textColor=[UIColor lightGrayColor];
    _questionlbl.text=[NSString stringWithFormat:@"%@\n%@",aboutstr,arr2str];
    
    NSMutableArray *pathComponents = [NSMutableArray arrayWithObjects:
                                      [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                                      @"MyAudioMemo.m4a",
                                      nil];
    NSURL *soundFileURL = [NSURL fileURLWithPathComponents:pathComponents];
    
    
    
    
    
    //    dirPaths = NSSearchPathForDirectoriesInDomains(
    //                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    //    docsDir = dirPaths[0];
    //
    //    NSString *soundFilePath = [docsDir
    //                               stringByAppendingPathComponent:@"sound.caf"];
    //
    //    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    //    NSDictionary *recordSettings = [NSDictionary
    //                                    dictionaryWithObjectsAndKeys:
    //                                    [NSNumber numberWithInt:AVAudioQualityMin],
    //                                    AVEncoderAudioQualityKey,
    //                                    [NSNumber numberWithInt:16],
    //                                    AVEncoderBitRateKey,
    //                                    [NSNumber numberWithInt: 2],
    //                                    AVNumberOfChannelsKey,
    //                                    [NSNumber numberWithFloat:44100.0],
    //                                    AVSampleRateKey,
    //                                    nil];
    //
    //    NSError *error = nil;
    //
    //    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    //    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord
    //                        error:nil];
    //
    //    _audioRecorder = [[AVAudioRecorder alloc]
    //                      initWithURL:soundFileURL
    //                      settings:recordSettings
    //                      error:&error];
    //
    //    if (error)
    //    {
    //        NSLog(@"error: %@", [error localizedDescription]);
    //    } else {
    //        [_audioRecorder prepareToRecord];
    //    }
    
    
    
    
    
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    // Define the recorder setting
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:16000.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 1] forKey:AVNumberOfChannelsKey];
    // [recordSetting setValue :[NSNumber numberWithInt:16] forKey:AVEncoderBitRateKey];
    [recordSetting setValue :[NSNumber numberWithInt:8] forKey:AVLinearPCMBitDepthKey];
    [recordSetting setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
    [recordSetting setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];
    [recordSetting setValue :[NSNumber numberWithInt:AVAudioQualityMin] forKey:AVEncoderAudioQualityKey];
    
    
    //    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    //    [recordSetting setValue:[NSNumber numberWithInt:AVAudioQualityMax] forKey:AVEncoderAudioQualityKey];
    //    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    //    [recordSetting setValue:[NSNumber numberWithInt: 1] forKey:AVNumberOfChannelsKey];
    
    // Initiate and prepare the recorder
    audioRecorder = [[AVAudioRecorder alloc] initWithURL:soundFileURL settings:recordSetting error:nil];
    audioRecorder.delegate = self;
    audioRecorder.meteringEnabled = YES;
    [audioRecorder prepareToRecord];
    
    
    
    
    
    
    //    >     NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //    >     NSString *dirPath = [paths objectAtIndex:0];
    //    >
    //    >     NSDateFormatter *format = [[NSDateFormatter alloc] init];
    //    >     [format setDateFormat:@"yyyy-MM-dd HH-mm"];
    //    >
    //    >     NSString *filename = [NSString stringWithFormat:@"%@.aac", [format stringFromDate:NSDate.date]];
}
-(void)methodToUpdateProgress1
{
    if (i==0)
    {
        // _questionlbl.text=@"Little interest or pleasure in doing things";
        
    }
    else if (i==1)
    {
        //_questionlbl.text=@"Feeling down, depressed,or hopeless";
        _textlbl.hidden=NO;
        [_nextbtnobj setUserInteractionEnabled:NO];
        
        // _recordButton.hidden=NO;
        // [_recordButton setUserInteractionEnabled:YES];
        
    }
    //    else if (i==2)
    //    {
    //        _questionlbl.text=@"Trouble falling asleep or staying asleep";
    //
    //    }
    //    else if (i==3)
    //    {
    //        _questionlbl.text=@"Feeling tired or having little energy";
    //
    //    }
    //    else if (i==4)
    //    {
    //        _questionlbl.text=@"Poor appetite or overeating";
    //
    //    }
    //    else if (i==5)
    //    {
    //        _questionlbl.text=@"Feeling bad about yourself — or that you are a failure or have let yourself or your family down";
    //
    //    }
    //    else if (i==6)
    //    {
    //        _questionlbl.text=@"Trouble concentrating on things,such as reading the newspaper or watching television";
    //
    //    }
    //    else if (i==7)
    //    {
    //        _questionlbl.text=@"Moving or speaking so slowly that other day people could have noticed? Or the opposite — being so fidgety or restless that you have been moving around a lot more than usual";
    //
    //    }
    //    else if (i==8)
    //    {
    //        _questionlbl.text=@"Thoughts that you would be better off dead or of hurting yourself in some way";
    //        _nextbtnobj.hidden=YES;
    //    }
    //
    
    // [_audioPlayer stop];
    _progressbarobj.hidden=YES;
    _progressLabel.hidden=YES;
    
}
- (void)methodToUpdateProgress
{
    if(someFloat ==0){
        
        someFloat = someFloat + 10;
        
        [_progressbarobj setProgress:someFloat animated:YES];
        
        
    }
    else
    {
        
        _progressbarobj.hidden=YES;
        [audioRecorder stop];
        
    }
    
}
-(void)calltimerAction
{
    someFloat=0;
    _nextbtnobj.hidden=NO;
    [player stop];
    [_nextbtnobj setUserInteractionEnabled:YES];
    
    [_recordButton setBackgroundImage:[UIImage imageNamed:@"recordstart.png"] forState:UIControlStateNormal];
    _progressbarobj.hidden=YES;
    _progressLabel.hidden=YES;
    _recordButton.hidden=NO;
    _stopButton.hidden=YES;
    [_recordButton setUserInteractionEnabled:NO];
    
    
}
- (IBAction)recordAudio:(id)sender {
    //  _nextbtnobj.hidden=YES;
    someFloat=0;
    _recordButton.hidden=YES;
    
    [_stopButton setBackgroundImage:[UIImage imageNamed:@"stoprecord.png"] forState:UIControlStateNormal];
    [_nextbtnobj setUserInteractionEnabled:YES];
    _progressbarobj.hidden=NO;
    _progressLabel.hidden=NO;
    
    // [self methodToUpdateProgress];
    count =0;
    
    [audioRecorder record];
    _textlbl.hidden=YES;
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
    
    self.myTimer1 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateUI:) userInfo:nil repeats:YES];
    
    
    myTimer = [NSTimer scheduledTimerWithTimeInterval:60.0 repeats:NO block:^(NSTimer * _Nonnull timer)
               {
                   [self calltimerAction];
               }];
}


- (void)updateUI:(NSTimer *)timer
{
    count++;
    
    if (count <=60)
    {
        self.progressLabel.text = [NSString stringWithFormat:@"%d Sec",count*1];
        _progressbarobj.progress = (float)count/60.0f;
    } else
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
    
    _progressbarobj.hidden=YES;
    
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
            _progressbarobj.hidden=YES;
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



-(void)audioPlayerDidFinishPlaying:
(AVAudioPlayer *)player successfully:(BOOL)flag
{
    _recordButton.hidden = YES;
    // [_recordButton setUserInteractionEnabled:YES];
    _stopButton.hidden = NO;
    // [_stopButton setBackgroundImage:[UIImage imageNamed:@"play1.png"] forState:UIControlStateNormal];
    
}

-(void)audioPlayerDecodeErrorDidOccur:
(AVAudioPlayer *)player
                                error:(NSError *)error
{
    NSLog(@"Decode Error occurred");
}

-(void)audioRecorderDidFinishRecording:
(AVAudioRecorder *)recorder
                          successfully:(BOOL)flag
{
}

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
        // NSData *data = [[NSData alloc] initWithContentsOfFile:audioRecorder.url.path];
        // NSString *urr = [NSString stringWithUTF8String:[data bytes]];
        
        //[recordeddata addObject:imageNameStr];
        
        [self callvoicetest];
        i=i+1;
        [_recordButton setBackgroundImage:[UIImage imageNamed:@"microphone.png"] forState:UIControlStateNormal];
        [ self methodToUpdateProgress1];
        
        _recordButton.hidden=NO;
        [_recordButton setUserInteractionEnabled:YES];
        
        _stopButton.hidden=YES;
        
    }
    
}
//    NSTimer *timer3 = [NSTimer scheduledTimerWithTimeInterval:60.0 repeats:NO block:^(NSTimer * _Nonnull timer)
//                       {
//
//                       }];}

//


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSString *) dateString
//{
//    // return a formatted string for a file name
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"ddMMMYY_hhmmssa";
//    return [[formatter stringFromDate:[NSDate date]] stringByAppendingString:@".aif"];
//}
//
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
    // [paramDict setValue:base64_encoded_image1 forKey:@"fileB"];
    
    [paramDict setValue:@"C" forKey:@"section"];
    [paramDict setValue:_questionlbl.text forKey:@"title"];
    // [paramDict setValue:@"B" forKey:@"titleB"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"VoiceTest" :dict :paramDict];
}


-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"AudioTest"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            
            FeedViewController *LVC3=[[FeedViewController alloc]init];
            
            [self.navigationController pushViewController:LVC3 animated:YES];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"server issue" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }
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




- (IBAction)BackBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

