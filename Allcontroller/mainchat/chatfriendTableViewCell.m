

#import "chatfriendTableViewCell.h"

@implementation chatfriendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   _Userimg.layer.cornerRadius=33;
    _Userimg.clipsToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
