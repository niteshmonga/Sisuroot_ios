//
//  EmotionlistTableViewCell.h
//  Root
//
//  Created by Epikso on 28/12/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmotionlistTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *arrowimg;

@property (strong, nonatomic) IBOutlet UILabel *emotionlbl;
@property (strong, nonatomic) IBOutlet UIButton *backemobtnobj;
@property (strong, nonatomic) IBOutlet UILabel *backlbl;

@end
