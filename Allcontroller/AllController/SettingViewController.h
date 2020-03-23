//
//  SettingViewController.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 25/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *user_image;
@property (strong, nonatomic) IBOutlet UILabel *lbl_username;
@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;
- (IBAction)BackBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *view_footer1,*view_footer2;
@property (strong, nonatomic) IBOutlet UIView *tb_footer;
@property (strong, nonatomic) IBOutlet UILabel *Settinglbl;
@property (strong, nonatomic) IBOutlet UITableView *TableViewobj;
@property (strong, nonatomic) IBOutlet UIImageView *logoimg;
@property (strong, nonatomic) IBOutlet UILabel *logostmtlbl;
@property (strong, nonatomic) IBOutlet NSString *str1;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnobj,*EDITPROFILE;
@property (strong, nonatomic) IBOutlet UIButton *backBtnobj;
- (IBAction)profileiconBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Sosbtnobj;
- (IBAction)SosBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *profileBtnobj1;
- (IBAction)UpgradeBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *upgradeBtnobj;

@end
