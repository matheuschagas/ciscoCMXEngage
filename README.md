
# react-native-cisco-cmx-engage

## Getting started

`$ npm i react-native-cisco-cmx-engage --save`

Or use Yarn

`$ yarn add react-native-cisco-cmx-engage`

### Installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-cisco-cmx-engage` and add `RNCiscoCmxEngage.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCiscoCmxEngage.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Drag and drop the CMX Engage SDK (CMXEngageSDK.framework file) from `node_modules/react-native-cisco-cmx-engage/ios` into the project in the Project navigator
5. On the “Choose Options for adding these files” screen that appears, confirm that the target project is checked, and click Finish.
6. The SDK is added to the target project you have selected. Proceed to open the Build Settings of the project.
7. In the Build Settings window that appears, look for the `Header Search Paths` property, and add
   `/usr/include/libxml2` as the value.
8. In the Build Settings window, look for the `Other Linker Flags` property, and add `-lxml2` and `-ObjC` as values.
9. Under target, in the General settings window, add CMXEngageSDK.framework to the `Embedded Binaries`
   section.
10. CMXEngage SDK uses WIFI Information for the registration. Please enable `Wireless Accessory Configuration` on Capabilities for the app from iOS SDK version 12.0.This feature needs to be enabled in App Id and property should be added to entitlement file of the app
11. The `NSLocationAlwaysUsageDescription` and `NSLocationWhenInUseUsageDescription` property needs a valid value.
12. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNCiscoCmxEngagePackage;` to the imports at the top of the file
  - Add `new RNCiscoCmxEngagePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-cisco-cmx-engage'
    project(':react-native-cisco-cmx-engage').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-cisco-cmx-engage/android')
    include ':cmxengagesdk'
    project(':cmxengagesdk').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-cisco-cmx-engage/android/cmxengagesdk')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-cisco-cmx-engage')
      implementation 'com.google.firebase:firebase-core:16.0.1'
      implementation "com.android.support:appcompat-v7:${rootProject.ext.supportLibVersion}"
  	```
4. Insert the following lines at the bottom in `android/app/build.gradle`:
    ```
    apply plugin: 'com.google.gms.google-services'
    ```
5. Insert the following lines in `android/build.gradle`
    ```
    buildscript {
        ext {
            ...
            supportLibVersion = "27.1.1"
            googlePlayServicesVersion   = "15.0.1"
        }
        ...
        dependencies {
            ...
            classpath 'com.google.gms:google-services:4.2.0'
        }
    }
    
    allprojects {
        repositories {
            ...
            configurations.all {
                resolutionStrategy {
                    force "com.google.android.gms:play-services-basement:$googlePlayServicesVersion"
                    force "com.google.android.gms:play-services-tasks:$googlePlayServicesVersion"
                    force "com.google.firebase:firebase-analytics:16.0.1"
                }
            }
        }
    }
    ```

## Usage
```javascript
import RNCiscoCmxEngage from 'react-native-cisco-cmx-engage';

// TODO: What to do with the module?
RNCiscoCmxEngage;
```
  