
# react-native-cisco-cmx-engage

## Getting started

`$ npm install react-native-cisco-cmx-engage --save`

### Mostly automatic installation

`$ react-native link react-native-cisco-cmx-engage`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-cisco-cmx-engage` and add `RNCiscoCmxEngage.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCiscoCmxEngage.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

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
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNCiscoCmxEngage.sln` in `node_modules/react-native-cisco-cmx-engage/windows/RNCiscoCmxEngage.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Cisco.Cmx.Engage.RNCiscoCmxEngage;` to the usings at the top of the file
  - Add `new RNCiscoCmxEngagePackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNCiscoCmxEngage from 'react-native-cisco-cmx-engage';

// TODO: What to do with the module?
RNCiscoCmxEngage;
```
  