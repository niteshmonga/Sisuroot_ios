//
//  EmotionViewController.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 25/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customslider.h"
@interface EmotionViewController : UIViewController
{
     __weak IBOutlet Customslider *theViewSlider;
}

@property (strong, nonatomic) IBOutlet UIView *view_footer2;
@property (strong, nonatomic) IBOutlet UIView *view_footer1;
@property (strong, nonatomic) IBOutlet UIView *tb_footer;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnobj;
@property (strong, nonatomic) IBOutlet UITextField *headlineTF;
@property (strong, nonatomic) IBOutlet UITextField *nameTF;
@property (strong, nonatomic) IBOutlet UISlider *slider;

@property (strong, nonatomic) IBOutlet UITextView *commentsTV;
- (IBAction)SubmitAction:(id)sender;
- (IBAction)HomeBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *submitbtnobj,*btn_survey;
@property (strong, nonatomic) IBOutlet UILabel *kiwainfolbl,*lbl_write;
@property (strong, nonatomic) IBOutlet UILabel *infolbl;
@property (strong, nonatomic) IBOutlet UILabel *infofirstlbl;
@property (strong, nonatomic) IBOutlet UIButton *btn1;
@property (strong, nonatomic) IBOutlet UIButton *btn2;
@property (strong, nonatomic) IBOutlet UIButton *btn3;
@property (strong, nonatomic) IBOutlet UIButton *btn4;
@property (strong, nonatomic) IBOutlet NSString *emo_string;
@property (strong, nonatomic) IBOutlet UIButton *btn5;

@end
