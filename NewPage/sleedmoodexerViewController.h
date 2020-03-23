
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface sleedmoodexerViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITapGestureRecognizer *tapper;
    NSString *base64_encoded_image;
    NSString *imageNameStr;
    CAGradientLayer *gradient;
}

@property (strong, nonatomic) IBOutlet UITableView *tbl_view;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (strong, nonatomic) IBOutlet UIView *view_footer1;
@property (strong, nonatomic) IBOutlet UIView *tb_footer;

@property (strong, nonatomic) IBOutlet UIView *view_footer2;
@property (strong, nonatomic) IBOutlet UIButton *btn_5,*btn_none,*btn_30min,*btn_1hr,*btn_1hr_greater,*selectmood;
@property (strong, nonatomic) IBOutlet UIButton *btn_6;
@property (strong, nonatomic) IBOutlet UILabel *btn_feel;
@property (strong, nonatomic) IBOutlet UIButton *btn_7;

@property (strong, nonatomic) IBOutlet UIButton *btn_8;
@property (strong, nonatomic) IBOutlet UIButton *btn_9;
@property (strong, nonatomic) IBOutlet UIButton *btn_next;
@property (strong, nonatomic) IBOutlet NSString *str_anser1,*str_anser2,*str_anser3;
@property (strong, nonatomic) IBOutlet NSMutableArray *listArray;
@property (strong, nonatomic) IBOutlet UIButton *btn_back;
@property (strong, nonatomic) IBOutlet UIButton *btn_sos;
@property (strong, nonatomic) IBOutlet UIButton *btn_noti;
@property (strong, nonatomic) IBOutlet UIButton *btn_profile;
@property (strong, nonatomic) IBOutlet UILabel *chatnotification;
@property (strong, nonatomic) IBOutlet UIImageView *img_profile;
@property (strong, nonatomic) IBOutlet UIButton *chatbtnobj;
@property (strong, nonatomic) IBOutlet NSString *countlblstr;

- (void)setCornerRadius:(CGFloat)cornerRadius
            fromColor:(UIColor *)fromColor
              toColor:(UIColor *)toColor
     normalTitleColor:(UIColor *)normalTitleColor
highlightedTitleColor:(UIColor *)highlightedTitleColor
          borderWidth:(CGFloat)borderWidth
          borderColor:(UIColor *)borderColor;

@end

NS_ASSUME_NONNULL_END
