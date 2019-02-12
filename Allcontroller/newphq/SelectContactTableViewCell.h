//
//  SelectContactTableViewCell.h
//  Root
//
//  Created by BRIJESH KUMAR on 26/11/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelectContactTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *Userimg;
@property (strong, nonatomic) IBOutlet UILabel *Usernamelbl;
@property (strong, nonatomic) IBOutlet UILabel *circlenamelbl;
@property (strong, nonatomic) IBOutlet UIButton *CircleBtnobj;
@property (strong, nonatomic) IBOutlet UIImageView *Circleimg;
@property (strong, nonatomic) IBOutlet UIButton *RequestBtnobj;
@property (strong, nonatomic) IBOutlet UILabel *backlblobj;
@property (strong, nonatomic) IBOutlet UILabel *contactlbl;

@end

NS_ASSUME_NONNULL_END
