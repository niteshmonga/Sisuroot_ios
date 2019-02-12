//
//  FriendsTableViewCell.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 25/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *Backimg;
@property (strong, nonatomic) IBOutlet UIImageView *Userimg;
@property (strong, nonatomic) IBOutlet UILabel *Usernamelbl;
@property (strong, nonatomic) IBOutlet UILabel *circlenamelbl;
@property (strong, nonatomic) IBOutlet UIButton *CircleBtnobj;
@property (strong, nonatomic) IBOutlet UIImageView *Circleimg;
@property (strong, nonatomic) IBOutlet UIButton *RequestBtnobj;
@property (strong, nonatomic) IBOutlet UILabel *backlblobj;

@end
