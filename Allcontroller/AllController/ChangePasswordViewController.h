//
//  ChangePasswordViewController.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 15/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *ChangePasswordstmtlblobj;
@property (strong, nonatomic) IBOutlet UIButton *revealmenuBtnobj;
@property (strong, nonatomic) IBOutlet UIImageView *CPlogoimg;
@property (strong, nonatomic) IBOutlet UITextField *OldpasswordTF;
@property (strong, nonatomic) IBOutlet UILabel *Oldpasslbl;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *view_alert;
@property (strong, nonatomic) IBOutlet UITextField *NewpasswordTF;
@property (strong, nonatomic) IBOutlet UIView *view_footer1;
@property (strong, nonatomic) IBOutlet UIView *tb_footer,*view11;
@property (strong, nonatomic) IBOutlet UIView *view_footer2;
@property (strong, nonatomic) IBOutlet UILabel *NewPasslbl;
@property (strong, nonatomic) IBOutlet UITextField *ConfirmpassTF;
@property (strong, nonatomic) IBOutlet UILabel *Confirmpasslbl;
@property (strong, nonatomic) IBOutlet UIButton *SubmitBtnobj;
@property (strong, nonatomic) IBOutlet UIImageView *confmpass1;
@property (strong, nonatomic) IBOutlet UIImageView *confmpass2;
- (IBAction)SubmitBtn:(id)sender;
- (IBAction)BackBtn:(id)sender;

@end
