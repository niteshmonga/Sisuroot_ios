//
//  ProfileViewController.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 12/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
{
    NSString *base64_encoded_image;
    NSString *idstr1;
    NSString *tagstr2;


    NSString *imageNameStr;
    IBOutlet UIActivityIndicatorView *activityIden;
    IBOutlet UILabel *chatnotification;

//IBOutlet UITableView *DashTableviewobj;
}
@property (strong, nonatomic) IBOutlet UIImageView *backgroundimg;
@property (strong, nonatomic) IBOutlet UIButton *revealBtnobj;
- (IBAction)searchBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *searchbtnobj;
@property (strong, nonatomic) IBOutlet UILabel *profilestmt;
- (IBAction)CameraBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *cameraBtnobj;
- (IBAction)SettingBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *SettingBtnobj;
@property (strong, nonatomic) IBOutlet UIImageView *coverimg;
@property (strong, nonatomic) IBOutlet UIButton *profileBtnobj;
@property (strong, nonatomic) IBOutlet UILabel *profilelblobj;
@property (strong, nonatomic) IBOutlet UILabel *Emotionbacklbl;

@property (strong, nonatomic) IBOutlet UILabel *Feelingstmtlblobj;
- (IBAction)FITBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *FitBtnobj;
- (IBAction)TagpostBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *TagpostBtnobj;
- (IBAction)galleryBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *GalleryBtnobj;
- (IBAction)FriendsBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *FriendsBtnobj;
- (IBAction)ProfileBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *ProfileButtonActionobj;
- (IBAction)NextBtn:(id)sender;
- (IBAction)ChangeCoverBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *ChangecoverBtnobj;
- (IBAction)ProfilepicBtn:(id)sender;

@property (strong, nonatomic) IBOutlet UICollectionView *EmotionCollectionViewobj;
@property (strong, nonatomic) IBOutlet NSDictionary *Detail;
@property (strong, nonatomic) IBOutlet UIImageView *Profilepicimg;
@property (strong, nonatomic) IBOutlet UITableView *DashTableviewobj;
@property (strong, nonatomic) IBOutlet UISearchBar *Searchbarobj;
@property (strong, nonatomic) IBOutlet NSDictionary *detail;
- (IBAction)FriendresponseBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *FrndResnotificationlblobj;
@property (strong, nonatomic) IBOutlet NSString *str1;
@property (strong, nonatomic) IBOutlet UIImageView *tagimg;
- (IBAction)ExtraBtn:(id)sender;
- (IBAction)ChatBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet NSString *tagstr1;
@property (strong, nonatomic) IBOutlet NSString *friendstr1;
@property (strong, nonatomic) IBOutlet UIImageView *profileiconimg;
- (IBAction)profileiconBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *ChatBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *profileBtnobj1;
@property (strong, nonatomic) IBOutlet UILabel *lastpostdatelbl;

@end
