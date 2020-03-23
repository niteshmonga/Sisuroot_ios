//
//  ShareTableViewCell.h
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 05/10/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *Backimg;
@property (strong, nonatomic) IBOutlet UIImageView *Userimg;
@property (strong, nonatomic) IBOutlet UILabel *Usernamelbl;
@property (strong, nonatomic) IBOutlet UIButton *CircleBtnobj;
//@property (strong, nonatomic) IBOutlet UIImageView *Circleimg;
@property (strong, nonatomic) IBOutlet UIButton *CheckBtnobj;
@property (strong, nonatomic) IBOutlet UIImageView *checkimg;
@property (strong, nonatomic) IBOutlet UILabel *backlblobj;
@property (strong, nonatomic) IBOutlet UIImageView *Circleimg;
@property (strong, nonatomic) IBOutlet UIButton *RequestBtnobj;
@end
