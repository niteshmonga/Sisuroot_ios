//
//  EmotionViewController.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 25/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmotionViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIButton *MenuBtnobj;
@property (strong, nonatomic) IBOutlet UITextField *headlineTF;
@property (strong, nonatomic) IBOutlet UITextField *nameTF;

@property (strong, nonatomic) IBOutlet UITextView *commentsTV;
- (IBAction)SubmitAction:(id)sender;
- (IBAction)HomeBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *submitbtnobj;
@property (strong, nonatomic) IBOutlet UILabel *kiwainfolbl;
@property (strong, nonatomic) IBOutlet UILabel *infolbl;
@property (strong, nonatomic) IBOutlet UILabel *infofirstlbl;

@end
