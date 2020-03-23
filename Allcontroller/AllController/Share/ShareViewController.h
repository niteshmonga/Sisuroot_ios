//
//  ShareViewController.h
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 05/10/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;
@property (strong, nonatomic) IBOutlet UILabel *Selectfriendlbl;
- (IBAction)backBtnobj:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Postbtnobj;
@property (strong, nonatomic) IBOutlet UIView *view_share_again_in;
@property (strong, nonatomic) IBOutlet UIButton *btn_cancel,*btn_share,*btn_unshare;
@property (strong, nonatomic) IBOutlet UIImageView *img_post;
@property (strong, nonatomic) IBOutlet UIImageView *img_user;
@property (strong, nonatomic) IBOutlet UILabel *label_head;

@property (strong, nonatomic) IBOutlet UITableView *ShareTableviewobj;
@property (strong, nonatomic) IBOutlet UIView *view_share_agin;
@property (strong, nonatomic) IBOutlet NSString *str1;
@property (strong, nonatomic) IBOutlet NSString *str2,*str_img;
@property (strong, nonatomic) IBOutlet NSString *str4;
@property (strong, nonatomic) IBOutlet UIView *view_inner;
@property (strong, nonatomic) IBOutlet UIView *view_outer;
- (IBAction)PostBtn:(id)sender;

@end
