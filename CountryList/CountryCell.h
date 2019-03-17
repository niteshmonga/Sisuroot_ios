//
//  CountryCell.h
//  Country List
//
//  Created by Pradyumna Doddala on 21/12/13.
//  Copyright (c) 2013 Pradyumna Doddala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountryCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *countryImage;
@property (strong, nonatomic) IBOutlet UILabel *countryName;
@property (strong, nonatomic) IBOutlet UILabel *countrydialcode;
@property (strong, nonatomic) IBOutlet UIButton *countrubtnobj;

@end
