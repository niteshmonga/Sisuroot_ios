//
//  PercievedViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 03/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PercievedViewController : UIViewController
{
    NSMutableArray *selectedIndexArray;
    int selectedIndex;
}
@property (strong, nonatomic) IBOutlet UIImageView *BACKGROUNDIMG;
- (IBAction)StartedBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UICollectionView *introcollection;
- (IBAction)BackbtnAction1:(id)sender;
@property (strong, nonatomic) IBOutlet UIPageControl *pagecontrol;
@property (strong, nonatomic) IBOutlet UIButton *StartedBtn;
@property (strong, nonatomic) IBOutlet NSString *identifystr;
@property (strong, nonatomic) IBOutlet UILabel *thankulbl;
- (IBAction)SubmitbtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *SubmitBtnobj;
@property (strong, nonatomic) IBOutlet UIButton *backbtnobj1;

@end
