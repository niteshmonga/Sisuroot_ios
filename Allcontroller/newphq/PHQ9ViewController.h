//
//  PHQ9ViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 04/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PHQ9ViewController : UIViewController
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
@property (strong, nonatomic) IBOutlet NSString *brief5str;
@property (strong, nonatomic) IBOutlet NSString *percieved8str;
@property (strong, nonatomic) IBOutlet NSString *phq8;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnobj;
@property (strong, nonatomic) IBOutlet NSString *phqstatus;
- (IBAction)Btn5Action:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Btn5obj;
- (IBAction)HomeBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *iconimg1;
@property (strong, nonatomic) IBOutlet UIImageView *iconimg2;
@property (strong, nonatomic) IBOutlet UIImageView *iconimg3;
@property (strong, nonatomic) IBOutlet UIImageView *iconimg4;

@end
