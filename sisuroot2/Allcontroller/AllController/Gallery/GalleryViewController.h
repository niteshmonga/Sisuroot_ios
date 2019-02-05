//
//  GalleryViewController.h
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 15/09/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryViewController : UIViewController
{
    IBOutlet UIActivityIndicatorView *activityIden;
    IBOutlet UIView *barView;
    NSString *base64_encoded_image;
    NSString *imageNameStr;
    IBOutlet UILabel *chatnotification;

}
- (IBAction)BackBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *Gallerystmtlblobj;
@property (strong, nonatomic) IBOutlet UICollectionView *GalleryCollectionViewobj;
@property (strong, nonatomic) IBOutlet UIImageView *Backgroundimg;

@property (strong, nonatomic) IBOutlet UIButton *TagBtnActionobj;
@property (strong, nonatomic) IBOutlet UIButton *friendbtnobj;
@property (strong, nonatomic) IBOutlet UIButton *feedbtnobj;
@property (strong, nonatomic) IBOutlet UIButton *gallerybtnobj;
- (IBAction)ProfileBtnAction:(id)sender;

- (IBAction)FeedBtnAction:(id)sender;
- (IBAction)FriendsBtnAction:(id)sender;
- (IBAction)GalleryBtnAction:(id)sender;
- (IBAction)TagBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *profileiconimg;
- (IBAction)profileiconBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Chatbtnobj;
@property (strong, nonatomic) IBOutlet UIButton *Sosbtnobj;
- (IBAction)SosBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *profileBtnobj1;
@end
