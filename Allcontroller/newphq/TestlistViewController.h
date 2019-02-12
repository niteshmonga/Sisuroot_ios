//
//  TestlistViewController.h
//  Root
//
//  Created by Epikso on 20/09/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestlistViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *TableViewobj;
@property (strong, nonatomic) IBOutlet UILabel *Questionlbl;
@property (strong, nonatomic) IBOutlet UILabel *qbacklbl;
@property (strong, nonatomic) IBOutlet UILabel *BSAlbl;

- (IBAction)NotatallBtnAction:(id)sender;
- (IBAction)Btn2Action:(id)sender;
- (IBAction)Btn3Action:(id)sender;
- (IBAction)Btn4Action:(id)sender;
- (IBAction)SkipBtnAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *skipBtnobj;
@property (strong, nonatomic) IBOutlet NSString *brief5str;
@property (strong, nonatomic) IBOutlet NSString *percieved8str;
@property (strong, nonatomic) IBOutlet NSString *phq8;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnobj;
@property (strong, nonatomic) IBOutlet NSString *phqstatus;
- (IBAction)Btn5Action:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Btn5obj;
- (IBAction)HomeBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet NSArray *listarray12;
@property (strong, nonatomic) IBOutlet NSString *nextpagestr;
- (IBAction)closeBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *contentviewobj;
- (IBAction)moreBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *readbuttonobj;

@end
