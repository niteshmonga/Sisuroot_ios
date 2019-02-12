//
//  MessageChatTableViewCell.h
//  Kenbie
//
//  Created by Ashwani Rajput on 8/5/17.
//  Copyright © 2017 Gomes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageChatTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *messageTextLabel;
@property (strong, nonatomic) IBOutlet UIView *chatBubbleView;
@property (strong, nonatomic) IBOutlet UILabel *messageTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *messageStatusLabel;
@property (strong, nonatomic) IBOutlet UIImageView *messageTickImageView;


@end
