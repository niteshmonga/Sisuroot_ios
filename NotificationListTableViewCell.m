//
//  NotificationListTableViewCell.m
//  Sisuroot
//
//  Created by BRIJESH KUMAR on 13/03/19.
//  Copyright © 2019 Epikso Inc. All rights reserved.
//

#import "NotificationListTableViewCell.h"

@implementation NotificationListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.userimg.layer.cornerRadius=28;
    [self.userimg setClipsToBounds:YES];
   // _userimg.layer.borderColor = [[UIColor colorWithRed:(146.0/255.0)
    //                                              green:(225.0/255.0)
    //                                               blue:(110.0/255.0)
     //                                             alpha:(1.0)] CGColor];
 }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
