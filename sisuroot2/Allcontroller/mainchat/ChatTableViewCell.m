//
//  ChatTableViewCell.m
//  Root
//
//  Created by BRIJESH KUMAR on 12/02/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "ChatTableViewCell.h"
static CGFloat textMarginHorizontal = 12.0f;
static CGFloat textMarginVertical = 5.0f;
@implementation ChatTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _mylbl.layer.masksToBounds = YES;

    _mylblviewimg.layer.masksToBounds = YES;
   // _mylblviewimg.layer.cornerRadius = 5.0;
//    _mylblview.layer.cornerRadius=8;
//    _mylblview.clipsToBounds=YES;
//    _mylblview.layer.borderWidth =1.0f;
//    _frndlblview.layer.cornerRadius=8;
//    _frndlblview.clipsToBounds=YES;
//    _frndlblview.layer.borderWidth =1.0f;
    _frndlbl.layer.masksToBounds = YES;

    _frndlblviewimg.layer.masksToBounds = YES;
    
   self.mylbl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    self.mylblview.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    self.frndlbl.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    self.frndlblview.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    //_frndlblviewimg.layer.cornerRadius = 5.0;
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//}

@end
