

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FeedTagViewController:UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource>
{
     NSMutableArray *privatedata;
     NSMutableArray *publicdata;
    NSMutableArray *arrdata;
    NSString *base64_encoded_image;
       NSString *imageNameStr;
      
}
@property (strong, nonatomic) IBOutlet UIButton *backBtnobj,*can1;
@property (strong, nonatomic) IBOutlet UIView *viewinner;
@property (strong, nonatomic) IBOutlet UIView *viewouter;
@property (strong, nonatomic) IBOutlet UIButton *btn_addto,*btn_inner,*btn_outer;
@property (strong, nonatomic) IBOutlet UIView *view_add_new_conaact;
@property (strong, nonatomic) IBOutlet NSString *requestid;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicatorview;
@property (strong, nonatomic) IBOutlet UITableView *tbl_pub_private;
@property (strong, nonatomic) IBOutlet UIView *tb_footer,*viewsourcetype,*viewsourcetypein;
@property (strong, nonatomic) IBOutlet UIView *view_camera,*view_gallery;
@property (strong, nonatomic) IBOutlet UIButton *btn_home,*cancel_new_post1,*cancel_new_post2,*btn_chat,*btn_you,*btn_faq,*tbl_private,*tbl_pub;
@property (strong, nonatomic) IBOutlet UIView *view_footer1;
@property (strong, nonatomic) IBOutlet UICollectionView *collectview;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *view_share2;
@property (strong, nonatomic) IBOutlet UIView *view11;
@property (strong, nonatomic) IBOutlet UIView *view22;
 @property(nonatomic,retain)NSMutableArray *privatedata,*publicdata,*arr_data;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *view_shar1;
@property (strong, nonatomic) IBOutlet NSString *usernamestr;
@property (strong, nonatomic) IBOutlet UIView *view_footer2;
@property (strong, nonatomic) IBOutlet UIView *indicatorviewobj;
@end

NS_ASSUME_NONNULL_END
