

#import <UIKit/UIKit.h>

@interface ChatSendTableViewCell : UITableViewCell
@property(strong,nonatomic) IBOutlet UIView *mainview1obj;
@property(strong,nonatomic) IBOutlet UILabel *username;
@property(strong,nonatomic) IBOutlet UILabel *msglbl;
@property(strong,nonatomic) IBOutlet UILabel *timelbl;


@property (strong, nonatomic) IBOutlet UILabel *frndlbl;
@property (strong, nonatomic) IBOutlet UITextView *frndtextview;

@property (strong, nonatomic) IBOutlet UILabel *mylbl;
@property (strong, nonatomic) IBOutlet UIView *mylblview;
@property (strong, nonatomic) IBOutlet UIView *mybtnobj;
@property (strong, nonatomic) IBOutlet UITextView *mytextview;

@property (strong, nonatomic) IBOutlet UIView *frndbtnobj;
@property (strong, nonatomic) IBOutlet UILabel *frndtimelbl;
@property (strong, nonatomic) IBOutlet UILabel *mytimelbl;
@property (strong, nonatomic) IBOutlet UIView *frndlblview;
@property (strong, nonatomic) IBOutlet UIImageView *mylblviewimg;
@property (strong, nonatomic) IBOutlet UIImageView *recieverimg;
@property (strong, nonatomic) IBOutlet UIImageView *senderimg;
@property (strong, nonatomic) IBOutlet UIImageView *frndlblviewimg;
@end
