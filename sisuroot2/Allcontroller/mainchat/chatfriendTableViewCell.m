//
//  chatfriendTableViewCell.m
//  Root
//
//  Created by BRIJESH KUMAR on 30/03/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "chatfriendTableViewCell.h"

@implementation chatfriendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _Userimg.layer.cornerRadius=33;
    _Userimg.layer.borderColor=[UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    _Userimg.layer.borderWidth =2.0f;
    
    _Userimg.clipsToBounds=YES;
    // Initialization code
    _backlblobj.layer.cornerRadius=6;
    _backlblobj.layer.borderColor=[UIColor lightGrayColor].CGColor;
    _backlblobj.layer.borderWidth =0.5f;
    _backlblobj.clipsToBounds=YES;
 
    _countlbl.layer.cornerRadius=12;
   // _countlbl.layer.borderColor=[UIColor lightGrayColor].CGColor;
    //_countlbl.layer.borderWidth =0.5f;
    _countlbl.clipsToBounds=YES;
    
      _onlinelbl.layer.cornerRadius=8;
     _onlinelbl.clipsToBounds=YES;
    
    _mhpinfo.layer.cornerRadius=16;
    _mhpinfo.clipsToBounds=YES;
    
    
    _ilbl.layer.cornerRadius=15;
    // _countlbl.layer.borderColor=[UIColor lightGrayColor].CGColor;
    //_countlbl.layer.borderWidth =0.5f;
    _ilbl.clipsToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
