//
//  DemoGraphicViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 02/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoGraphicViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *AgeTF;
@property (strong, nonatomic) IBOutlet UITextField *GoschoolTF;
@property (strong, nonatomic) IBOutlet UITextField *SchoollevelTF;
@property (strong, nonatomic) IBOutlet UITextField *unemploidTF;
@property (strong, nonatomic) IBOutlet UITextField *IncomeTF;
@property (strong, nonatomic) IBOutlet UITextField *EthnicityTF;
@property (strong, nonatomic) IBOutlet UITextField *GenderTF;
@property (strong, nonatomic) IBOutlet UITextField *EmergencyTF;

@property (strong, nonatomic) IBOutlet UITextField *heightTF;
@property (strong, nonatomic) IBOutlet UITextField *weightTF;
@property (strong, nonatomic) IBOutlet UITextField *emergencynemeTF;

@property (strong, nonatomic) IBOutlet NSString *detailstr;
@property (strong, nonatomic) IBOutlet UIView *view1obj;
@property (strong, nonatomic) IBOutlet UIView *view2obj;

- (IBAction)SaveandcontinueBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *SandvBtnobj;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewObj;
- (IBAction)SavenNextBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *SavenNextBtnobj;

@property (strong, nonatomic) IBOutlet UIButton *homeBtnobj;
@property (strong, nonatomic) IBOutlet NSString *strhome;

- (IBAction)HomeBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerviewobj;

@end
