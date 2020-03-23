//
//  ResponseTableViewCell.h
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 18/05/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResponseTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;
@property (strong, nonatomic) IBOutlet UIImageView *Userimg;
@property (strong, nonatomic) IBOutlet UILabel *Usernamelbl;
@property (strong, nonatomic) IBOutlet UIButton *DeleteresponseBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *RequestBtnobj;
@property (strong, nonatomic) IBOutlet UIView *Circlegrpview;
@property (strong, nonatomic) IBOutlet UIButton *InnerCircleBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *OuterCircleBtnobj;
@property (strong, nonatomic) IBOutlet UILabel *backlblobj;
@property (strong, nonatomic) IBOutlet UILabel *commentlbl;

@property (strong, nonatomic) IBOutlet UIButton *backBtnobj;

@end
