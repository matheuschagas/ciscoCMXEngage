//
//  AppXOverlay.h
//  CMXEngageSDK
//
//

#import <UIKit/UIKit.h>

@interface AppXOverlay : UIView
@property (nonatomic, weak) id        delegate;
@property (nonatomic, strong) UIImage   *closeButtonImage;

- (instancetype)initWithFrame:(CGRect)frame tag:(NSString *)aTag controller:(UIViewController *)theAppViewController;
- (instancetype)initWithFrame:(CGRect)frame tag:(NSString *)aTag contextParams:(NSDictionary *)params controller:(UIViewController *) theAppViewController;
- (instancetype)initWithFrame:(CGRect)frame tag:(NSString *)aTag controller:(UIViewController *)theAppViewController showAlways:(BOOL)isAlways;
- (instancetype)initWithFrame:(CGRect)frame tag:(NSString *)aTag contextParams:(NSDictionary *)params controller:(UIViewController *)theAppViewController showAlways:(BOOL)isAlways;
- (void)show;
@end


@protocol AppXOverlayDelegate <NSObject>
@optional
- (void)didShowAppXOverlay;
- (void)didCloseAppXOverlay;
@end
