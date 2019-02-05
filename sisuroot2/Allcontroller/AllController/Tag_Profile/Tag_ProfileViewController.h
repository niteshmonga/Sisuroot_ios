//
//  Tag_ProfileViewController.h
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 22/09/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tag_ProfileViewController : UIViewController
{
    IBOutlet UIActivityIndicatorView *activityIden;

}
@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;
- (IBAction)BackBtn:(id)sender;
- (IBAction)PostBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *BackBtnlinelbl;
@property (strong, nonatomic) IBOutlet UIImageView *Profileimg;
@property (strong, nonatomic) IBOutlet UILabel *Usernamelbl;
@property (strong, nonatomic) IBOutlet UILabel *Emotionlbl;
@property (strong, nonatomic) IBOutlet UILabel *Commentlinelbl;
@property (strong, nonatomic) IBOutlet UILabel *Commentlbl;
@property (strong, nonatomic) IBOutlet UIImageView *Tagimg;
@property (strong, nonatomic) IBOutlet UILabel *Tagbacklinelbl;
@property (strong, nonatomic) IBOutlet UILabel *Likelbl;
- (IBAction)LikeBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *LikeBtnobj;
- (IBAction)CommentBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *Cmmentcountlbl;
- (IBAction)ShareBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *Likecountlbl;
@property (strong, nonatomic) IBOutlet UILabel *Sharelbl;
@property (strong, nonatomic) IBOutlet UITextField *CommentTF;
@property (strong, nonatomic) IBOutlet UILabel *Commentstmtlbl;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewObj;
@property (strong, nonatomic) IBOutlet NSString *str11;
@property (strong, nonatomic) IBOutlet NSString *str12;
- (IBAction)InnerBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *InnerBtnobj;
- (IBAction)OuterBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *OuterBtnobj;
@property (strong, nonatomic) IBOutlet UIView *ShareViewobj;
@property (strong, nonatomic) IBOutlet UIButton *ShareBtnobj;
@property (strong, nonatomic) IBOutlet UILabel *Shareinlbl;
@property (strong, nonatomic) IBOutlet NSString *str3;
@property (strong, nonatomic) IBOutlet UILabel *line2;
@property (strong, nonatomic) IBOutlet UILabel *line3;
- (IBAction)CircleBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *line4;
@property (strong, nonatomic) IBOutlet UIButton *CircleBtnobj;
@property (strong, nonatomic) IBOutlet NSString *sharestr;
@property (strong, nonatomic) IBOutlet UICollectionView *EmotionCollectionViewobj;
@property (strong, nonatomic) IBOutlet UILabel *latestemotionnamelbl;
@property (strong, nonatomic) IBOutlet NSString *strdetail;

- (IBAction)SosBtnAction:(id)sender;
- (IBAction)innerCircleBtnAction:(id)sender;
- (IBAction)outerCircleBtnAction:(id)sender;
- (IBAction)VoiceBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *voiceBtnobj;
@property (strong, nonatomic) IBOutlet NSString *voicestr111;


@end
