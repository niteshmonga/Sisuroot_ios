//
//  ChatSendTableViewCell.m
//  Root
//
//  Created by BRIJESH KUMAR on 29/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "ChatSendTableViewCell.h"

@implementation ChatSendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _recieverimg.layer.cornerRadius=20;
    _recieverimg.clipsToBounds=YES;
    _senderimg.layer.cornerRadius=20;
       _senderimg.clipsToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
