//
//  PHQ8ViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 04/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PHQ8ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *Questionlbl;
@property (strong, nonatomic) IBOutlet UILabel *qbacklbl;
@property (strong, nonatomic) IBOutlet UILabel *BSAlbl;
@property (strong, nonatomic) IBOutlet UILabel *contentlbl;
@property (strong, nonatomic) IBOutlet UIButton *Btn1obj;
@property (strong, nonatomic) IBOutlet UIButton *Btn2obj;
@property (strong, nonatomic) IBOutlet UIButton *Btn3obj;
@property (strong, nonatomic) IBOutlet UIButton *Btn4obj;
- (IBAction)NotatallBtnAction:(id)sender;
- (IBAction)Btn2Action:(id)sender;
- (IBAction)Btn3Action:(id)sender;
- (IBAction)Btn4Action:(id)sender;
- (IBAction)SkipBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *Btn1lbl;
@property (strong, nonatomic) IBOutlet UILabel *Btn2lbl;
@property (strong, nonatomic) IBOutlet UILabel *Btn3lbl;
@property (strong, nonatomic) IBOutlet UILabel *Btn4lbl;
@property (strong, nonatomic) IBOutlet UIButton *skipBtnobj;
@property (strong, nonatomic) IBOutlet NSString *brief4str;
@property (strong, nonatomic) IBOutlet NSString *percieved7str;
@property (strong, nonatomic) IBOutlet NSString *phq7;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnobj;
@property (strong, nonatomic) IBOutlet UITableView *TableViewobj;
@property (strong, nonatomic) IBOutlet NSArray *listarray12;
@property (strong, nonatomic) IBOutlet NSString *nextpagestr;
- (IBAction)HomeBtnAction:(id)sender;

@end
