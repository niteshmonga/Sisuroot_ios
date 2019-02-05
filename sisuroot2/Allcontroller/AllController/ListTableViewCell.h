//
//  ListTableViewCell.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 24/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *bgimg;
@property (strong, nonatomic) IBOutlet UIImageView *listprofileimg;
@property (strong, nonatomic) IBOutlet UIImageView *profileimg;

@property (strong, nonatomic) IBOutlet UILabel *usernamelblobj;
@property (strong, nonatomic) IBOutlet UILabel *Liststmtlblobj;
@property (strong, nonatomic) IBOutlet UIButton *favourateBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *commentBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *inviteBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *Overbuttonobj;
@property (strong, nonatomic) IBOutlet UILabel *line1;
@property (strong, nonatomic) IBOutlet UILabel *line2;
@property (strong, nonatomic) IBOutlet UILabel *line3;
@property (strong, nonatomic) IBOutlet UILabel *line4;
@property (strong, nonatomic) IBOutlet UILabel *Taggedlbl;
@property (strong, nonatomic) IBOutlet UILabel *backlbl;
@property (strong, nonatomic) IBOutlet UIButton *chatBtnobj;
@property (strong, nonatomic) IBOutlet UILabel *EmotionBtnlblobj;
@property (strong, nonatomic) IBOutlet UILabel *OtherEmoBtnlblobj;
@property (strong, nonatomic) IBOutlet UIImageView *taggedimg;
@property (strong, nonatomic) IBOutlet UIImageView *shareimg;
@property (strong, nonatomic) IBOutlet UIImageView *share1img;

- (IBAction)OtherEmoBtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *OtherEmoBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *EmotionBtnobj;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityobj;


@end
