//
//  Bs2ViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 04/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Bs2ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *AgeTF;
@property (strong, nonatomic) IBOutlet UITextField *GoschoolTF;
@property (strong, nonatomic) IBOutlet UITextField *SchoollevelTF;
@property (strong, nonatomic) IBOutlet UITextField *unemploidTF;
@property (strong, nonatomic) IBOutlet UITextField *IncomeTF;
@property (strong, nonatomic) IBOutlet UITextField *EthnicityTF;
@property (strong, nonatomic) IBOutlet UITextField *GenderTF;
@property (strong, nonatomic) IBOutlet UITextField *emnumTF;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnobj;
@property (strong, nonatomic) IBOutlet UITextField *heightTF;
@property (strong, nonatomic) IBOutlet UITextField *weightTF;
@property (strong, nonatomic) IBOutlet UITextField *emergencynemeTF;

- (IBAction)SaveandcontinueBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *SandvBtnobj;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewObj;
@property (strong, nonatomic) IBOutlet NSString *brief2str;
@property (strong, nonatomic) IBOutlet NSString *percieved2str;
- (IBAction)HomeBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *HomeBtnobj;
- (IBAction)BackBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerviewobj;

@end
