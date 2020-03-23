
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Message : NSObject

+ (instancetype)messageWithString:(NSString *)message;
+ (instancetype)messageWithString:(NSString *)message image:(UIImage *)image;

- (instancetype)initWithString:(NSString *)message;
- (instancetype)initWithString:(NSString *)message image:(UIImage *)image;

@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) UIImage *avatar;

@end
