//
//  CMXEngageSDKUserSubscriber.h
// CMXEngageSDK
//


@interface CMXEngageUserSubscriber : NSObject

@property(nonatomic, strong) NSString *firstName;
@property(nonatomic, strong) NSString *lastName;
@property(nonatomic, strong) NSString *email;
@property(nonatomic, strong) NSString *mobileNumber;
@property(nonatomic, strong) NSString *gender;

- (instancetype)init __unavailable;

- (void)setObject:(id)value forKey:(NSString *)preferenceName shared:(BOOL)shared;

/*!
 -objectForKey: Returns the value associated with the preferenceName as NSObject.
 Passing YES to the parameter "shared" returns Shared Preferences, NO returns App Preference.
 
 */
- (id)objectForKey:(NSString *)preferenceName shared:(BOOL)shared;

- (void)setBool:(BOOL)value forKey:(NSString *)preferenceName shared:(BOOL)shared;

/*!
 -boolForKey:shared: Returns the BOOL value of the preferenceName. If the value is an NSNumber, NO will be returned if the value is 0, YES otherwise. If the value is an NSString, values of "YES" or "1" will return YES, and values of "NO", "0", or any other string will return NO. If the value is absent or can't be converted to a BOOL, NO will be returned.
 Passing YES to the parameter "shared" returns Shared Preferences, NO returns App Preference.
 
 */
- (BOOL)boolForKey:(NSString *)preferenceName shared:(BOOL)shared;

- (void)setInteger:(NSInteger)value forKey:(NSString *)preferenceName shared:(BOOL)shared;

/*!
 -integerForKey: is equivalent to -objectForKey:, except that it converts the returned value to an NSInteger. If the value is an NSNumber, the result of -integerValue will be returned. If the value is an NSString, it will be converted to NSInteger if possible. If the value is a boolean, it will be converted to either 1 for YES or 0 for NO. If the value is absent or can't be converted to an integer, 0 will be returned.
 Passing YES to the parameter "shared" returns Shared Preferences, NO returns App Preference.
 
 */
- (NSInteger)integerForKey:(NSString *)preferenceName shared:(BOOL)shared;

- (void)setFloat:(float)value forKey:(NSString *)preferenceName shared:(BOOL)shared;

/*!
 -floatForKey: is similar to -integerForKey:, except that it returns a float.
 Passing YES to the parameter "shared" returns Shared Preferences, NO returns App Preference.
 
 */
- (float)floatForKey:(NSString *)preferenceName shared:(BOOL)shared;

- (void)setDouble:(double)value forKey:(NSString *)preferenceName shared:(BOOL)shared;

/*!
 -doubleForKey: is similar to -integerForKey:, except that it returns a double.
 Passing YES to the parameter "shared" returns Shared Preferences, NO returns App Preference.
 
 */
- (double)doubleForKey:(NSString *)preferenceName shared:(BOOL)shared;

- (void)setString:(NSString *)value forKey:(NSString *)preferenceName shared:(BOOL)shared;

/*!
 -stringForKey: is equivalent to -objectForKey:, except that it will convert NSNumber and NSDate values to their NSString representation. If a non-string non-number value is found, nil will be returned.
 Passing YES to the parameter "shared" returns Shared Preferences, NO returns App Preference.
 
 */
- (NSString *)stringForKey:(NSString *)preferenceName shared:(BOOL)shared;

- (void)setArray:(NSArray<NSString *> *)value forKey:(NSString *)preferenceName shared:(BOOL)shared;

/*!
 -arrayForKey:shared: Returns the NSArray value associated with the preferenceName. If the value is absent or not NSArray, nil will be returned.
 Passing YES to the parameter "shared" returns Shared Preferences, NO returns App Preference.
 
 */
- (NSArray<NSString *> *)arrayForKey:(NSString *)preferenceName shared:(BOOL)shared;

- (void)setDate:(NSDate *)value forKey:(NSString *)preferenceName shared:(BOOL)shared;

/*!
 -dateForKey:shared: Returns the NSDate value associated with the preferenceName. If the value is absent or not NSDate, nil will be returned.
 Passing YES to the parameter "shared" returns Shared Preferences, NO returns App Preference.
 
 */
- (NSDate *)dateForKey:(NSString *)preferenceName shared:(BOOL)shared;

- (void)removeObjectForKey:(NSString *)preferenceName shared:(BOOL)shared;


- (void)saveNow;

/*
 getId will return the subcriber Id
 */
- (NSString *)getId;
/*
 customer will return the customer Name for associated with the account
 */
- (NSString *)customer ;
/*
 get Country Name  for the account stored in the device subcriber
 */
- (NSString *)country;
/*
 set Country Name for the account stored in the device subcriber
 */
- (void)setCountry:(NSString *) country;
/*
 get lastModifiedDate value  for the account stored in the device subcriber
 */
-(NSDate*)lastModifiedDate;
/*
 get created by service for the account stored in the device subcriber
 */
-(NSString *)createdBy;
/*
 get last Modified  by Service Name for the account stored in the device subcriber
 */
-(NSString *)lastModifiedBy;
/*
 get value for service Name for the account stored in the device subcriber
 */
-(NSObject *) property:(NSString *) name;
- (void)removeProperty:(NSString *)name;
- (void)removeProperty:(NSString *)name value:(NSObject *) value;
-(void)setProperty:(NSString *)name value:(NSObject *) value;
-(void)addProperty:(NSString *)name value:(NSObject *)value ;

@end

