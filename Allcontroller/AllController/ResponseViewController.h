//
//  ResponseViewController.h
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 18/05/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResponseViewController : UIViewController
{
    IBOutlet UIActivityIndicatorView *activityIden;
    UITapGestureRecognizer *tapper;
    IBOutlet UIView *barView;
    NSString *base64_encoded_image;
    NSString *imageNameStr;
    IBOutlet UILabel *chatnotification;

}

@property (strong, nonatomic) IBOutlet UIView *view_footer1;
@property (strong, nonatomic) IBOutlet UIView *tb_footer;
@property (strong, nonatomic) IBOutlet UIButton *btn_home,*btn_chat,*btn_you,*btn_faq;

@property (strong, nonatomic) IBOutlet UIView *view_footer2;
@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg1;

@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;
- (IBAction)BackBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *Requeststmtlbl;

@property (strong, nonatomic) IBOutlet UITableView *ResponseTableviewobj;
@property (strong, nonatomic) IBOutlet UIButton *backBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnObj;
@property (strong, nonatomic) IBOutlet UIView *Circlegrpview;
@property (strong, nonatomic) IBOutlet UIButton *InnerCircleBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *OuterCircleBtnobj;
- (IBAction)InnerCircleBtn:(id)sender;
- (IBAction)OuterCircleBtn:(id)sender;
@property (strong, nonatomic) IBOutlet NSString *str2;
- (IBAction)HomeBtnAction:(id)sender;
- (IBAction)chatbtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Sosbtnobj;
@property (strong, nonatomic) IBOutlet NSArray *countstr;
- (IBAction)SosBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Chatbtnobj;

@end
