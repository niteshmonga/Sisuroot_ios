
#import <UIKit/UIKit.h>

@interface ResourcesViewController : UIViewController
{
    IBOutlet UITableView *tableView;
    IBOutlet UIActivityIndicatorView *activityIden;
    UITapGestureRecognizer *tapper;
    IBOutlet UIView *barView;
    NSString *base64_encoded_image;
    NSString *imageNameStr;
    IBOutlet UILabel *chatnotification;
}

@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;

@property (strong, nonatomic) IBOutlet UIView *view_footer2;
- (IBAction)BackBtnAction:(id)sender;
- (IBAction)SearchBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *Requeststmtlbl;
@property (strong, nonatomic) IBOutlet UIView *view_footer1;
@property (strong, nonatomic) IBOutlet UIView *tb_footer;
@property (strong, nonatomic) IBOutlet UIButton *btn_home,*btn_chat,*btn_you,*btn_faq;
- (IBAction)SettingBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UISearchBar *SearchBarobj;
@property (strong, nonatomic) IBOutlet UILabel *FriendRequestlbl;
@property (strong, nonatomic) IBOutlet UIWebView *resourcesview;
@property (strong, nonatomic) IBOutlet UIButton *backBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnObj;
@property (strong, nonatomic) IBOutlet UIView *Circlegrpview;
@property (strong, nonatomic) IBOutlet UIButton *InnerCircleBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *OuterCircleBtnobj;
- (IBAction)InnerCircleBtn:(id)sender;
- (IBAction)OuterCircleBtn:(id)sender;
@property (strong, nonatomic) IBOutlet NSString *str2;
@property (strong, nonatomic) IBOutlet UIImageView *profileiconimg;
- (IBAction)profileiconBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *profileBtnobj1;

- (IBAction)HomeBtnAction:(id)sender;
- (IBAction)FriendsBtnAction:(id)sender;
- (IBAction)GalleryBtnAction:(id)sender;
- (IBAction)TagBtnAction:(id)sender;
- (IBAction)chatbtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Sosbtnobj;
@property (strong, nonatomic) IBOutlet NSArray *countstr;
- (IBAction)SosBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Chatbtnobj;

- (IBAction)Homebtn1Action:(id)sender;



@end
