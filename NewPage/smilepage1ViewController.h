
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVKit/AVKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface smilepage1ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate,UITextViewDelegate,UIImagePickerControllerDelegate>
{
    UITapGestureRecognizer *tapper;
    NSString *base64_encoded_image;
    NSString *imageNameStr;
}
@property (strong, nonatomic) IBOutlet UIView *view_footer1;
@property (strong, nonatomic) IBOutlet UIView *tb_footer;

@property (strong, nonatomic) IBOutlet UIView *view_footer2;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollview_obj;
//@property (strong, nonatomic) MPMoviePlayerController *videoController;
@property (strong, nonatomic) IBOutlet UIView *view_search;
@property (strong, nonatomic) IBOutlet NSArray *jsonarray;
@property (nonatomic,strong)NSMutableArray *arr_ques,*arr_ques1,*_arr_ques1video,*arr_ans,*arr_ans_video,*arr_ques_id,*arr_search;
@property (strong, nonatomic) AVPlayerViewController *playerViewController;
- (IBAction)actionPlayVideo:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *VIEW_MAIN31;
@property (strong, nonatomic) IBOutlet UIWebView *videoView;
@property (strong, nonatomic) IBOutlet UITextView *txtview_write_ans;
@property (strong, nonatomic) IBOutlet UIButton *btn_checkbox,*btn_checkbox1;
//@property (strong, nonatomic) IBOutlet UIImageView *img_checkbox,*img_checkbox1;
@property (strong, nonatomic) IBOutlet UIImageView *novideo;
@property (strong, nonatomic) IBOutlet UIView *view_video_cap;
@property (strong, nonatomic) IBOutlet UIView *view3_header;
@property (strong, nonatomic) IBOutlet UIView *view_write_n_ans;
@property (strong, nonatomic) IBOutlet UIButton *btn_video;
@property (strong, nonatomic) IBOutlet UIButton *btn_comment;
@property (strong, nonatomic) IBOutlet UIView *video_cap;
@property (strong, nonatomic) IBOutlet UIButton *btn_save;
@property (strong, nonatomic) IBOutlet UIButton *btn_write_answer;
@property (strong, nonatomic) IBOutlet UIButton *btn_back_add_frind;
@property (strong, nonatomic) IBOutlet UIView *view_main3;
@property (strong, nonatomic) IBOutlet UIButton *btn_add_friend;
@property (strong, nonatomic) IBOutlet UILabel *lbl_name;
@property (strong, nonatomic) IBOutlet UIImageView *img_profile1;
@property (strong, nonatomic) IBOutlet UIView *view_main1;
@property (strong, nonatomic) IBOutlet UIButton *chatbtnobj;
@property (strong, nonatomic) IBOutlet UILabel *chatnotification;
@property (strong, nonatomic) IBOutlet UILabel *btn_name;
@property (strong, nonatomic) IBOutlet NSString *str_click,*str_video,*sel_quesid,*str_add_question,*str_sel_ques_text,*str_text_ans;
@property (strong, nonatomic) NSURL *videoURL;
//@property (strong, nonatomic) MPMoviePlayerController *player;
@property (strong, nonatomic) IBOutlet NSString *countlblstr;
@property (strong, nonatomic) IBOutlet UIButton *btn_back;
@property (strong, nonatomic) IBOutlet UIButton *btn_sos;
@property (strong, nonatomic) IBOutlet UIButton *btn_noti;
@property (strong, nonatomic) IBOutlet UIButton *btn_profile;
@property (strong, nonatomic) IBOutlet UIImageView *img_profile;
@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;
@property (strong, nonatomic) IBOutlet UIButton *btn_add;
@property (strong, nonatomic) IBOutlet UIView *view_ques;
@property (strong, nonatomic) IBOutlet UILabel *lbl_question;
@property (strong, nonatomic) IBOutlet UIView *view_ans;
@property (strong, nonatomic) IBOutlet UIButton *btn_prev,*btn_prev1,*btn_next1;
@property (strong, nonatomic) IBOutlet UILabel *lbl_ans;
@property (strong, nonatomic) IBOutlet UIButton *btn_next;

@property (strong, nonatomic) IBOutlet UIView *view_name;
@property (strong, nonatomic) IBOutlet UIView *view_add_ques;
@property (strong, nonatomic) IBOutlet UITextView *txt_question;
@property (strong, nonatomic) IBOutlet UIButton *btn_save_question;

@property (strong, nonatomic) IBOutlet UIButton *btn_fav;
@property (strong, nonatomic) IBOutlet UILabel *lbl_like;
@property (strong, nonatomic) IBOutlet UIView *view_video_ques;
@property (strong, nonatomic) IBOutlet UILabel *lbl_video_ques;
@property (strong, nonatomic) IBOutlet UIButton *btn_video_fav;
@property (strong, nonatomic) IBOutlet UILabel *lbl_video_like;
@property (strong, nonatomic) IBOutlet UIView *view_video;
@end
NS_ASSUME_NONNULL_END
