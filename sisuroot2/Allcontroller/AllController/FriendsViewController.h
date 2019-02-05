//
//  FriendsViewController.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 25/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsViewController : UIViewController
{
    IBOutlet UIActivityIndicatorView *activityIden;
    UITapGestureRecognizer *tapper;
    IBOutlet UIView *barView;
    NSString *base64_encoded_image;
    NSString *imageNameStr;
    
    NSString *nameString;
    NSString *contactString;
    IBOutlet UITableView *FriendsTableviewobj;
    IBOutlet UILabel *chatnotification;
    UITextView *privateTextView;
    
}
@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;
- (IBAction)BackBtnAction:(id)sender;
- (IBAction)SearchBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *Friendsstmtlbl;
- (IBAction)SettingBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *Selectfriendlbl;
//@property (strong, nonatomic) IBOutlet UITableView *FriendsTableviewobj;
@property (strong, nonatomic) IBOutlet UIButton *backBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnObj;
@property (strong, nonatomic) IBOutlet NSString *str1;
@property (strong, nonatomic) IBOutlet NSString *friendstr;
@property (strong, nonatomic) IBOutlet UILabel *indcatorlbl;
@property (strong, nonatomic) IBOutlet UILabel *Acceptinlbl;
- (IBAction)InnerBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *InnerBtnobj;
- (IBAction)OuterBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *OuterBtnobj;
@property (strong, nonatomic) IBOutlet UIView *RequestSentViewobj;
@property (strong, nonatomic) IBOutlet NSString *name;
@property (strong, nonatomic) IBOutlet NSString *strcount;
- (IBAction)blockbtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *blockBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *TagBtnActionobj;
- (IBAction)ProfileBtnAction:(id)sender;
- (IBAction)FeedBtnAction:(id)sender;
- (IBAction)FriendsBtnAction:(id)sender;
- (IBAction)GalleryBtnAction:(id)sender;
- (IBAction)TagBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *profileiconimg;
- (IBAction)profileiconBtnAction:(id)sender;
- (IBAction)SosBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Chatbtnobj;
@property (strong, nonatomic) IBOutlet UIButton *Sosbtnobj;
@property (strong, nonatomic) IBOutlet UIButton *profileBtnobj1;
@property (strong, nonatomic) IBOutlet UIButton *Addnewcontactobj;
- (IBAction)Addcontact:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *Addcontactview;
@property (weak, nonatomic) IBOutlet UIImageView *contactuserimg;
- (IBAction)CancelBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *Cancelbtnobj;
@property (weak, nonatomic) IBOutlet UITextField *FirstnameTF;
@property (weak, nonatomic) IBOutlet UITextField *LastnameTF;
@property (weak, nonatomic) IBOutlet UITextField *PhoneTF;
- (IBAction)DoneBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *DoneBtnobj;
@property (weak, nonatomic) IBOutlet UIView *footerviewobj;
- (IBAction)SkipBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet NSString *invitestr;

@end

