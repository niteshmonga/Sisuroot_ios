#import <UIKit/UIKit.h>

@interface PaymentViewController : UIViewController
{
    IBOutlet UITextField *nameTF;
    
    IBOutlet UIImageView *cardImg;
    IBOutlet UILabel *namelbl;
    IBOutlet UILabel *priceLbl;
    
    
    IBOutlet UITextField *cardNoTF;
    IBOutlet UITextField *cardNameTF;
    IBOutlet UITextField *cardCVVTF;
    IBOutlet UITextField *cardEXpTF;
    IBOutlet UIImageView *cardProfilePic;
    IBOutlet UILabel *cardprofilenamelbl;
    IBOutlet UIButton *payBtn;
    IBOutlet UIActivityIndicatorView *activItyView;
    IBOutlet UIImageView *profiletypeimg;
    
}
@property(strong,nonatomic) NSDictionary *localCardDict;
@property(strong,nonatomic) NSDictionary *localCardDict1;

@property(strong,nonatomic) NSString *typeString;
@property(strong, nonatomic ) NSDictionary *localDict;


@property(strong, nonatomic ) NSString *amountNo;

 -(IBAction)backAction:(id)sender;

-(IBAction)paymentAction:(id)sender;
- (IBAction)HomeBtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *CheckBtnobj;
- (IBAction)Termsandcondibtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *yearTF;
@property (strong, nonatomic) IBOutlet UIPickerView *exdatepickerviewobj;
- (IBAction)donebtnAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *donebtnobj;
@property (strong, nonatomic) IBOutlet UILabel *pickerlblobj;
@end
