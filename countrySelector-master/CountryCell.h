//
//  CountryCell.h
//  Created by Venu Pendota on 10/12/17.
//

#import <UIKit/UIKit.h>

@interface CountryCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *countryImage;
@property (strong, nonatomic) IBOutlet UILabel *countryName;
@property (strong, nonatomic) IBOutlet UILabel *countrydialcode;
@property (strong, nonatomic) IBOutlet UIButton *countrubtnobj;

@end
