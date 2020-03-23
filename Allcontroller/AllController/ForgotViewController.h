//
//  ForgotViewController.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 15/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *Forgotstmtlbl;
@property (strong, nonatomic) IBOutlet UITextField *ForgotTF;
@property (strong, nonatomic) IBOutlet UILabel *Forgotbacklbl;
@property (strong, nonatomic) IBOutlet UIButton *ForgotBtnobj;

- (IBAction)ForgotSubmitBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *logoimg;
- (IBAction)BackBtn:(id)sender;
@property (strong, nonatomic) IBOutlet NSString *str1;
@end
