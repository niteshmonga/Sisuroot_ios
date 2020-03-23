
#import "friendrequestCollectionViewCell.h"

@implementation friendrequestCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
       _image_user.layer.cornerRadius=30;
       _image_user.clipsToBounds=YES;
     
       _view_btn.layer.cornerRadius=18;
       _view_btn.clipsToBounds=YES;
      
    // Initialization code
}

@end
