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
    case firstTab
    case secondTab
    case thirdTab
    case next
    case popTo
}

// MARK: - Screen

extension AppScreen: Screen {
    
    var type: CoordinatorType.Type {
        switch self {
        case .intro: return IntroCoordinator.self
        case .firstTab: return FirstTabCoordinator.self
        case .secondTab: return SecondTabCoordinator.self
        case .thirdTab: return ThirdTabCoordinator.self
        case .next: return NextCoordinator.self
        case .popTo: return PopToCoordinator.self
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

}

