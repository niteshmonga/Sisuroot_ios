#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface rateonappTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *USERNAME;
@property (strong, nonatomic) IBOutlet UILabel *TIME;
@property (strong, nonatomic) IBOutlet UIButton *BTN1;
@property (strong, nonatomic) IBOutlet UIButton *BTN2;
@property (strong, nonatomic) IBOutlet UIButton *BTN3;
@property (strong, nonatomic) IBOutlet UIButton *BTN4;
@property (strong, nonatomic) IBOutlet UIButton *BTN5,*btnmore;
@property (strong, nonatomic) IBOutlet UILabel *COMMENTS;
@property (strong, nonatomic) IBOutlet UIView *viewshow;

@end

NS_ASSUME_NONNULL_END
