//
//  CountryCell.m
//  Country List
//
//  Created by Pradyumna Doddala on 21/12/13.
//  Copyright (c) 2013 Pradyumna Doddala. All rights reserved.
//

#import "CountryCell.h"

@implementation CountryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.countryImage.layer.masksToBounds = YES;
    self.countryImage.layer.cornerRadius = self.countryImage.frame.size.height / 2;
    
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    if (selected) {
        self.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

@end
