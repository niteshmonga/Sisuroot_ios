

#import "FirstViewController.h"
#import "LoginViewController.h"
#import "FirstCollectionViewCell.h"

@interface FirstViewController ()
{
    NSArray *Arrayimage;
    NSArray *arraylabel;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"batteryalert"];
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden=YES;
    
    [self.view addSubview:_pagecontrol];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    self.navigationController.navigationBar.hidden=YES;
    Arrayimage=[NSArray arrayWithObjects:@"welcome (4).jpg",@"Thank_you111.jpg",@"get_started (1).jpg",nil];
    //arraylabel=[NSArray arrayWithObjects:@"Search Schools & Colleges because Edubuddy is a right choice",@"Select your Schools and Colleges",@"Apply by one Click on Edubudy And Find Best Result", nil];
    [self.introcollection registerNib:[UINib nibWithNibName:@"FirstCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    
    
}
-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
     self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
 }

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0)
{
    
    _pagecontrol.currentPage = indexPath.row;
    if(indexPath.row == 0)
    {
        [_StartedBtn setTitle:@"WELCOME" forState:UIControlStateNormal];
    }
    else if(indexPath.row == 1)
    {
        [_StartedBtn setTitle:@"THANK YOU" forState:UIControlStateNormal];
    }
    else
    {
        [_StartedBtn setTitle:@"GET STARTED" forState:UIControlStateNormal];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"FirstCollectionViewCell";
    FirstCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundimg.image = [UIImage imageNamed:[Arrayimage objectAtIndex:indexPath.row]];
    //    cell.introlabel.text = [arraylabel objectAtIndex:indexPath.row];
   return cell;
}

- (void)collectionView:(UICollectionView* )collectionView didSelectItemAtIndexPath:(NSIndexPath* )indexPath;
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

- (UIEdgeInsets)collectionView: (UICollectionView *)collectionVieww layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,0,0,0);  // top, left, bottom, right
    
}

- (CGSize)collectionView:(UICollectionView* )collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath* )indexPath
{
    return CGSizeMake(self.introcollection.bounds.size.width, self.introcollection.bounds.size.height-45);
}


- (IBAction)StartedBtn:(id)sender {
         LoginViewController *LVC=[[LoginViewController alloc]init];
         [self.navigationController pushViewController:LVC animated:YES];
    
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

@end

