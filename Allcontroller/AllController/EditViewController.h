//
//  EditViewController.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 13/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController
{
    NSString *base64_encoded_image;
    NSString *base64_encoded_image1;

    NSString *imageNameStr;
    NSString *imageNameStr1;

    
}
//@interface PickPhotosViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *profilebackimg;
@property (strong, nonatomic) IBOutlet UILabel *Editprofilestmtlbl;
@property (strong, nonatomic) IBOutlet UIButton *SaveBtnobj;
- (IBAction)profilePicBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *ProfilepicBtnobj;
- (IBAction)AddprofilepicBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *AddprofilepicBtnobj;
@property (strong, nonatomic) IBOutlet UITextField *UserTF;
@property (strong, nonatomic) IBOutlet UITextField *DobTF;
@property (strong, nonatomic) IBOutlet UITextField *MobileTF;
@property (strong, nonatomic) IBOutlet UITextField *EmailTF;
@property (strong, nonatomic) IBOutlet UITextField *PasswordTF;
@property (strong, nonatomic) IBOutlet UITextField *locationTF;
@property (strong, nonatomic) IBOutlet UILabel *Verifyprofilelblobj;
- (IBAction)VerifyBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *revealmenuBtnobj;
@property (strong, nonatomic) IBOutlet UIImageView *profileimg;
- (IBAction)ChangePasswordBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *ChangePasswordBtnobj;
@property (strong, nonatomic) IBOutlet UIDatePicker *Datepickerobj;
@property (strong, nonatomic) IBOutlet UILabel *Callenderlblobj;
@property (strong, nonatomic) IBOutlet UIButton *DoneBtnobj;
- (IBAction)DoneBtnobj:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewObj;
@property (strong, nonatomic) IBOutlet NSString *uidstr;
@property (strong, nonatomic) IBOutlet UIButton *profilepic1Btnobj;
@property (strong, nonatomic) IBOutlet NSDictionary *detail;
@property (strong, nonatomic) IBOutlet UIButton *saveandverifybtnobj;
@property (strong, nonatomic) IBOutlet UIImageView *extlogoimg;

@end
