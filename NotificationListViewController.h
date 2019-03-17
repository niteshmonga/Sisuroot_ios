//
//  NotificationListViewController.h
//  Sisuroot
//
//  Created by BRIJESH KUMAR on 13/03/19.
//  Copyright © 2019 Epikso Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NotificationListViewController : UIViewController
{
    IBOutlet UITableView *tableView;
    
   // NSArray *listArray;
 
    IBOutlet UIActivityIndicatorView *activityIden;
    UITapGestureRecognizer *tapper;
    IBOutlet UIView *barView;
    NSString *base64_encoded_image;
    NSString *imageNameStr;
    IBOutlet UILabel *chatnotification;
    
}
@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;
- (IBAction)BackBtnAction:(id)sender;
- (IBAction)SearchBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *Requeststmtlbl;
- (IBAction)SettingBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UISearchBar *SearchBarobj;
@property (strong, nonatomic) IBOutlet UILabel *FriendRequestlbl;
@property (strong, nonatomic) IBOutlet UITableView *ResponseTableviewobj;
@property (strong, nonatomic) IBOutlet UIButton *backBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnObj;
@property (strong, nonatomic) IBOutlet UIView *Circlegrpview;
@property (strong, nonatomic) IBOutlet UIButton *InnerCircleBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *OuterCircleBtnobj;
- (IBAction)InnerCircleBtn:(id)sender;
- (IBAction)OuterCircleBtn:(id)sender;
@property (strong, nonatomic) IBOutlet NSString *str2;
@property (strong, nonatomic) IBOutlet UIImageView *profileiconimg;
- (IBAction)profileiconBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *profileBtnobj1;

- (IBAction)HomeBtnAction:(id)sender;
- (IBAction)FriendsBtnAction:(id)sender;
- (IBAction)GalleryBtnAction:(id)sender;
- (IBAction)TagBtnAction:(id)sender;
- (IBAction)chatbtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Sosbtnobj;
@property (strong, nonatomic) IBOutlet NSArray *countstr;
- (IBAction)SosBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Chatbtnobj;


 @end

NS_ASSUME_NONNULL_END
