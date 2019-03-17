//
//  BS1ViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 04/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BS1ViewController : UIViewController
{
    IBOutlet UILabel *headerLbl;
}

@property(strong,nonatomic) NSString *typeString;
@property(strong,nonatomic) NSString *typeString1;

@property(strong,nonatomic) NSDictionary *localDict;
@property(strong,nonatomic) IBOutlet UIWebView *webview;
-(IBAction)backAction:(id)sender;
- (IBAction)SkipBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *SkipBtnobj;
- (IBAction)DisAgreeBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *disagreeBtnobj;
@property(strong,nonatomic) IBOutlet NSString *detailidstr;
@property(strong,nonatomic) IBOutlet NSString *msgstr;
@property(strong,nonatomic) IBOutlet NSString *msgcheckstr;
@property(strong,nonatomic) IBOutlet NSString *scaletype;
@property(strong,nonatomic) IBOutlet NSString *countstr;

@property(strong,nonatomic) IBOutlet UILabel *hidderlbl;
- (IBAction)BackBtnAction:(id)sender;
- (IBAction)HomeBtnAction:(id)sender;
@property(strong,nonatomic) IBOutlet UIButton *backbtnobj;

@end
