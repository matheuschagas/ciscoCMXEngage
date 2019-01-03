
#import "RNCiscoCmxEngage.h"
#import <CMXEngageSDK/CMXEngageSDK.h>

@implementation RNCiscoCmxEngage

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE();

+ (instancetype)sharedInstance
{
    static RNCiscoCmxEngage *sharedInstance = nil;
    
    @synchronized(self) {
        if (!sharedInstance) {
            sharedInstance = [[RNCiscoCmxEngage alloc] init];
        }
    }
    
    return sharedInstance;
}

- (UIViewController *)getRootViewController
{
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    return app.window.rootViewController;
}

- (void) cmxEngageDidFinishRegistration:(CMXEngage *)cmxEngage{ // your code
}
- (void)cmxEngageDidFailToRegisterWithError:(NSError *)error{ // your code
}

RCT_EXPORT_METHOD(setup:(NSString *)customerAccessKey CustomerSecretKey:(NSString *)customerSecretKey RegistrationIdFirebase:(NSString *)registrationIdFirebase WifiSsids:(NSArray *)wifiSsids resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [[CMXEngage sharedInstance] registerWithAccessKey:*customerAccessKey secretKey:*customerSecretKey];
    [[CMXEngage sharedInstance] registerDeviceTokenForPushNotification:deviceToken];
}

RCT_EXPORT_METHOD(setFirstName:(NSString *)firstName resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [CMXEngage sharedInstance].deviceSubscriber.firstName = firstName;
        resolve();
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        rejecter(e);
    }
}

RCT_EXPORT_METHOD(setLastName:(NSString *)lastName resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [CMXEngage sharedInstance].deviceSubscriber.lastName = lastName;
        resolve();
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        rejecter(e);
    }
}

RCT_EXPORT_METHOD(setEmail:(NSString *)email resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [CMXEngage sharedInstance].deviceSubscriber.email = email;
        resolve();
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        rejecter(e);
    }
}

RCT_EXPORT_METHOD(setMobileNumber:(NSString *)mobileNumber resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [CMXEngage sharedInstance].deviceSubscriber.mobileNumber = mobileNumber;
        resolve();
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        rejecter(e);
    }
}

RCT_EXPORT_METHOD(setGender:(NSString *)gender resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [CMXEngage sharedInstance].deviceSubscriber.gender = gender;
        resolve();
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        rejecter(e);
    }
}

RCT_EXPORT_METHOD(setUserProp:(NSString *)propName PropValue(BOOL *):propValue resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [[CMXEngage sharedInstance].deviceSubscriber setBool:propValue forKey:propName shared:NO];
        resolve();
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        rejecter(e);
    }
}

RCT_EXPORT_METHOD(getUserProp:(NSString *)propName resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        resolve([[CMXEngage sharedInstance].deviceSubscriber boolForKey:propName shared:NO]);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        rejecter(e);
    }
}

RCT_EXPORT_METHOD(getSubscriberID:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        resolve([[CMXEngage sharedInstance].deviceSubscriber getId]);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        rejecter(e);
    }
}

RCT_EXPORT_METHOD(getCustomer:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        resolve([[CMXEngage sharedInstance].deviceSubscriber customer]);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        rejecter(e);
    }
}

RCT_EXPORT_METHOD(getCountry:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        resolve([[CMXEngage sharedInstance].deviceSubscriber country]);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        rejecter(e);
    }
}

RCT_EXPORT_METHOD(getProperty:(NSString *)prop resolver(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        resolve([[CMXEngage sharedInstance].deviceSubscriber property:prop]);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        rejecter(e);
    }
}

RCT_EXPORT_METHOD(setProperty:(NSString *)prop PropertyValue(NSString *)propValue resolver(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [[CMXEngage sharedInstance].deviceSubscriber setProperty:prop value:propValue];
        resolve();
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        rejecter(e);
    }
}

RCT_EXPORT_METHOD(savePreferencesNow:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [[CMXEngage sharedInstance].deviceSubscriber saveNow];
        resolve();
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        rejecter(e);
    }
}

@end
  
