//
//  ResponseTableViewCell.m
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 18/05/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import "ResponseTableViewCell.h"

@implementation ResponseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _Userimg.layer.cornerRadius=8;
    _Userimg.clipsToBounds=YES;
    // Initialization code
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
