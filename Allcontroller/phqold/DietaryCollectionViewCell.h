//
//  DietaryCollectionViewCell.h
//  Sisuroot
//
//  Created by BRIJESH KUMAR on 08/02/19.
//  Copyright © 2019 Epikso Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DietaryCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *Questionlbl;
@property (strong, nonatomic) IBOutlet UILabel *qbacklbl;
@property (strong, nonatomic) IBOutlet UILabel *BSAlbl;
@property (strong, nonatomic) IBOutlet UILabel *contentlbl;
@property (strong, nonatomic) IBOutlet UIButton *Btn1obj;
@property (strong, nonatomic) IBOutlet UIButton *Btn2obj;
@property (strong, nonatomic) IBOutlet UIButton *Btn3obj;
@property (strong, nonatomic) IBOutlet UIButton *Btn4obj;
@property (strong, nonatomic) IBOutlet UIButton *Btn5obj;
@property (strong, nonatomic) IBOutlet UIButton *Btn6obj;

@property (strong, nonatomic) IBOutlet UIButton *skipBtnobj;
@property (strong, nonatomic) IBOutlet UILabel *btn1lbl;
@property (strong, nonatomic) IBOutlet UILabel *btn2lbl;
@property (strong, nonatomic) IBOutlet UILabel *btn3lbl;
@property (strong, nonatomic) IBOutlet UILabel *btn4lbl;
@property (strong, nonatomic) IBOutlet UILabel *btn5lbl;
@property (strong, nonatomic) IBOutlet UILabel *scorelbl;

@property (strong, nonatomic) IBOutlet UILabel *thankulbl;
@property (strong, nonatomic) IBOutlet UIButton *SubmitBtnobj;
@property (strong, nonatomic) IBOutlet UILabel *headerlbl;
@property (strong, nonatomic) IBOutlet UILabel *skipbacklbl;
@property (strong, nonatomic) IBOutlet UIButton *backbtnobj;
@property (strong, nonatomic) IBOutlet UIButton *Homebtnobj;
@end

NS_ASSUME_NONNULL_END
