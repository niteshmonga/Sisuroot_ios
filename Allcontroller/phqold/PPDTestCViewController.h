//
//  PPDTestCViewController.h
//  Root
//
//  Created by BRIJESH KUMAR on 03/09/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPDTestCViewController : UIViewController
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
@property (strong, nonatomic) IBOutlet UIButton *backbtnobj1;

@property (strong, nonatomic) IBOutlet NSString *identifystr;
- (IBAction)GbackBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Gobackbtnobj;
@end
