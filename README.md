# Flutter-platfrom-aware-other-widgits

this repo is example to add platfrom aware widgits in ur app fast easy and customisable way 
android ios date time and datetime picker
android radio group and Ios segmented control

<img src="https://github.com/shock-wave007/Flutter-platfrom-aware-other-widgits/blob/master/images/Screenshot_1594114161.png" width="300" /> <img src="https://github.com/shock-wave007/Flutter-platfrom-aware-other-widgits/blob/master/images/Screenshot_1594115485.png" width="300" />
<img src="https://github.com/shock-wave007/Flutter-platfrom-aware-other-widgits/blob/master/images/Screenshot_1594115516.png" width="300" /> <img src="https://github.com/shock-wave007/Flutter-platfrom-aware-other-widgits/blob/master/images/Screenshot_1594115534.png" width="300" /> 


# need to add 

pub.dev [flutter_platform_widgets](https://pub.dev/packages/flutter_platform_widgets) 
or
github [flutter_platform_widgets](https://github.com/stryder-dev/flutter_platform_widgets) 

# usage

```dart
PwaRadioGrpSegment(
                strList: ["SunLight", "MoonLight", "NoLight"],
                fn: (a) => setState(() =>{
                                        mREs = a;
                                        });
                cVal: mREs,
              ),
```

```dart
PwaDateTimePicker(
                  isTime: false,
                  inlDate: mDate,
                  timeSetter: (value) => _updatemDate(value),
                )
```



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
