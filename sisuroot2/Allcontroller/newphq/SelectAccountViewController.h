//
//  SelectAccountViewController.h
//  Root
//
//  Created by Epikso on 12/10/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectAccountViewController : UIViewController
- (IBAction)BackBtnAction:(id)sender;
- (IBAction)HomeBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *offertimelbl;
@property (weak, nonatomic) IBOutlet UILabel *oldpricelbl;
@property (weak, nonatomic) IBOutlet UILabel *offerpricelbl;
- (IBAction)MakepaymentBtnAction:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *standardoffertimelbl;
@property (weak, nonatomic) IBOutlet UILabel *standardoldpricelbl;
@property (weak, nonatomic) IBOutlet UILabel *standardofferpricelbl;
- (IBAction)MakepaymentBtn1Action:(id)sender;

@end
