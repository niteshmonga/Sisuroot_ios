//
//  BriefstateViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 02/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BriefstateViewController : UIViewController
{
    NSMutableArray *selectedIndexArray;
    int selectedIndex;
    UITextView *privateTextView;

}
@property (strong, nonatomic) IBOutlet UIImageView *BACKGROUNDIMG;
- (IBAction)StartedBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UICollectionView *introcollection;
- (IBAction)BackbtnAction1:(id)sender;
@property (strong, nonatomic) IBOutlet UIPageControl *pagecontrol;
@property (strong, nonatomic) IBOutlet UIButton *StartedBtn;
@property (strong, nonatomic) IBOutlet UIButton *backbtnobj1;

@property (strong, nonatomic) IBOutlet NSString *identifystr,*teststatus;
- (IBAction)GbackBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Gobackbtnobj;
@property (strong, nonatomic) IBOutlet UIView *alertviewobj;
@property (strong, nonatomic) IBOutlet UITextView *msgtextView;
- (IBAction)DoneBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *doneobj;


@end
