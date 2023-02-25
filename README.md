# AppVersionMonitorSwiftUI

[![Github issues](https://img.shields.io/github/issues/SNQ-2001/AppVersionMonitorSwiftUI)](https://github.com/SNQ-2001/AppVersionMonitorSwiftUI/issues)
[![Github forks](https://img.shields.io/github/forks/SNQ-2001/AppVersionMonitorSwiftUI)](https://github.com/SNQ-2001/AppVersionMonitorSwiftUI/network/members)
[![Github stars](https://img.shields.io/github/stars/SNQ-2001/AppVersionMonitorSwiftUI)](https://github.com/SNQ-2001/AppVersionMonitorSwiftUI/stargazers)
[![Github top language](https://img.shields.io/github/languages/top/SNQ-2001/AppVersionMonitorSwiftUI)](https://github.com/SNQ-2001/AppVersionMonitorSwiftUI/)
[![Github license](https://img.shields.io/github/license/SNQ-2001/AppVersionMonitorSwiftUI)](https://github.com/SNQ-2001/AppVersionMonitorSwiftUI/)

This library is designed to offer developers a straightforward and effective method of identifying whether updates are accessible. It enables developers to keep their users updated with the most recent version of their app. Through utilizing "AppVersionMonitorSwiftUI," developers can conserve time and energy in managing updates and prioritize enhancing the features and functionality of their app.

By utilizing "AppVersionMonitorSwiftUI," developers can guarantee their users have the most up-to-date version of their app, without the need for complex update checks or manual user notifications. This leads to a more satisfactory user experience.

## Installation

ScreenTimeout can be installed with the Swift Package Manager:

```
https://github.com/SNQ-2001/AppVersionMonitorSwiftUI
```

You can also clone the repository and build the library locally.

## How to use ?
```swift
import AppVersionMonitorSwiftUI

VStack {

}
.appVersionMonitor(id: 1570395606) { status in
    switch status {
    case .updateAvailable:
        print("There is an update available")
    case .updateUnavailable:
        print("There is no update available")
    case .failure(let error):
        print("error: \(error)")
    }
}
```

## Where is the app id ?

The number at the end of the AppStore URL is the app id

```
https://apps.apple.com/jp/app/g-search/id1570395606
```

## License

AppVersionMonitorSwiftUI is available under the MIT license. See the [LICENSE](https://github.com/SNQ-2001/AppVersionMonitorSwiftUI/blob/main/LICENSE) file for more info.
