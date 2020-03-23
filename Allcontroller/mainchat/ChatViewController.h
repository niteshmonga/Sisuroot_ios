//
//  ChatViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 12/02/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <sqlite3.h>
@protocol senddataProtocol <NSObject>

-(void)sendDataToA:(NSString *)mhpstr11; //I am thinking my data is NSArray, you can use another object for store your information.

@end
//int returnPressed = 0;
//int newLine;
@interface ChatViewController : UIViewController <UITextViewDelegate>
{
    NSString *base64_encoded_image;
    NSString *imageNameStr;
    int indexvalue;
}
@property(nonatomic,assign)id delegate;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundimg;
@property (strong, nonatomic) IBOutlet UITableView *tableviewbj;
@property (strong, nonatomic) IBOutlet UITextField *chatTF;
@property (strong, nonatomic) IBOutlet UITextView *textview;
@property (strong, nonatomic) IBOutlet UIButton *chatbtnobj;
@property (strong, nonatomic) IBOutlet NSDictionary *detail;
@property (strong, nonatomic) IBOutlet NSDictionary *detail1;
@property (strong, nonatomic) IBOutlet UIImageView *backimg;
@property (strong, nonatomic) IBOutlet UIView *viewobj;
@property (strong, nonatomic) IBOutlet UILabel *usernamelbl;
@property (strong, nonatomic) IBOutlet UIImageView *userimg;
@property (strong, nonatomic) IBOutlet UILabel *textbacklbl;
- (IBAction)BackBtnAction:(id)sender;
- (IBAction)SendBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *frndlbl;
@property (strong, nonatomic) IBOutlet UILabel *mylbl;
@property (strong, nonatomic) IBOutlet UIView *mylblview;
@property (strong, nonatomic) IBOutlet UIView *mybtnobj;
@property (strong, nonatomic) IBOutlet UIView *frndbtnobj;
@property (strong, nonatomic) IBOutlet UIView *frndlblview;
@property (strong, nonatomic) IBOutlet UIImageView *mylblviewimg;
@property (strong, nonatomic) IBOutlet UIImageView *frndlblviewimg;
@property (strong, nonatomic) IBOutlet NSString *strdetail;
@property (strong, nonatomic) IBOutlet NSDictionary *detail2;
@property (strong, nonatomic) IBOutlet NSString *detail2str;
-(CGFloat)height;
- (IBAction)setbacklgroundBtn:(id)sender;
@property (strong,nonatomic) IBOutlet NSString *databasePath;
@property (nonatomic) sqlite3 *DB;
@property (strong, nonatomic) IBOutlet UIButton *addparticipantBtnobj;
- (IBAction)AddparticipantBtnAction:(id)sender;
- (IBAction)BackaddparticipantBtn:(id)sender;
- (IBAction)DoneBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *DoneBtnActionobj;
@property (strong, nonatomic) IBOutlet UITableView *AdduserTableview;
@property (strong, nonatomic) IBOutlet UIView *Addparticipantview;
@property (strong, nonatomic) IBOutlet UILabel *addparticipant;
@property (strong, nonatomic) IBOutlet UIButton *Addtherapistobj;
- (IBAction)AddtherapistAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *Gviewobj;
@property (strong, nonatomic) IBOutlet UIImageView *Gimg;
@property (strong, nonatomic) IBOutlet UILabel *Gname;
@property (strong, nonatomic) IBOutlet UITableView *Gtableviewobj;
- (IBAction)GbackbtnAction:(id)sender;
- (IBAction)ShowGroupDetailBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *showgroupdetailbtnobj;
@property (strong, nonatomic) IBOutlet NSString *sisuchatstr;
@property (strong, nonatomic) IBOutlet UILabel *tapforgroupinfo;
@end
