//
//  ListTableViewCell.m
//  Root_App
//
//  Created by BRIJESH KUMAR on 24/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _EmotionBtnobj.layer.cornerRadius=12;
    _EmotionBtnobj.clipsToBounds=YES;
    
    _listprofileimg.layer.cornerRadius=10;
    _listprofileimg.clipsToBounds=YES;
    _listprofileimg.layer.borderColor=(__bridge CGColorRef _Nullable)([UIColor lightGrayColor]);
    
    _EmotionBtnlblobj.layer.cornerRadius=6;
    _EmotionBtnlblobj.clipsToBounds=YES;
    _EmotionBtnlblobj.layer.borderColor=(__bridge CGColorRef _Nullable)([UIColor lightGrayColor]);
    
    _backlbl.layer.cornerRadius=10;
//    _backlbl.layer.borderColor=[UIColor lightGrayColor].CGColor;
//    _backlbl.layer.borderWidth =0.5f;
//    _backlbl.clipsToBounds=YES;

    
    _profileimg.layer.cornerRadius=19;
   // _profileimg.layer.borderColor=[UIColor lightGrayColor].CGColor;
   // _profileimg.layer.borderWidth =0.5f;
    _profileimg.clipsToBounds=YES;
    
    _OtherEmoBtnobj.layer.cornerRadius=12;
    _OtherEmoBtnobj.clipsToBounds=YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)OtherEmoBtn:(id)sender {
}
@end
