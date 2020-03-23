//
//  SelectTagViewController.h
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 20/09/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SelectTagViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

    {
        NSMutableArray *visibleRows;
        NSMutableArray *cellInfo;

        IBOutlet UITableView *tblSimpleTable;
        IBOutlet UIButton *btn;
        IBOutlet UIImageView *i;
        BOOL flag;
        NSArray *arryData;
    }
@property(nonatomic,retain)IBOutlet UITableView *tblSimpleTable;
@property(nonatomic,retain)IBOutlet UIButton *btn;
@property(nonatomic,retain)IBOutlet UIImageView *i;

-(IBAction)btnClicked;
- (IBAction)Backbtn:(id)sender;

@end
