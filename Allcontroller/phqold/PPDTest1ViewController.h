
#import <UIKit/UIKit.h>

@interface PPDTest1ViewController : UIViewController
{
    NSMutableArray *selectedIndexArray;
    int selectedIndex;
}
@property (strong, nonatomic) IBOutlet UIImageView *BACKGROUNDIMG;
- (IBAction)StartedBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UICollectionView *introcollection;
- (IBAction)BackbtnAction1:(id)sender;
@property (strong, nonatomic) IBOutlet UIPageControl *pagecontrol;
@property (strong, nonatomic) IBOutlet UIButton *StartedBtn;
@property (strong, nonatomic) IBOutlet UIButton *backbtnobj1;

@property (strong, nonatomic) IBOutlet NSString *identifystr;
- (IBAction)GbackBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Gobackbtnobj;
@end
