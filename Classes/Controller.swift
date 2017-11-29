//
//  Controller.swift
//  BBCoordinators
//
//  Created by David Lenský on 29/11/2017.
//

import UIKit

class Controller<T: ViewModel>: UIViewController {

	let viewModel: T
	var customTabBarController: UITabBarController?

	required init(viewModel: T) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func createTabBarController(from type: UITabBarController.Type, withItemControllers items: [UINavigationController]) {
		let tabBarController = type.init()
		tabBarController.viewControllers = items
		tabBarController.view.frame = CGRect(origin: .zero, size: self.view.frame.size)
		self.view.addSubview(tabBarController.view)
		self.customTabBarController = tabBarController
	}

}

