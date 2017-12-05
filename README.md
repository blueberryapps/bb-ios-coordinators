# BBCoordinators

[![CI Status](http://img.shields.io/travis/David Lenský/BBCoordinators.svg?style=flat)](https://travis-ci.org/David Lenský/BBCoordinators)
[![Version](https://img.shields.io/cocoapods/v/BBCoordinators.svg?style=flat)](http://cocoapods.org/pods/BBCoordinators)
[![License](https://img.shields.io/cocoapods/l/BBCoordinators.svg?style=flat)](http://cocoapods.org/pods/BBCoordinators)
[![Platform](https://img.shields.io/cocoapods/p/BBCoordinators.svg?style=flat)](http://cocoapods.org/pods/BBCoordinators)

## Introduction

BBCoordinators is an iOS framework, that encapsulates all navigation logic in MVVM architecture into a single element - Coordinator. It automates most of the repetitive work around creating a working navigation flow and makes it easier to maintain.

The idea is based on blog post from Soroush Khanlou [Coordinators Redux](http://khanlou.com/2015/10/coordinators-redux/).

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

### Cocoapods

Add BBCoordinators in your `Podfile`.

```ruby
use_frameworks!

pod 'BBCoordinators', :git => 'https://github.com/blueberryapps/bb-ios-coordinators.git'
```

Then, run the following command in your project directory.

```bash
$ pod install
```

## Manual

Copy `BBCoordinators` directory into your project and you're all set.

_**Note:** Make sure that every file in `BBCoordinators` folder is included in Compile Sources in Build Phases.

## Usage

First, import `BBCoordinators`.

```swift
import BBCoordinators
```

### Create screen classes

Now that you have `BBCoordinators` imported, you need to create your screen's classes. Those will inherit from framework's `ViewModel`, `Controller` and `Coordinator` classes. Then you will need to create a component that will implement a `Screen` protocol. But more about that later. First lets create a simple transition from a screen called `First` to a screen called `Second`

#### ViewModel subclasses

We can begin by creating a `ViewModel` subclasses. Let's call them `FirstVM`

```swift
class FirstVM: ViewModel {

}

```

and `SecondVM`.

```swift

class SecondVM: ViewModel {

}
```

Let's leave them empty for now.

#### Controller subclasses

Next step is to create a `Controller` subclasses, that will be using your VMs. Again lets call them `FirstVC` and `SecondVC`.

```swift
class FirstVC: Controller<FirstVM> {


}

class SecondVC: Controller<SecondVM> {

}
```

As you can see, `Controller` is a generic class that takes `ViewModel` type class as a parameter. For now, you're done here. Let's move on to the `Coordinator`.

#### Coordinator subclasses

Now that we have our VMs and VCs set up, we can move on to coordinators (Finally!).

```swift
class FirstCoordinator: Coordinator<FirstVM, FirstVC> {

}

class SecondCoordinator: Coordinator<SecondVM, SecondVC> {

}
```

Okey, another generic class. This time it takes both, a `ViewModel` type class and a `Controller` type class. It also has to be that specific `ViewModel` class that you already used in the corresponding `Controller` class. In other words, if you use VM1 in VC1 and then use VC1 in Coordinator1, then you also have to use VM1 (or it's subclass) in Coordinator1. Does your head hurts? Good! Take an aspirin and let's move on to the next step!

#### Implementing Screen

Okey our classes are declared and the only thing remaining to set up is something that will represent our screen throughout the app. I prefer an enum, si I will implement it that way, but it's up to you, use what you want.

```swift
enum AppScreen {
	case first
	case second
}

extension AppScreen: Screen {

	var type: BaseCoordinator.Type {
		switch self {
			case .first: return FirstCoordinator.self
			case .tabBar: return SecondCoordinator.self
		}
	}

)
```
So what is this exactly? Well, this enum represents our screens. Every case has many information attached to it, but for now, we'll just use `type`, which tells us what `Coordinator` is associated with the screen. It's the only mandatory element, that you have to implement. There are bunch of other options you could use, but more about them later.

### Anchoring first coordinator

Alright! You should now be able to compile this with no problems. But wait. How do we actually use this, you ask? Simple, just anchor your first `Coordinator` in AppDelegate (or wherever else you want to do it) and add the below code to `applictionDidFinishLaunchingWithOptions` method.

```swift

var coordinator: BaseCoordinator?

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

...

	self.coordinator = Coordinator.start(screen: AppScreen.first)
	self.window?.rootViewController = self.coordinator?.rootController

...

}
```

Now you added a starting point for your app. By calling `start(screen: AppScreen.first)` a `FirstCoordinator` is created along with `UINavigationController` and the `Controller` and `ViewModel` that you associated with `FirstCoordinator`. Your `Controller` is also pushed to NavController's stack. You can access the NavController through coordinator's `rootController` property. The only thing left to do here is set window's rootViewController to our NavController. Done!

### Navigating to another screen

Well we do have our `FirstCoordinator` up and running, but how do we get to our second screen? Just create a button in `FirstVC` and add this line to it's callback method.

```swift
...

self.viewModel.goToSecondButtonTapped()

...
```

Then implement it in `FirstVM`

```swift
func goToSecondButtonTapped() {
	...
	self.coordinator?.go(.forward(to: AppScreen.second), animated: true)
	...
}

```

And that's it! You can notice the `.forward(to:)`, which specifies that we want to move to a new screen (or 'push a new controller to the stack'). But sometimes you want to also get back right? And that's what the other cases are for. `.backOne` takes you on screen backwards ('pops a controller from stack'). The more advanced `.back(to:)` will take you backwards to a screen you specify, doesn't matter how far back it is. If a screen that is not in the stack is passed to this method, nothing will happen.

## Advanced usage

WIP

## Author

Jozef Matúš
David Lenský

## License

BBCoordinators is available under the MIT license. See the LICENSE file for more info.
