//
//  BriefstartViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 02/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BriefstartViewController : UIViewController
- (IBAction)LetsstartbtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *letsstartbtnobj;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnobj;
@property (strong, nonatomic) IBOutlet NSString *idenstr;
@property (strong, nonatomic) IBOutlet UILabel *headinglbl;
@property (strong, nonatomic) IBOutlet UILabel *contentlbl;
@property (strong, nonatomic) IBOutlet UIView *view1obj;
@property (strong, nonatomic) IBOutlet UIView *view2obj;
@property (strong, nonatomic) IBOutlet UIView *view3obj;
@property (strong, nonatomic) IBOutlet NSString *test1str;
@property (strong, nonatomic) IBOutlet NSString *test2str;
@property (strong, nonatomic) IBOutlet NSString *test3str;
@property (strong, nonatomic) IBOutlet NSString *test4str;
@property (strong, nonatomic) IBOutlet UILabel *testlblobj;
@property (strong, nonatomic) IBOutlet NSString *teststr112;

- (IBAction)BackbtnAction:(id)sender;

@end
