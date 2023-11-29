# TinderSwipingAnimation
TinderSwipingAnimation is an easy to use library written using SwiftUI to simplify the implementation of the tinder swipe animation.
## Demo
![new_recording](https://github.com/omarthamri/TinderSwipingAnimation/assets/39087448/11b7ab0c-c467-41f5-ad6a-b810cce78478)
## Installation
### Swift Package Manager
* File > Swift Packages > Add Package Dependency
* Add ```https://github.com/omarthamri/TinderSwipingAnimation.git```
* Select "Up to Next Major" with "1.3"
### Cocoapods
```
target 'MyApp' do
  pod 'MyTinderSwipingAnimation', '~> 1.3'
end
```
The import statement in this case will be
```
import MyTinderSwipingAnimation
```
Xcode 15 made a significant change by setting the default value of the ```ENABLE_USER_SCRIPT_SANDBOXING Build Setting from NO to YES.``` As a result, when installing TinderSwipingAnimation with cocoapods we encounters an error related to missing file permissions, which typically manifests as follows: ```error: Sandbox: rsync.samba(10816) deny(1) file-read-data.```

To resolve this issue, it is necessary to manually set the ```ENABLE_USER_SCRIPT_SANDBOXING setting to NO``` in Build Settings.
## Usage
in the top of your view file add the code below:
```
import TinderSwipingAnimation
```
A basic implementation example would be like this:
```
struct ContentView: View {
    let cards: [CardModel] = [ // This is the data to be shown in Card
        CardModel(name: "Brie", imageName: "brie", age: 34),
        CardModel(name: "Scarlett", imageName: "scarlett", age: 38),
        CardModel(name: "Elizabeth", imageName: "elizabeth", age: 33)
    ]
    let buttons: [ButtonModel] = [ // those are the buttons to be shown in the card
        ButtonModel(image: Image(systemName: "xmark"), color: .pink),
        ButtonModel(image: Image(systemName: "heart.fill"), color: .red),
        ButtonModel(image: Image(systemName: "bubble.fill"), color: .purple),
        ButtonModel(image: Image(systemName: "bolt.fill"), color: .blue)
    ]
    var body: some View {
            TinderSwipingAnimation(cards: cards, buttons: buttons) { (cardModel,direction) in // Closure to be called when a card is swiped.
                print("Swiped \(cardModel.name) to \(direction.description)")
            }
        }
}
```
If you want to modify the colors or fonts in the card
```
TinderSwipingAnimation(cards: cards, buttons: buttons) { (cardModel,direction) in // Closure to be called when a card is swiped.
            print("Swiped \(cardModel.name) to \(direction.description)")
        }
        .tinderSwipingStyle(titleColor: .red, subtitleColor: .red, titleFont: .largeTitle, subtitleFont: .largeTitle)
```
## Requirements
* iOS 16.0+
## License
TinderSwipingAnimation is released under the MIT license. See LICENSE for details.
