//
//  BriefstateQ1ViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 03/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BriefstateQ1ViewController : UIViewController
{
    NSMutableArray *selectedIndexArray;
    int selectedIndex;
}
@property (strong, nonatomic) IBOutlet UIView *view_footer2;
@property (strong, nonatomic) IBOutlet UIProgressView *progressview;
@property (strong, nonatomic) IBOutlet UIView *view_footer1;
@property (strong, nonatomic) IBOutlet UIView *tb_footer;
@property (strong, nonatomic) IBOutlet UIButton *btn_home,*btn_chat,*btn_you,*btn_faq;
@property (strong, nonatomic) IBOutlet UIImageView *BACKGROUNDIMG;
- (IBAction)StartedBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UICollectionView *introcollection;
- (IBAction)BackbtnAction1:(id)sender;
@property (strong, nonatomic) IBOutlet UIPageControl *pagecontrol;
@property (strong, nonatomic) IBOutlet UIButton *StartedBtn;
@property (strong, nonatomic) IBOutlet NSString *identifystr,*teststatus;
@property (strong, nonatomic) IBOutlet UIButton *backbtnobj1;

@end
