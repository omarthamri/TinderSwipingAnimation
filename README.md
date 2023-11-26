# TinderSwipingAnimation
TinderSwipingAnimation is a library written using SwiftUI to simplify the implementation of the tinder swipe animation.
## Demo
![Simulator Screen Recording - iPhone 15 Pro - 2023-11-25 at 23 55 45](https://github.com/omarthamri/TinderSwipingAnimation/assets/39087448/e9d46a1d-f2a1-489b-98df-51b509d02adf)
## Installation
### Swift Package Manager
* File > Swift Packages > Add Package Dependency
* Add ```https://github.com/omarthamri/TinderSwipingAnimation.git```
## Usage
```
import TinderSwipingAnimation
let cards: [CardModel] = [
CardModel(name: "Brie", imageName: "brie", age: 34),
CardModel(name: "Scarlett", imageName: "scarlett", age: 38),
CardModel(name: "Elizabeth", imageName: "elizabeth", age: 33)
]
TinderSwipingAnimation(cards: cards)
```
## Requirements
* iOS 16.0+
