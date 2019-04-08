

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@import Firebase;
@interface FeedViewController : UIViewController
{
    IBOutlet UIView *barView;
    NSString *base64_encoded_image;
    NSString *imageNameStr;
    IBOutlet UIActivityIndicatorView *activityIden;
    UITapGestureRecognizer *tapper;

    IBOutlet UILabel *chatnotification;
}
@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;
- (IBAction)BackBtn:(id)sender;
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
- (IBAction)ChatBtnAction:(id)sender ;
@property (strong, nonatomic) IBOutlet UITableView *FeedlistTableViewobj;
@property (strong, nonatomic) IBOutlet UIView *SearchView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBarItem;
@property (strong, nonatomic) IBOutlet UISearchBar *searchbarobj;
@property (strong, nonatomic) IBOutlet NSString *str1,*Dafault_demographic_form_status;
@property (strong, nonatomic) IBOutlet UIView *Nointernetviewobj;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *backBtnobj;
@property (strong, nonatomic) IBOutlet NSString *str2;
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
