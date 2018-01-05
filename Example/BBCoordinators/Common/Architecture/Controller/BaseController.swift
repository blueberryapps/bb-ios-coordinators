//
//  BaseController.swift
//  BBCoordinators_Example
//
//  Created by David Lenský on 04/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import BBCoordinators
import UIKit

class BaseController<VM: ViewModel>: UIViewController, CustomController {
	typealias T = VM

	var viewModel: VM?

	var customTabBarController: UITabBarController?

	override required init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
