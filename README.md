# TinderSwipingAnimation
TinderSwipingAnimation is a library written using SwiftUI to simplify the implementation of the tinder swipe animation.
## Demo
![Simulator Screen Recording - iPhone 15 Pro - 2023-11-25 at 23 55 45](https://github.com/omarthamri/TinderSwipingAnimation/assets/39087448/e9d46a1d-f2a1-489b-98df-51b509d02adf)
## Installation
### Swift Package Manager
* File > Swift Packages > Add Package Dependency
* Add ```https://github.com/omarthamri/TinderSwipingAnimation.git```
* Select "Up to Next Major" with "1.0.5"
### Cocoapods
```
target 'MyApp' do
  pod 'MyTinderSwipingAnimation', '~> 1.0'
end
```
The import statement in this case will be
```
import MyTinderSwipingAnimation
```
Xcode 15 made a significant change by setting the default value of the ```ENABLE_USER_SCRIPT_SANDBOXING Build Setting from NO to YES.``` As a result, when installing TinderSwipingAnimation with cocoapods we encounters an error related to missing file permissions, which typically manifests as follows: ```error: Sandbox: rsync.samba(10816) deny(1) file-read-data.```

To resolve this issue, it is necessary to manually set the ```ENABLE_USER_SCRIPT_SANDBOXING setting to NO``` in Build Settings.
## Usage
```
import TinderSwipingAnimation
let cards: [CardModel] = [
        CardModel(name: "Brie", imageName: "brie", age: 34),
        CardModel(name: "Scarlett", imageName: "scarlett", age: 38),
        CardModel(name: "Elizabeth", imageName: "elizabeth", age: 33)
        ]
let buttons: [ButtonModel] = [
            ButtonModel(image: Image(systemName: "xmark"), color: .pink),
            ButtonModel(image: Image(systemName: "heart.fill"), color: .red),
            ButtonModel(image: Image(systemName: "bubble.fill"), color: .purple),
            ButtonModel(image: Image(systemName: "bolt.fill"), color: .blue)
        ]
TinderSwipingAnimation(cards: cards, buttons: buttons)
```
## Requirements
* iOS 16.0+
