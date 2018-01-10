//
//  Controller.swift
//  TestProject
//
//  Created by David Lenský on 25/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import UIKit

public protocol Controller: class where Self: UIViewController {
	associatedtype T: ViewModel

	var viewModel: T? { get set }

	init()
}

public extension Controller {

	init(viewModel: T, item: UITabBarItem? = nil) {
		self.init()
		self.viewModel = viewModel
		self.tabBarItem = item
	}

}
