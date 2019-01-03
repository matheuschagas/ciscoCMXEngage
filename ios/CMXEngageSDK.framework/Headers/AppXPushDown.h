//
//  AppXPushDown.h
//  CMXEngageSDK
//
//

#import "AppXView.h"

@interface AppXPushDown : AppXView
- (instancetype)initWithFrame:(CGRect)frame tag:(NSString *)aTag controller:(UIViewController *)theAppViewController delegate:(id)aDelegate;
- (instancetype)initWithFrame:(CGRect)frame tag:(NSString *)aTag contextParams:(NSDictionary *)params controller:(UIViewController *)theAppViewController delegate:(id)aDelegate;
- (void)refresh:(BOOL)ignoreCache;
@end


@protocol AppXPushDownDelegate <NSObject>
@optional
- (void)appXPushDownDidChangeLayout:(AppXPushDown *)appXPushDown;
- (void)appXPushDownDidFailToLoad:(AppXPushDown *)appXPushDown withError:(NSError *)error;
- (void)appXPushDownDidFinishLoad:(AppXPushDown *)appXPushDown;
@end
