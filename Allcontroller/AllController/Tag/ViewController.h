//
//  ViewController.h
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 12/05/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import "WARVChatPanelView.h"


@interface ViewController : UIViewController <AVAudioRecorderDelegate, AVAudioPlayerDelegate, UIGestureRecognizerDelegate, WARVChatPanelViewDelegate>
{
   
    NSMutableArray *titleArray;
    NSArray *subtitleArray;
      NSArray *textArray;
 //    IBOutlet UITableView *pictableObj;
//    IBOutlet UITableView *pictableObj1;
    IBOutlet UITableView *pictableObj2;
    NSString *base64_encoded_image;
    NSString *imageNameStr;
    IBOutlet UIActivityIndicatorView *ActivityIdenter;
    IBOutlet UITableView *pickerviewobj11;
    IBOutlet UITableView *pickerviewobj12;
       UILongPressGestureRecognizer *gesture1;
//    ImageCropView* imageCropView;
//    UIImage* image;
//    IBOutlet UIImageView *imageView;

}
- (void)longPressed:(UIGestureRecognizer *)longPress;
- (IBAction)playTapped:(id)sender;
- (IBAction)deleteTapped:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *deletebtnobj;

@property (strong, nonatomic) IBOutlet UIView *voicerecordviewobj;
@property (strong, nonatomic) IBOutlet UITextField *CommentTF;
//@property (strong, nonatomic) IBOutlet UITextField *StateTF;
@property (strong, nonatomic) IBOutlet UILabel *selecttaglbl;
- (IBAction)CityBtn:(id)sender;
- (IBAction)StateBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;
@property (strong, nonatomic) IBOutlet UIImageView *Rootlogoimg;

@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg1;
@property (strong, nonatomic) IBOutlet UIImage *Backimg;

@property (strong, nonatomic) IBOutlet UILabel *Bglblobj;
@property (strong, nonatomic) IBOutlet UILabel *Emotionstmtlbl;
- (IBAction)CircleBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UISwitch *Switchobj;
@property (strong, nonatomic) IBOutlet UILabel *Switchstmtlbl;
@property (strong, nonatomic) IBOutlet UILabel *Tagstmtlbl;
- (IBAction)BackBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Hardtagbtnobj;
@property (strong, nonatomic) IBOutlet UIButton *SoftTagbtnobj;
@property (strong, nonatomic) IBOutlet UIView *FriendCircleView;
@property (strong, nonatomic) IBOutlet UILabel *Circlestmtlbl;
- (IBAction)HardTagBtn:(id)sender;
- (IBAction)SoftTagBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *CircleBtnobj;
- (IBAction)SwitchAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *Emotionlblobj;
@property (strong, nonatomic) IBOutlet UITextView *Textview;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerviewobj;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerviewobj1;

- (IBAction)HomeBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
- (IBAction)DoneBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *DoneBtnobj;
@property (strong, nonatomic) IBOutlet NSString *imageNameStr1;
@property (strong, nonatomic) IBOutlet NSString *base64_encoded_image1;
@property (strong, nonatomic) IBOutlet UILabel *indcatorlbl;
- (IBAction)GalleryBtn:(id)sender;
- (IBAction)CameraBtn:(id)sender;
@property (nonatomic, strong) IBOutlet NSString* str1;
@property (strong, nonatomic) IBOutlet UIButton *BackBtnobj;
@property (nonatomic, strong) IBOutlet NSString* detailstr;
@property (strong, nonatomic) IBOutlet UIButton *HomeBtnobj;
- (IBAction)Extrabtn:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *hardTaglbl;
@property (strong, nonatomic) IBOutlet UILabel *SoftTaglbl;
@property (strong, nonatomic) IBOutlet UITextField *TagEmotionTF;
@property (strong, nonatomic) IBOutlet NSString *tagmestr;
@property (strong, nonatomic) IBOutlet NSString *str11;
@property (strong, nonatomic) IBOutlet NSString *idstr;
@property (strong, nonatomic) IBOutlet NSString *tagidstr;

- (IBAction)TagpostBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *TagPostBtnobj;

@property (strong, nonatomic) IBOutlet UILabel *datelbl;
@property (strong, nonatomic) IBOutlet UILabel *emonamelbl;
 @property (strong, nonatomic) IBOutlet NSArray *datestrarr;
@property (strong, nonatomic) IBOutlet UILabel *emobacklbl;
@property (strong, nonatomic) IBOutlet UILabel *itaggedlbl;
@property (strong, nonatomic) IBOutlet UIView *emocommentbackview;
@property (strong, nonatomic) IBOutlet UITableView *pickerviewobj11;
@property (strong, nonatomic) IBOutlet UITableView *pickerviewobj12;
- (IBAction)ImgBtnAction:(id)sender;
- (IBAction)voiceBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *voiceBtnobj;

@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) IBOutlet UIButton *recordButton;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;
- (IBAction)recordAudio:(id)sender;
- (IBAction)playAudio:(id)sender;
- (IBAction)stopAudio:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *recordButton1;
@property (strong, nonatomic) IBOutlet UIButton *playButton1;
@property (strong, nonatomic) IBOutlet UIButton *stopButton1;
@property (nonatomic, strong) NSTimer *myTimer1;
@property (nonatomic, strong) NSTimer *myTimer2;
@property (strong, nonatomic) IBOutlet UILabel *progressLabel;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewObj;
@property (strong, nonatomic) IBOutlet UIButton *imgbuttonobj;
- (IBAction)VoiceBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *voiceplayBtnobj;
@end




