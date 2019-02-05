//
//  EmotionTagTableViewCell.h
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 19/09/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmotionTagTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *TagEmotionnamelbl;
@property (strong, nonatomic) IBOutlet UIButton *HardtagBtnobj;
@property (strong, nonatomic) IBOutlet UIImageView *HardTagbtnimg;
@property (strong, nonatomic) IBOutlet NSMutableArray *dataAraay;

@end
