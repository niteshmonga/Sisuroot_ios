//
//  FrontViewController.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 09/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FrontViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *backgroundimg;
@property (strong, nonatomic) IBOutlet UIImageView *logoimg;
@property (strong, nonatomic) IBOutlet UILabel *stmtlblobj;
@property (strong, nonatomic) IBOutlet UIButton *loginBtnobj;
- (IBAction)LoginBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *signupBtnobj;
- (IBAction)SignupBtn:(id)sender;
@property (strong, nonatomic) IBOutlet NSString *logoutstr;

@end
