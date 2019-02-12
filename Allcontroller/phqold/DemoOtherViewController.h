//
//  DemoOtherViewController.h
//  Root
//
//  Created by Epikso on 04/09/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoOtherViewController : UIViewController
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
