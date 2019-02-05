//
//  sectionAvoicetestViewController.h
//  Root
//
//  Created by Epikso on 18/10/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface sectionAvoicetestViewController : UIViewController

  <AVAudioRecorderDelegate, AVAudioPlayerDelegate>

@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) IBOutlet UIButton *recordButton;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;
- (IBAction)recordAudio:(id)sender;
- (IBAction)playAudio:(id)sender;
- (IBAction)stopAudio:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *MenuBtnobj;
@property (strong, nonatomic) IBOutlet UIProgressView *progressbarobj;
@property (strong, nonatomic) IBOutlet UILabel *questionlbl;
@property (strong, nonatomic) IBOutlet UIButton *nextbtnobj;
@property (strong, nonatomic) IBOutlet UILabel *questionlbl1;
@property (strong, nonatomic) IBOutlet UILabel *questionlbl2;

- (IBAction)HomeBtnAction:(id)sender;
- (IBAction)NextBtnAction:(id)sender;

- (IBAction)NextBtnAction1:(id)sender;
- (IBAction)recordAudio1:(id)sender;
- (IBAction)playAudio1:(id)sender;
- (IBAction)stopAudio1:(id)sender;

- (IBAction)BackBtnAction:(id)sender;
 @property (strong, nonatomic) IBOutlet UIButton *recordButton1;
@property (strong, nonatomic) IBOutlet UIButton *playButton1;
@property (strong, nonatomic) IBOutlet UIButton *stopButton1;
@property (strong, nonatomic) IBOutlet UIButton *nextbtn1obj;

@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) NSTimer *myTimer1;
@property (nonatomic, strong) NSTimer *myTimer2;

@property (nonatomic, strong) IBOutlet UILabel *progressLabel;
@property (nonatomic, strong) IBOutlet UILabel *textlbl;
@property (nonatomic, strong) IBOutlet NSString *voicestr1;

@end



//#import "ViewController.h"
//
//@interface VoiceTestViewController : ViewController
//@property (strong, nonatomic) IBOutlet UIButton *MenuBtnobj;
//- (IBAction)VoicetestStartBtnAction:(id)sender;
//- (IBAction)VoiceTestStopBtnAction:(id)sender;
//@property (strong, nonatomic) IBOutlet UIButton *playButton;
//@property (strong, nonatomic) IBOutlet UIButton *stopButton;
//
//@end
