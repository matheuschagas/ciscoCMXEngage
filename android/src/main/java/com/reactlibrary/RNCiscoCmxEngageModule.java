
package com.reactlibrary;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReadableArray;
import com.july.cmxengage.CMXEngage;

public class RNCiscoCmxEngageModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;
    private Callback onMacLookupResult;

    public RNCiscoCmxEngageModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @ReactMethod
    public void setup(String customerAccessKey, String customerSecretKey, String registrationIdFirebase, ReadableArray wifiSsids, Promise promise) {
        try {
            CMXEngage.enableLogs = true;
            CMXEngage.register(reactContext, customerAccessKey, customerSecretKey);
            CMXEngage.registerRegistrationID(registrationIdFirebase);
            CMXEngage.installWiFiProfile(true);
            for (String ssid: wifiSsids) {
                CMXEngage.autoConnect(ssid);
            }
            promise.resolve(true);
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void setFirstName(String firstName, Promise promise) {
        try {
            CMXEngage.getDeviceSubscriber().setFirstName(firstName);
            promise.resolve(true);
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void setLastName(String lastName, Promise promise) {
        try {
            CMXEngage.getDeviceSubscriber().setLastName(lastName);
            promise.resolve(true);
        } catch (Exception e) {
            promise.reject(e);
        }
    }
    @ReactMethod
    public void setEmail(String email, Promise promise) {
        try {
            CMXEngage.getDeviceSubscriber().setEmail(email);
            promise.resolve(true);
        } catch (Exception e) {
            promise.reject(e);
        }
    }
    @ReactMethod
    public void setMobileNumber(String mobileNumber, Promise promise) {
        try {
            CMXEngage.getDeviceSubscriber().setMobileNumber(mobileNumber);
            promise.resolve(true);
        } catch (Exception e) {
            promise.reject(e);
        }
    }
    @ReactMethod
    public void setGender(String gender, Promise promise) {
        try {
            CMXEngage.getDeviceSubscriber().setGender(gender);
            promise.resolve(true);
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void setUserProp(String propName, boolean propValue, Promise promise) {
        try {
            CMXEngage.getDeviceSubscriber().setString(propName,propValue,true);
            promise.resolve(true);
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void getUserProp(String propName, Promise promise) {
        try {
            promise.resolve(CMXEngage.getDeviceSubscriber().stringForKey(propName,true));
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void getSubscriberID(Promise promise) {
        try {
            promise.resolve(CMXEngage.getDeviceSubscriber().getId());
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void getCustomer(Promise promise) {
        try {
            promise.resolve(CMXEngage.getDeviceSubscriber().getCustomer());
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void getCountry(Promise promise) {
        try {
            promise.resolve(CMXEngage.getDeviceSubscriber().getCountry());
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void getProperty(String property, Promise promise) {
        try {
            promise.resolve(CMXEngage.getDeviceSubscriber().getProperty(property));
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void setProperty(String property, String propertyValue, Promise promise) {
        try {
            CMXEngage.getDeviceSubscriber().setProperty(property, propertyValue);
            promise.resolve(true);
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void savePreferencesNow(Promise promise) {
        try {
            CMXEngage.getDeviceSubscriber().saveNow();
            promise.resolve();
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @Override
    public String getName() {
        return "RNCiscoCmxEngage";
    }
}