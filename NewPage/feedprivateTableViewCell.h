
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface feedprivateTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
 NSArray *detailArray;
    
}
@property (strong, nonatomic) IBOutlet UICollectionView *collect_private;
 @property(nonatomic,retain)NSArray *detailArray;
- (void)setCollectionData:(NSMutableArray *)collectionData:(NSMutableArray *)collectionData1:(NSMutableArray *)collectionData2:(int *)tag;

@end

NS_ASSUME_NONNULL_END
