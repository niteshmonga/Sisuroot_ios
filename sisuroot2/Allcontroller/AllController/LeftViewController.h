//
//  LeftViewController.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 14/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewController : UIViewController
- (IBAction)profilepicBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Profilepicbtnobj;
@property (strong, nonatomic) IBOutlet UILabel *Usernamelbl;
@property (strong, nonatomic) IBOutlet UILabel *Citylocation;
@property (strong, nonatomic) IBOutlet UILabel *Countryname;
@property (strong, nonatomic) IBOutlet UITableView *profilelisttableview;
@property (strong, nonatomic) IBOutlet UIImageView *logoutimg;
- (IBAction)LogoutBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *LogoutBtnobj;
@property (strong, nonatomic) IBOutlet UIImageView *profilepicimg;
@property (strong, nonatomic) IBOutlet NSDictionary *detail;

@end
