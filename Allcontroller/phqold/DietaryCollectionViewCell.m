
#import "DietaryCollectionViewCell.h"

@implementation DietaryCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _Btn1obj.layer.cornerRadius=20;
    _Btn1obj.clipsToBounds=YES;
    _Btn1obj.layer.borderColor=[UIColor darkGrayColor].CGColor;
    _Btn1obj.layer.borderWidth = 1;
    
    _Btn2obj.layer.cornerRadius=20;
    _Btn2obj.clipsToBounds=YES;
    _Btn2obj.layer.borderColor=[UIColor darkGrayColor].CGColor;
    _Btn2obj.layer.borderWidth = 1;
    
    
    _Btn3obj.clipsToBounds=YES;
    _Btn3obj.layer.cornerRadius=20;
    _Btn3obj.layer.borderColor=[UIColor darkGrayColor].CGColor;
    _Btn3obj.layer.borderWidth = 1;
    
    _Btn4obj.clipsToBounds=YES;
    _Btn4obj.layer.cornerRadius=20;
    _Btn4obj.layer.borderColor=[UIColor darkGrayColor].CGColor;
    _Btn4obj.layer.borderWidth = 1;
    
    _Btn5obj.clipsToBounds=YES;
    _Btn5obj.layer.cornerRadius=20;
    _Btn5obj.layer.borderColor=[UIColor darkGrayColor].CGColor;
    _Btn5obj.layer.borderWidth = 1;
    
    _SubmitBtnobj.clipsToBounds=YES;
    _SubmitBtnobj.layer.cornerRadius=20;
    _SubmitBtnobj.layer.borderColor=[UIColor whiteColor].CGColor;
    _SubmitBtnobj.layer.borderWidth = 1;
    
    _Btn6obj.clipsToBounds=YES;
    _Btn6obj.layer.cornerRadius=20;
    _Btn6obj.layer.borderColor=[UIColor darkGrayColor].CGColor;
    _Btn6obj.layer.borderWidth = 1;


}

@end
