//
//  OtherFriendViewController.h
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 26/09/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherFriendViewController : UIViewController
{
    NSString *base64_encoded_image;
    NSString *imageNameStr;
    IBOutlet UIActivityIndicatorView *activityIden;
    //IBOutlet UITableView *DashTableviewobj;
    IBOutlet UIView *barView;
    IBOutlet UILabel *chatnotification;

}
@property (strong, nonatomic) IBOutlet UIImageView *backgroundimg;
- (IBAction)ChatBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *profilestmt;
@property (strong, nonatomic) IBOutlet UIImageView *coverimg;
@property (strong, nonatomic) IBOutlet UILabel *profilelblobj;
@property (strong, nonatomic) IBOutlet UIImageView *Profilepicimg;
@property (strong, nonatomic) IBOutlet UITableView *DashTableviewobj;
@property (strong, nonatomic) IBOutlet NSDictionary *detail;
@property (strong, nonatomic) IBOutlet UILabel *FrndResnotificationlblobj;
@property (strong, nonatomic) IBOutlet NSString *str1;
- (IBAction)BackBtn:(id)sender;
- (IBAction)SettingBtnAction:(id)sender;
- (IBAction)FriendRequestNotificationBtnAction:(id)sender;
- (IBAction)SosBtnAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *profileiconimg;
- (IBAction)profileiconBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *profileBtnobj1;
- (IBAction)HomeBtnAction:(id)sender;
- (IBAction)FriendsBtnAction:(id)sender;
- (IBAction)GalleryBtnAction:(id)sender;
- (IBAction)TagBtnAction:(id)sender;
- (IBAction)chatbtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Sosbtnobj;
@property (strong, nonatomic) IBOutlet UIButton *Chatbtnobj;

@end
