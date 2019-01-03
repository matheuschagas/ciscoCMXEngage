//
//  AppXView.h
//  CMXEngageSDK
//
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface AppXView : UIView <CLLocationManagerDelegate, CBCentralManagerDelegate>

@property(nonatomic, weak) id delegate;

- (instancetype)initWithFrame:(CGRect)frame tag:(NSString *)aTag controller:(UIViewController *)theAppViewController delegate:(id)aDelegate;
- (instancetype)initWithFrame:(CGRect)frame tag:(NSString *)aTag contextParams:(NSDictionary *)params controller:(UIViewController *)theAppViewController delegate:(id)aDelegate;
- (void)refresh:(BOOL)ignoreCache;

@end


@protocol AppXViewDelegate <NSObject>
@optional
- (void)appXViewDidFailToLoad:(AppXView *)appXView withError:(NSError *)error;
- (void)appXViewDidFinishLoad:(AppXView *)appXView;
- (void)appXViewDidChangeLayout:(AppXView *)appXView;
- (void)didReceiveCustomView:(NSString *)viewName withJsonData:(NSDictionary *)customViewDict;
- (void)didReceiveCustomView:(NSString *)viewName withInfo:(NSString *)viewNodeValue;
@end
