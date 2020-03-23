//
//  SettingTableViewCell.h
//  Root_App
//
//  Created by BRIJESH KUMAR on 25/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewCell : UITableViewCell
{
    IBOutlet UISwitch *switchobj;
}
@property (strong, nonatomic) IBOutlet UILabel *listlblobj;
@property (strong, nonatomic) IBOutlet UILabel *backlblobj;
@property (strong, nonatomic) IBOutlet UISwitch *switchobj;

@end
