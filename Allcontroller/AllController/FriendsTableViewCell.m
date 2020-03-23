#import "FriendsTableViewCell.h"
@implementation FriendsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _Userimg.layer.cornerRadius=25;
    _Userimg.clipsToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
