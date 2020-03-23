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
@property (strong, nonatomic) IBOutlet UIView *view_footer1;
@property (strong, nonatomic) IBOutlet UIView *tb_footer;
@property (strong, nonatomic) IBOutlet UIView *view_footer2;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IBOutlet UIImageView *profilebackimg;
@property (strong, nonatomic) IBOutlet UILabel *Editprofilestmtlbl;
@property (strong, nonatomic) IBOutlet UIButton *SaveBtnobj,*profilepic1Btnobj;
- (IBAction)profilePicBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *ProfilepicBtnobj,*editemail;
- (IBAction)AddprofilepicBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *AddprofilepicBtnobj;
@property (strong, nonatomic) IBOutlet UITextField *UserTF;
@property (strong, nonatomic) IBOutlet UITextField *EmailTF;
@property (strong, nonatomic) IBOutlet UILabel *Verifyprofilelblobj;
- (IBAction)VerifyBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *revealmenuBtnobj;
@property (strong, nonatomic) IBOutlet UIImageView *profileimg;

@property (strong, nonatomic) IBOutlet UIButton *DoneBtnobj;
- (IBAction)DoneBtnobj:(id)sender;
@property (strong, nonatomic) IBOutlet NSDictionary *detail;
@property (strong, nonatomic) IBOutlet UIButton *saveandverifybtnobj;
@end
