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

@property (strong, nonatomic) IBOutlet UITableView *ShareTableviewobj;
@property (strong, nonatomic) IBOutlet NSString *str1;
@property (strong, nonatomic) IBOutlet NSString *str2;
@property (strong, nonatomic) IBOutlet NSString *str4;

- (IBAction)PostBtn:(id)sender;

@end
