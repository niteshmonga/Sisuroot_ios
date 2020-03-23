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

@interface FriendsaddViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate,ABNewPersonViewControllerDelegate,ABPersonViewControllerDelegate,UIAlertViewDelegate>
{
    IBOutlet UIActivityIndicatorView *activityIden;
    UITapGestureRecognizer *tapper;
    IBOutlet UIView *barView;
     IBOutlet UITableView *FriendsTableviewobj;
    IBOutlet UILabel *chatnotification;
    UITextView *privateTextView;
    int indexCount;

}
@property (strong, nonatomic) IBOutlet UIButton *btn_addto,*btn_inner,*btn_outer;
@property (strong, nonatomic) IBOutlet UIView *viewinner,*viwqqq;
@property (strong, nonatomic) IBOutlet UIView *viewouter;
@property (weak, nonatomic) IBOutlet UITextField *FirstnameTF;
@property (weak, nonatomic) IBOutlet UIButton *Cancelbtnobj;
@property (weak, nonatomic) IBOutlet UITextField *LastnameTF;
@property (weak, nonatomic) IBOutlet UIButton *DoneBtnobj;
@property (strong, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *PhoneTF;
@property (strong, nonatomic) IBOutlet UIButton *btn_cancel_add_contact;
@property (strong, nonatomic) IBOutlet UIView *view_add_new_conaact;
@property (strong, nonatomic) IBOutlet UIView *view_footer2;
@property (strong, nonatomic) IBOutlet UIView *tb_footer,*view_new_contatc;
@property (strong, nonatomic) IBOutlet UIView *view_footer1;
@property (strong, nonatomic) IBOutlet UIView *view_addto;
@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;
- (IBAction)BackBtnAction:(id)sender;
- (IBAction)SearchBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIButton *backBtnobj,*can1;
@property (strong, nonatomic) IBOutlet UIButton *MenuBtnObj;

- (IBAction)ProfileBtnAction:(id)sender;
- (IBAction)FeedBtnAction:(id)sender;
- (IBAction)FriendsBtnAction:(id)sender;
- (IBAction)TagBtnAction:(id)sender;
- (IBAction)SosBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Chatbtnobj;
@property (strong, nonatomic) IBOutlet UIButton *Sosbtnobj;
@end

