#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface RateonappViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrdata;
}
@property (strong, nonatomic) IBOutlet UILabel *lblmoredata;

@property (strong, nonatomic) IBOutlet UIButton *btnback;
@property (strong, nonatomic) IBOutlet UITableView *tbldata;
@property (strong, nonatomic) IBOutlet UIView *viewfooter1;
@property (strong, nonatomic) IBOutlet UIView *tbfooter;
@property (strong, nonatomic) IBOutlet UIView *viewfoter2;
@property (strong, nonatomic) IBOutlet UIView *view_more,*viewmoredata,*view1;
@property (strong, nonatomic) IBOutlet UIButton *btnmenuobj,*btn_cancel_more;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@end

NS_ASSUME_NONNULL_END
