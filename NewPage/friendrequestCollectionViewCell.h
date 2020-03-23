

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface friendrequestCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *lbl_username;
@property (strong, nonatomic) IBOutlet UIImageView *image_user;
@property (strong, nonatomic) IBOutlet UIView *view_btn;
@property (strong, nonatomic) IBOutlet UIButton *btn_accept;
@property (strong, nonatomic) IBOutlet UIButton *btn_reject;

@end

NS_ASSUME_NONNULL_END
