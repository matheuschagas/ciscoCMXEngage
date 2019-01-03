
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
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;

    return rootViewController;
}

- (void) cmxEngageDidFinishRegistration:(CMXEngage *)cmxEngage{ // your code
}
- (void)cmxEngageDidFailToRegisterWithError:(NSError *)error{ // your code
}

RCT_EXPORT_METHOD(setup:(NSString *)customerAccessKey CustomerSecretKey:(NSString *)customerSecretKey RegistrationIdFirebase:(NSString *)deviceToken WifiSsids:(NSArray *)wifiSsids resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [[CMXEngage sharedInstance] registerWithAccessKey:customerAccessKey secretKey:customerSecretKey];
    [[CMXEngage sharedInstance] registerDeviceTokenForPushNotification:deviceToken];
}

RCT_EXPORT_METHOD(setFirstName:(NSString *)firstName resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [CMXEngage sharedInstance].deviceSubscriber.firstName = firstName;
        resolve(nil);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        reject(@"setFirstName", @"exception", e);
    }
}

RCT_EXPORT_METHOD(setLastName:(NSString *)lastName resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [CMXEngage sharedInstance].deviceSubscriber.lastName = lastName;
        resolve(nil);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        reject(@"setLastName", @"exception", e);
    }
}

RCT_EXPORT_METHOD(setEmail:(NSString *)email resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [CMXEngage sharedInstance].deviceSubscriber.email = email;
        resolve(nil);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        reject(@"setEmail", @"exception", e);
    }
}

RCT_EXPORT_METHOD(setMobileNumber:(NSString *)mobileNumber resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [CMXEngage sharedInstance].deviceSubscriber.mobileNumber = mobileNumber;
        resolve(nil);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        reject(@"setMobileNumber", @"exception", e);
    }
}

RCT_EXPORT_METHOD(setGender:(NSString *)gender resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [CMXEngage sharedInstance].deviceSubscriber.gender = gender;
        resolve(nil);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        reject(@"setGender", @"exception", e);
    }
}

RCT_EXPORT_METHOD(setUserProp:(NSString *)propName PropValue:(BOOL *)propValue resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [[CMXEngage sharedInstance].deviceSubscriber setBool:propValue forKey:propName shared:NO];
        resolve(nil);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        reject(@"setUserProp", @"exception", e);
    }
}

RCT_EXPORT_METHOD(getUserProp:(NSString *)propName resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        BOOL authorized = [[CMXEngage sharedInstance].deviceSubscriber boolForKey:propName shared:NO];
        NSDictionary *auth = @{@"authorized" : [NSNumber numberWithBool:authorized]};
        resolve(auth);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        reject(@"getUserProp", @"exception", e);
    }
}

RCT_EXPORT_METHOD(getSubscriberID:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        resolve([[CMXEngage sharedInstance].deviceSubscriber getId]);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        reject(@"getSubscriberID", @"exception", e);
    }
}

RCT_EXPORT_METHOD(getCustomer:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        resolve([[CMXEngage sharedInstance].deviceSubscriber customer]);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        reject(@"getCustomer", @"exception", e);
    }
}

RCT_EXPORT_METHOD(getCountry:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        resolve([[CMXEngage sharedInstance].deviceSubscriber country]);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        reject(@"getCountry", @"exception", e);
    }
}

RCT_EXPORT_METHOD(getProperty:(NSString *)prop resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        resolve([[CMXEngage sharedInstance].deviceSubscriber property:prop]);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        reject(@"getProperty", @"exception", e);
    }
}

RCT_EXPORT_METHOD(setProperty:(NSString *)prop PropertyValue:(NSString *)propValue resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [[CMXEngage sharedInstance].deviceSubscriber setProperty:prop value:propValue];
        resolve(nil);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        reject(@"setProperty", @"exception", e);
    }
}

RCT_EXPORT_METHOD(savePreferencesNow:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
    @try {
        [[CMXEngage sharedInstance].deviceSubscriber saveNow];
        resolve(nil);
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        reject(@"savePreferencesNow", @"exception", e);
    }
}

@end
  
