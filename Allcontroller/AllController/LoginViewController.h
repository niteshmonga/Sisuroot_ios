//
//  LoginViewController.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 12/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
 //#import <GooglePlus/GooglePlus.h>
#import <GoogleSignIn/GoogleSignIn.h>

@interface LoginViewController : UIViewController
{
    IBOutlet UIScrollView *loginScrollView;
    IBOutlet UIView *gmailView;
    IBOutlet UIActivityIndicatorView *activityIden;
    IBOutlet UILabel *idenlbl;

}
@property (strong, nonatomic) IBOutlet UILabel *signinstmtlbl;
- (IBAction)BackBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *Logoimg;
@property (strong, nonatomic) IBOutlet UITextField *userTF;
@property (strong, nonatomic) IBOutlet UITextField *passwordTF;
@property (strong, nonatomic) IBOutlet UILabel *Apnslblobj;
@property (strong, nonatomic) IBOutlet UILabel *Allowcontactlblobj;
@property (strong, nonatomic) IBOutlet UILabel *Termsnconditionslblobj;
- (IBAction)ApnsBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *ApnsBtnobj;
- (IBAction)AllowcontactBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *AllowcontactBtnobj;
@property (strong, nonatomic) IBOutlet NSString *str1;
@property (strong, nonatomic) IBOutlet NSString *changebackstr;

- (IBAction)termsnconditionsBtn:(id)sender;
- (IBAction)LoginBtn:(id)sender;
- (IBAction)helpBtn:(id)sender;
- (IBAction)ForgotBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *BackBtnobj;
- (IBAction)gmailbtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *LoginBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *gmailBtnobj;
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
- (IBAction)RetrieveusernameBtn:(id)sender;
@property (retain, nonatomic) NSArray *arrayOfButtonTitles;
@property (retain, nonatomic) UIImage *alertImage;
@property (retain, nonatomic) NSString *alertTitle;
- (IBAction)RememberbtnAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *Rememberbtnobj;
@property (strong, nonatomic) IBOutlet UIImageView *Rememberimg;







@end
