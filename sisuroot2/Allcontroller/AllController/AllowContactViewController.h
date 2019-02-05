//
//  AllowContactViewController.h
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 14/09/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllowContactViewController : UIViewController
{
    IBOutlet UIActivityIndicatorView *activityIden;
    NSString *nameString;
    NSString *contactString;
}
@property (strong, nonatomic) IBOutlet UIImageView *logoimg;

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
- (IBAction)AccessconBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Access_conBtnobj;
- (IBAction)CancelBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *CancelBtnobj;
@property (strong, nonatomic) NSDictionary *detail;
@end
