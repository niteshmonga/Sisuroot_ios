//
//  TermsnconditionViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 29/06/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TermsnconditionViewController : UIViewController
{
    IBOutlet UILabel *headerLbl;
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
@end
