//
//  FirstViewController.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 12/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *BACKGROUNDIMG;
- (IBAction)StartedBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UICollectionView *introcollection;
@property (strong, nonatomic) IBOutlet UIPageControl *pagecontrol;
@property (strong, nonatomic) IBOutlet UIButton *StartedBtn;

@end
