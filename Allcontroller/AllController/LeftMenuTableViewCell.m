//
//  LeftMenuTableViewCell.m
//  Root_App
//
//  Created by BRIJESH KUMAR on 14/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import "LeftMenuTableViewCell.h"


@implementation LeftMenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _notificationlbl.layer.cornerRadius=15;
    _notificationlbl.clipsToBounds=YES;
 }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
