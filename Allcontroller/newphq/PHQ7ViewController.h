//
//  PHQ7ViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 04/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSMessagesViewController.h"

@interface PHQ7ViewController : JSMessagesViewController

@property (strong, nonatomic) IBOutlet UIImageView *backgroundimg;
@property (strong, nonatomic) IBOutlet UITableView *tableviewbj;
@property (strong, nonatomic) IBOutlet UITextField *chatTF;
@property (strong, nonatomic) IBOutlet UIButton *chatbtnobj;
@property (strong, nonatomic) IBOutlet NSDictionary *detail;
@property (strong, nonatomic) IBOutlet NSDictionary *detail1;
@property (strong, nonatomic) IBOutlet UIImageView *backimg;

@property (strong, nonatomic) IBOutlet UIView *viewobj;
@property (strong, nonatomic) IBOutlet UILabel *usernamelbl;
@property (strong, nonatomic) IBOutlet UIImageView *userimg;
@property (strong, nonatomic) IBOutlet UILabel *textbacklbl;

- (IBAction)BackBtnAction:(id)sender;
- (IBAction)SendBtnAction:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *frndlbl;
@property (strong, nonatomic) IBOutlet UILabel *mylbl;
@property (strong, nonatomic) IBOutlet UIView *mylblview;
@property (strong, nonatomic) IBOutlet UIView *mybtnobj;
@property (strong, nonatomic) IBOutlet UIView *frndbtnobj;

@property (strong, nonatomic) IBOutlet UIView *frndlblview;
@property (strong, nonatomic) IBOutlet UIImageView *mylblviewimg;
@property (strong, nonatomic) IBOutlet UIImageView *frndlblviewimg;
@property (strong, nonatomic) IBOutlet NSString *strdetail;

-(CGFloat)height;
- (IBAction)setbacklgroundBtn:(id)sender;

@property (strong,nonatomic) IBOutlet NSString *databasePath;

@end

