//
//  SelectContactViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 26/11/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelectContactViewController : UIViewController
{
    UITapGestureRecognizer *tapper;

}
@property (strong, nonatomic) IBOutlet UITableView *tableviewobj;
- (IBAction)InviteBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *InviteBtnobj;
- (IBAction)SkipBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *SkipBtnobj;
@property (strong, nonatomic) IBOutlet NSString *str1;

@property (strong, nonatomic) IBOutlet UIButton *profileBtnobj1;
@property (strong, nonatomic) IBOutlet UIButton *Addnewcontactobj;
- (IBAction)Addcontact:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *Addcontactview;
@property (weak, nonatomic) IBOutlet UIImageView *contactuserimg;
- (IBAction)CancelBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *Cancelbtnobj;
@property (weak, nonatomic) IBOutlet UITextField *FirstnameTF;
@property (weak, nonatomic) IBOutlet UITextField *LastnameTF;
@property (weak, nonatomic) IBOutlet UITextField *PhoneTF;
- (IBAction)DoneBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *DoneBtnobj;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end

NS_ASSUME_NONNULL_END
