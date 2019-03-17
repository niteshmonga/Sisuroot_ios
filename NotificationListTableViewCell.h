//
//  NotificationListTableViewCell.h
//  Sisuroot
//
//  Created by BRIJESH KUMAR on 13/03/19.
//  Copyright © 2019 Epikso Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NotificationListTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *userimg;
@property (strong, nonatomic) IBOutlet UILabel *msglbl;
@property (strong, nonatomic) IBOutlet UILabel *datelbl;
@property (strong, nonatomic) IBOutlet UILabel *typelbl;
@property (strong, nonatomic) IBOutlet UIImageView *typeimg;

@property (strong, nonatomic) IBOutlet UILabel *backlbl;

@end

NS_ASSUME_NONNULL_END
