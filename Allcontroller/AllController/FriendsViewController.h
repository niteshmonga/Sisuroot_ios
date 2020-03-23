//
//  FriendsViewController.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 25/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>

#import <AddressBookUI/ABPeoplePickerNavigationController.h>
#import <AddressBookUI/ABPersonViewController.h>
#import <AddressBookUI/ABNewPersonViewController.h>
#import <AddressBookUI/ABUnknownPersonViewController.h>
#import <AddressBookUI/ABAddressFormatting.h>

@interface FriendsViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate,ABNewPersonViewControllerDelegate,ABPersonViewControllerDelegate>
{
    IBOutlet UIActivityIndicatorView *activityIden;
    UITapGestureRecognizer *tapper;
    IBOutlet UIView *barView;
    NSString *base64_encoded_image;
    NSString *imageNameStr;
    
    NSString *nameString;
    NSString *contactString;
    IBOutlet UITableView *FriendsTableviewobj;
    IBOutlet UILabel *chatnotification;
    UITextView *privateTextView;
    int indexCount;

}
@property (strong, nonatomic) IBOutlet UIView *view_footer2;
@property (strong, nonatomic) IBOutlet UIView *tb_footer;
@property (strong, nonatomic) IBOutlet UIView *view_footer1;
@property (strong, nonatomic) IBOutlet UIView *view_inner;
@property (strong, nonatomic) IBOutlet UIView *view_outer;
@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;
- (IBAction)BackBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *Friendsstmtlbl;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *Selectfriendlbl;
//@property (strong, nonatomic) IBOutlet UITableView *FriendsTableviewobj;
@property (strong, nonatomic) IBOutlet UIButton *backBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnObj;
@property (strong, nonatomic) IBOutlet NSString *str1;
@property (strong, nonatomic) IBOutlet NSString *friendstr;
@property (strong, nonatomic) IBOutlet UILabel *indcatorlbl;
@property (strong, nonatomic) IBOutlet UILabel *Acceptinlbl;

@property (strong, nonatomic) IBOutlet UIButton *InnerBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *OuterBtnobj;
@property (strong, nonatomic) IBOutlet UIView *RequestSentViewobj;
@property (strong, nonatomic) IBOutlet NSString *name;
@property (strong, nonatomic) IBOutlet NSString *strcount;

@property (strong, nonatomic) IBOutlet UIButton *blockBtnobj;
- (IBAction)FeedBtnAction:(id)sender;
- (IBAction)FriendsBtnAction:(id)sender;

- (IBAction)SosBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Chatbtnobj;
@property (strong, nonatomic) IBOutlet UIButton *Sosbtnobj;
@property (strong, nonatomic) IBOutlet UIButton *Addnewcontactobj;
@property (weak, nonatomic) IBOutlet UIImageView *contactuserimg;
@property (weak, nonatomic) IBOutlet NSString *invitestr;
@end

