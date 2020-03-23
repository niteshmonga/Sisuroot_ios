
#import "rateonappTableViewCell.h"

@implementation rateonappTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
  //  _viewshow.layer.borderColor=[UIColor whiteColor].CGColor;
   // _viewshow.layer.borderWidth=1.0;
    _viewshow.layer.cornerRadius=10.0;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
