
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FriendRequestViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnObj;
@property (strong, nonatomic) IBOutlet UIImageView *imgnodata;
@property (strong, nonatomic) IBOutlet UIButton *backBtnobj;
@property (strong, nonatomic) IBOutlet UIView *view_footer1;
@property (strong, nonatomic) IBOutlet UIView *tb_footer;
@property (strong, nonatomic) IBOutlet UIView *view_footer2;
@property (strong, nonatomic) IBOutlet NSString *str1;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionview;
@property (strong, nonatomic) IBOutlet NSString *str2,*str_Sel_sendby,*str_sel_frnd_request_post_status;

@end

NS_ASSUME_NONNULL_END
