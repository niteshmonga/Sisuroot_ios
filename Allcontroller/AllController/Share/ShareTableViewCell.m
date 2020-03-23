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
    _Userimg.layer.cornerRadius=30;
    _Userimg.clipsToBounds=YES;    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
