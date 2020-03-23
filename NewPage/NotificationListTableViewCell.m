#import "NotificationListTableViewCell.h"
@implementation NotificationListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.userimg.layer.cornerRadius=28;
    [self.userimg setClipsToBounds:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
