//
//  ChatTableViewCell.h
//  Root
//
//  Created by BRIJESH KUMAR on 12/02/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *frndlbl;
@property (strong, nonatomic) IBOutlet UILabel *mylbl;
@property (strong, nonatomic) IBOutlet UIView *mylblview;
@property (strong, nonatomic) IBOutlet UIView *mybtnobj;
@property (strong, nonatomic) IBOutlet UIView *frndbtnobj;
@property (strong, nonatomic) IBOutlet UILabel *frndtimelbl;
@property (strong, nonatomic) IBOutlet UILabel *mytimelbl;
@property (strong, nonatomic) IBOutlet UITextView *frndtextview;

@property (strong, nonatomic) IBOutlet UIView *frndlblview;
@property (strong, nonatomic) IBOutlet UIImageView *mylblviewimg;
@property (strong, nonatomic) IBOutlet UIImageView *frndlblviewimg;
-(CGFloat)height;
-(void)updateMessageStatus;

@end
