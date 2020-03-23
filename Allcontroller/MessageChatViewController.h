//
//  MessageChatViewController.h
//  Kenbie
//
//  Created by Ashwani Rajputon 8/4/17.
//  Copyright © 2017 Gomes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageChatTableViewCell.h"
#import "MyWebserviceManager.h"

@interface MessageChatViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIDocumentPickerDelegate>{
    MessageChatTableViewCell *messageChatTableViewCell;
}

@property (strong, nonatomic) IBOutlet UITableView *chatTableView;
@property (strong, nonatomic) NSString *serviceType;
@property (strong, nonatomic) NSString *recieverUserID;
@property (strong, nonatomic) NSString *userNameString;
@property (strong, nonatomic) NSString *userPicImageString;
@property (strong, nonatomic) NSString *lastTimeString;

@property (strong, nonatomic) IBOutlet UIButton *sendMessageButton;
@property (strong, nonatomic) IBOutlet UIButton *attachButton;

- (IBAction)sendMessageButtonAction:(id)sender;
- (IBAction)attachButtonAction:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *messageTextField;

@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userImageView;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
- (IBAction)backButtonAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *enterMessageView;
@property (strong, nonatomic) UIImage *pickedImage;

@property (nonatomic, strong) NSTimer *timer;
//@property(strong,nonatomic) NSArray *responseArray;
@property (strong, nonatomic) NSString *complaintId;
@property (strong, nonatomic) NSArray *messageListArray;

@end
