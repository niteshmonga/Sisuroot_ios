//
//  dietaryinfo_FormViewController.h
//  Sisuroot
//
//  Created by Epikso on 05/04/19.
//  Copyright © 2019 Epikso Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dietaryinfo_FormViewController : UIViewController
{
    IBOutlet UILabel *headerLbl;
    IBOutlet UIWebView *webview;
    
}

@property(strong,nonatomic) NSString *typeString;
@property(strong,nonatomic) NSString *typeString1;

@property(strong,nonatomic) NSDictionary *localDict;
@property(strong,nonatomic) IBOutlet UIWebView *webview;
-(IBAction)backAction:(id)sender;
- (IBAction)AgreeBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *AgreeBtnobj;
- (IBAction)DisAgreeBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *disagreeBtnobj;
@property(strong,nonatomic) IBOutlet NSString *detailidstr;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnobj;
@property (strong, nonatomic) IBOutlet UILabel *headerLbl;
@property (strong, nonatomic) IBOutlet UIButton *backbtnobj;
@property (strong, nonatomic) IBOutlet UIButton *homebtnobj;
@property (strong, nonatomic) IBOutlet NSString *demostr;
@property (strong, nonatomic) IBOutlet UILabel *footerlbl;
@property (strong, nonatomic) IBOutlet UILabel *quizstmtlbl;

@end
