//
//  AppCoordination.swift
//  TestProject
//
//  Created by David Lenský on 25/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

enum AppScreen {
    case intro
    case tabBar
    case firstTab
    case secondTab
    case thirdTab
    case next
    case popTo
}

// MARK: - Screen

extension AppScreen: Screen {
    
    var type: BaseCoordinator.Type {
        switch self {
        case .intro: return IntroCoordinator.self
        case .tabBar: return TabBarCoordinator.self
        case .firstTab: return FirstTabCoordinator.self
        case .secondTab: return SecondTabCoordinator.self
        case .thirdTab: return ThirdTabCoordinator.self
        case .next: return NextCoordinator.self
        case .popTo: return PopToCoordinator.self
        }
    }
    
    var tabBarScreens: [Screen] {
        switch self {
        case .tabBar: return [AppScreen.firstTab, AppScreen.secondTab, AppScreen.thirdTab]
        default: return []
        }
    }

	var tabBarItem: UITabBarItem? {
		let item: UITabBarItem?
		switch self {
		case .firstTab: item = UITabBarItem(title: "First", image: #imageLiteral(resourceName: "one").resize(to: 30) , selectedImage: #imageLiteral(resourceName: "oneSelected").resize(to: 30))
		case .secondTab: item = UITabBarItem(title: "Second", image: #imageLiteral(resourceName: "two").resize(to: 30), selectedImage: #imageLiteral(resourceName: "twoSelected").resize(to: 30))
		case .thirdTab: item = UITabBarItem(title: "Third", image: #imageLiteral(resourceName: "three").resize(to: 30), selectedImage: #imageLiteral(resourceName: "threeSelected").resize(to: 30))
		default: return nil
		}
		item?.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.3999532461, green: 0.4000268579, blue: 0.3999486566, alpha: 1)], for: .normal)
		item?.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 1, alpha: 1)], for: .selected)
		return item
	}

	var tabBarType: UITabBarController.Type {
		switch self {
		case .tabBar: return YellowTabBarController.self
		default: return UITabBarController.self
		}
	}

	var navigationBarType: UINavigationController.Type {
		switch self {
		case .intro: return PurpleNavigationController.self
		case .firstTab, .secondTab, .thirdTab: return BlueNavigationController.self
		default: return UINavigationController.self
		}
	}

}

