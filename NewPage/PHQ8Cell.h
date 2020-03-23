
#import <UIKit/UIKit.h>

@interface PHQ8Cell : UITableViewCell
{
    IBOutlet UISwitch *switchobj;
}
@property (strong, nonatomic) IBOutlet UILabel *listlblobj;
@property (strong, nonatomic) IBOutlet UIImageView *iconimg,*iconm;
@property (strong, nonatomic) IBOutlet UILabel *backlblobj;
@end
