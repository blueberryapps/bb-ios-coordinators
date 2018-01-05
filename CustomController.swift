//
//  CustomController.swift
//  BBCoordinators
//
//  Created by David Lenský on 04/01/2018.
//

import UIKit

public protocol CustomController: class where Self: UIViewController {
	associatedtype T: ViewModel

	var viewModel: T? { get set }
	var customTabBarController: UITabBarController? { get set }

	init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)

}

public extension CustomController {

	init(viewModel: T, item: UITabBarItem? = nil) {
		self.init(nibName: nil, bundle: nil)
		self.viewModel = viewModel
		self.tabBarItem = item
	}

	func createTabBarController(from type: UITabBarController.Type, withItemControllers items: [UINavigationController]) {
		let tabBarController = type.init()
		tabBarController.viewControllers = items
		tabBarController.view.frame = CGRect(origin: .zero, size: self.view.frame.size)
		self.view.addSubview(tabBarController.view)
		self.customTabBarController = tabBarController
	}

}
