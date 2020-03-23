

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@import Firebase;
@class SwiftClass;
@interface FeedViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    IBOutlet UIView *barView;
    NSString *base64_encoded_image;
    NSString *imageNameStr;
    IBOutlet UIActivityIndicatorView *activityIden;
    UITapGestureRecognizer *tapper;
    IBOutlet UILabel *chatnotification;
}
@property (strong, nonatomic) IBOutlet UIView *view_footer1;
@property (strong, nonatomic) IBOutlet UIView *tb_footer;
@property (strong, nonatomic) IBOutlet UIButton *btn_home,*btn_chat,*btn_you,*btn_faq;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) IBOutlet UILabel *timeLbl;
@property (strong, nonatomic) IBOutlet UICollectionView *collect_pub,*collect_inner,*collect_outer,*collect_both;
@property (strong, nonatomic) IBOutlet UIView *view_footer2;
@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;
- (IBAction)BackBtn:(id)sender;
- (IBAction)SearchbtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *swipeup,*lbl_show_username;
@property (strong, nonatomic) IBOutlet UILabel *Feedstmtlbl;
- (IBAction)SettingBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UICollectionView *CollectionViewobj;
@property (strong, nonatomic) IBOutlet UILabel *iconbacklblobj;
@property (strong, nonatomic) IBOutlet UIView *SearchView,*topview;
@property (strong, nonatomic) IBOutlet NSString *str1,*Dafault_demographic_form_status;
@property (strong, nonatomic) IBOutlet UIView *Nointernetviewobj;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *backBtnobj;
@property (strong, nonatomic) IBOutlet NSString *str2,*requestid;
@property (strong, nonatomic) IBOutlet NSString *usernamestr;
- (IBAction)FriendresponseBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *FrndResnotificationlblobj;
@property (strong, nonatomic) IBOutlet UIImageView *profileiconimg;
- (IBAction)profileiconBtnAction:(id)sender;
- (IBAction)BSBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *profileBtnobj1;
@property (strong, nonatomic) IBOutlet NSString *countlblstr;
- (IBAction)SosBtnAction:(id)sender;
- (IBAction)NointernetBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Sosbtnobj;
@property (strong, nonatomic) IBOutlet UIButton *Chatbtnobj;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicatorview;
@property (strong, nonatomic) IBOutlet UIView *indicatorviewobj;
@property (strong, nonatomic) IBOutlet UILabel *indicatorlbl;
@end
