//
//  CMXEngage.h
//  CMXEngageSDK
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "CMXEngageDeviceSubscriber.h"
#import "CMXEngageUserSubscriber.h"
#import <PassKit/PassKit.h>

typedef NS_ENUM(int, CMXENGAGE_LOG_LEVEL){
    CMXENGAGE_LOG_LEVEL_TRACE=1,
    CMXENGAGE_LOG_LEVEL_DEBUG,
    CMXENGAGE_LOG_LEVEL_INFO,
    CMXENGAGE_LOG_LEVEL_WARN,
    CMXENGAGE_LOG_LEVEL_SEVERE
};


@class CMXEngage;

@protocol CMXEngageSDKRegistrationDelegate <NSObject>

- (void)cmxEngageDidFinishRegistration:(CMXEngage *)cmxEngage;
- (void)cmxEngageDidFailToRegisterWithError:(NSError *)error;

@end


@interface CMXEngage : NSObject < CLLocationManagerDelegate >


@property(nonatomic, weak)              id<CMXEngageSDKRegistrationDelegate>      delegate;


@property(readonly, nonatomic, strong)  CMXEngageDeviceSubscriber                 *deviceSubscriber;

/*!
 Set the logLevel property only during debugging. Be sure NOT TO CALL this property in case of AppStore build.
 */
@property(nonatomic, assign)            CMXENGAGE_LOG_LEVEL                       logLevel;

/*!
 The default cache duration is 24 hours. Set the cacheDuration property only if you want to change the default 24 hours.
 */
@property(nonatomic, assign)            NSTimeInterval                      cacheDuration;

@property(nonatomic,strong)             UIImage                             *headerLogoImage;


- (instancetype)init __unavailable;

+ (CMXEngage *)sharedInstance;


- (BOOL)canOpenURL:(NSURL *) url;

- (void)openURL:(NSURL *) url;

- (void)getUserSubscriberWithIdentity:(NSString *)identity ofType:(NSString *)type onCompletion:(void (^)(CMXEngageUserSubscriber *user, NSError *error))completionBlock;

-(void)getMacAddress:(void (^)(NSString *macAddress, NSError *error))completionBlock;

- (void)installWiFiProfile;

- (void)registerWithAccessKey:(NSString *)accessKey secretKey:(NSString *)secretKey;

- (void)registerDeviceTokenForPushNotification:(NSData *)deviceToken;

- (BOOL)handleRemoteNotification:(NSDictionary *)userInfo withAppViewController:(UIViewController *)appViewController;

- (BOOL)handleLocalNotification:(UILocalNotification *)notification;

+ (void)loadAppXFullPageOnController:(UIViewController *)appViewController withTag:(NSString *)tag contextParams:(NSDictionary *)params completion:(void (^)(BOOL success, NSError *error))completion;

+ (void)appXFullPageWithTag:(NSString *)tag contextParams:(NSDictionary *)params completion:(void (^)(UIViewController *appXFullPage, BOOL success, NSError *error))completion;

@end
