//
//  SignupViewController.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 12/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController
{
    IBOutlet UIActivityIndicatorView *activityIden;
    NSString *nameString;
    NSString *contactString;
    NSMutableArray *namearray;
    NSMutableArray *contactnarray;
    int indexCount;
    
}
@property (strong, nonatomic) IBOutlet UILabel *signupstmtlbl;
- (IBAction)backBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *logoimg;
@property (strong, nonatomic) IBOutlet UITextField *UserTF;
@property (strong, nonatomic) IBOutlet UITextField *EmailTF;
@property (strong, nonatomic) IBOutlet UITextField *PasswordTF;
@property (strong, nonatomic) IBOutlet UITextField *mobileTF;

- (IBAction)SignupBtn:(id)sender;
- (IBAction)UsernameTFAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *usernamelbl;
@property (strong, nonatomic) IBOutlet UIButton *SignupBtnobj;
- (IBAction)GmailBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *GmailBtnobj;
@property (strong, nonatomic) IBOutlet NSString *email;
@property (strong, nonatomic) IBOutlet NSString *email_verified;

@property (strong, nonatomic) IBOutlet NSString *name;
@property (strong, nonatomic) IBOutlet NSString *picture;
@property (strong, nonatomic) IBOutlet NSString *profile;
@property (strong, nonatomic) IBOutlet NSString *family_name;
@property (strong, nonatomic) IBOutlet NSString *given_name;
@property (strong, nonatomic) IBOutlet NSString *locale;
@property (strong, nonatomic) IBOutlet NSString *gender;
@property (strong, nonatomic) IBOutlet NSString *sub;
@property (strong, nonatomic) IBOutlet UILabel *Apnslblobj;
@property (strong, nonatomic) IBOutlet UILabel *Allowcontactlblobj;
@property (strong, nonatomic) IBOutlet UILabel *Termsnconditionslblobj;
- (IBAction)ApnsBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *ApnsBtnobj;
- (IBAction)AllowcontactBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *AllowcontactBtnobj;
@property (strong, nonatomic) IBOutlet NSString *str1;

- (IBAction)termsnconditionsBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *apnsimg;
@property (strong, nonatomic) IBOutlet UIImageView *contactimg;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerviewobj;
@property (strong, nonatomic) IBOutlet UITextField *accountTF;
@property (strong, nonatomic) IBOutlet UILabel *codelblobj;
@property (strong, nonatomic) IBOutlet UIButton *codedoneobj;
- (IBAction)codebtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *codeTF;
@property (strong, nonatomic) IBOutlet UIPickerView *codepickerobj;

@end
