//
//  chatfriendTableViewCell.h
//  Root
//
//  Created by BRIJESH KUMAR on 30/03/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface chatfriendTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *Backimg;
@property (strong, nonatomic) IBOutlet UIImageView *Userimg;
@property (strong, nonatomic) IBOutlet UILabel *Usernamelbl;
@property (strong, nonatomic) IBOutlet UILabel *messagenamelbl;
@property (strong, nonatomic) IBOutlet UILabel *datelbl;
@property (strong, nonatomic) IBOutlet UILabel *countlbl;
@property (strong, nonatomic) IBOutlet UILabel *backlblobj;
@property (strong, nonatomic) IBOutlet UIImageView *selectBtnobj;

@property (strong, nonatomic) IBOutlet UIButton *cellBtnobj;
@property (strong, nonatomic) IBOutlet UILabel *onlinelbl;
@property (strong, nonatomic) IBOutlet UIButton *mhpinfo;
@property (strong, nonatomic) IBOutlet UIImageView *mhpinfoimg,*img_on;

@property (strong, nonatomic) IBOutlet UILabel *ilbl;


@end
