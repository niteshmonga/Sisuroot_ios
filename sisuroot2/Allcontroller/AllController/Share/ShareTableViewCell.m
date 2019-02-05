//
//  ShareTableViewCell.m
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 05/10/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import "ShareTableViewCell.h"

@implementation ShareTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _Userimg.layer.cornerRadius=33;
    _Userimg.layer.borderColor=[UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    _Userimg.layer.borderWidth =2.0f;
    _Userimg.clipsToBounds=YES;
    _backlblobj.layer.cornerRadius=6;
    _backlblobj.layer.borderColor=[UIColor lightGrayColor].CGColor;
    _backlblobj.layer.borderWidth =0.5f;
    _backlblobj.clipsToBounds=YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
