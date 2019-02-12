//
//  GalleryCollectionViewCell.m
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 15/09/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import "GalleryCollectionViewCell.h"

@implementation GalleryCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _Galleryimg.layer.cornerRadius=4;
    _Galleryimg.clipsToBounds=YES;
//    _Galleryimg.layer.borderWidth =1;
//    _Galleryimg.layer.borderColor = [UIColor whiteColor].CGColor;
    // Initialization code
}

@end
