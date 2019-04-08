//
//  ChatfriendViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 30/03/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>



 @interface ChatfriendViewController : UIViewController
{
    IBOutlet UIView *barView;
    NSString *base64_encoded_image;
    NSString *imageNameStr;
    NSString *base64_encoded_image1;
    NSString *imageNameStr1;
    
    IBOutlet UIActivityIndicatorView *activityIden;
    UITapGestureRecognizer *tapper;
    
    IBOutlet UITableView *chattableview;
}

@property (weak, nonatomic) IBOutlet UIView *view_Alert;
@property (weak, nonatomic) IBOutlet UIButton *chck_alert;

@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;
- (IBAction)BackBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *backbtnobj1;
@property (weak, nonatomic) IBOutlet UIButton *btn_okalert;

- (IBAction)SearchbtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *Feedstmtlbl;
- (IBAction)SettingBtnAction:(id)sender;
//@property (strong, nonatomic) IBOutlet UISearchBar *Searchbarobj;
@property (strong, nonatomic) IBOutlet UICollectionView *CollectionViewobj;
@property (strong, nonatomic) IBOutlet UILabel *iconbacklblobj;
- (IBAction)FeedBtnAction:(id)sender;
- (IBAction)FriendsBtnAction:(id)sender;
- (IBAction)GalleryBtnAction:(id)sender;
- (IBAction)TagBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *therapisttableview;

@property (strong, nonatomic) IBOutlet UITableView *FeedlistTableViewobj;
@property (strong, nonatomic) IBOutlet UITableView *FeedlistTableViewobj1;

@property (strong, nonatomic) IBOutlet UIView *SearchView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBarItem;
@property (strong, nonatomic) IBOutlet UISearchBar *searchbarobj;
@property (strong, nonatomic) IBOutlet NSString *str1;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *backBtnobj;
@property (strong, nonatomic) IBOutlet NSString *str2;
- (IBAction)addgroupBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *addgroupbtnobj;

- (IBAction)BackgroupBtn:(id)sender;

- (IBAction)callthisAction:(id)sender;

@property (strong, nonatomic) IBOutlet NSString *usernamestr;
@property (strong, nonatomic) IBOutlet UIView *groupviewobj;
- (IBAction)NextGBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *NextGBtnActionobj;

@property (strong, nonatomic) IBOutlet UIView *CreatenameViewobj;
- (IBAction)backGroupnameBtn:(id)sender;
- (IBAction)CreateGroupBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *CreateGroupBtnobj;

- (IBAction)SelectGroupimgBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *SelectGroupImgBtnobj;
@property (strong, nonatomic) IBOutlet UIImageView *profileimg;

@property (strong, nonatomic) IBOutlet UITextField *GroupNameTF;
@property (strong, nonatomic) IBOutlet NSString *sisustr;
- (IBAction)SisuchatBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *SisuchatBtnobj;

- (IBAction)TherapistbackbtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *sisuchatview;
@property (strong, nonatomic) IBOutlet UILabel *therapistcountlbl;
@property (strong, nonatomic) IBOutlet UIView *mhpinfoview;
@property (strong, nonatomic) IBOutlet UILabel *mhpnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *mhpdetaillbl;
@property (strong, nonatomic) IBOutlet UILabel *mhplocationlbl;

@property (strong, nonatomic) IBOutlet UIImageView *mhpprofileimg;
- (IBAction)closeBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet NSString *therapistviewstr;

@property (strong, nonatomic) IBOutlet UILabel *grouptypelbl;
@property (strong, nonatomic) IBOutlet UILabel *licencetypelbl;

@end







