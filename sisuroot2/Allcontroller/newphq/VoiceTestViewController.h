//
//  VoiceTestViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 22/09/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface VoiceTestViewController : UIViewController
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

- (IBAction)HomeBtnAction:(id)sender;
- (IBAction)NextBtnAction:(id)sender;

- (IBAction)BackBtnAction:(id)sender;


@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) NSTimer *myTimer1;
@property (nonatomic, strong) IBOutlet UILabel *progressLabel;
@property (nonatomic, strong) IBOutlet UILabel *textlbl;

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
