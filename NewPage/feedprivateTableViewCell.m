

#import "feedprivateTableViewCell.h"
#import "feedCollectionViewCell.h"
#import "FeedTagViewController.h"
#import "UIImageView+WebCache.h"
@implementation feedprivateTableViewCell
{
    NSArray *imgdata;
    NSArray *imgdata1;
    NSArray *imgdata2;
    int tagindex;
}
- (void)awakeFromNib {
     [_collect_private registerNib:[UINib nibWithNibName:@"feedCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
  
   [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setCollectionData:(NSMutableArray *)collectionData:(NSMutableArray *)collectionData1:(NSMutableArray *)collectionData2:(int *)tag
{
    tagindex = tag;
        imgdata = [[NSMutableArray alloc]init];
        imgdata1 = [[NSMutableArray alloc]init];
        imgdata2 = [[NSMutableArray alloc]init];
                  
           imgdata = collectionData;
           imgdata1 = collectionData1;
          imgdata2 = collectionData2;
          _collect_private.delegate=self;
                 _collect_private.dataSource=self;
                 [_collect_private reloadData];
   
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
     if(tagindex==0)
      {
          return imgdata.count;
      }
      else  if(tagindex==1)
         {
            return imgdata1.count;
         }
      else  
      {
          return imgdata2.count;
      }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
           return CGSizeMake(146, 200);
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *identifier = @"FirstCollectionViewCell";
   feedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if(tagindex==0)
    {
        cell.taglabel.text=[[imgdata objectAtIndex:indexPath.row] valueForKey:@"username"];
        [cell.tagimage setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"tag_photo/",[[imgdata objectAtIndex:indexPath.row] valueForKey:@"tagImg"]] placeholderImage:nil];
    }
    else  if(tagindex==1)
       {
           cell.taglabel.text=[[imgdata1 objectAtIndex:indexPath.row] valueForKey:@"username"];
           [cell.tagimage setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"tag_photo/",[[imgdata1 objectAtIndex:indexPath.row] valueForKey:@"tagImg"]] placeholderImage:nil];
       }
    else  if(tagindex==2)
    {
        cell.taglabel.text=[[imgdata2 objectAtIndex:indexPath.row] valueForKey:@"username"];
        [cell.tagimage setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"tag_photo/",[[imgdata2 objectAtIndex:indexPath.row] valueForKey:@"tagImg"]] placeholderImage:nil];
    }

    cell.tagimage.contentMode=UIViewContentModeScaleToFill;
    cell.tagimage.layer.cornerRadius= 10;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

// Layout: Set Edges
- (UIEdgeInsets)collectionView: (UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section

{
    
    return UIEdgeInsetsMake(0,0,0,0);  // top, left, bottom, right
    
}
@end
