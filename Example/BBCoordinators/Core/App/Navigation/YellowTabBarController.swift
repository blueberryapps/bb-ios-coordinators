//
//  YellowTabBarController.swift
//  BBCoordinators_Example
//
//  Created by David Lenský on 01/12/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class YellowTabBarController: UITabBarController {

	let gradient = CAGradientLayer()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.gradient.colors = [#colorLiteral(red: 0.934039022, green: 0.7499758677, blue: 0.2110286484, alpha: 0.85).cgColor, #colorLiteral(red: 0.934039022, green: 0.7499758677, blue: 0.2110286484, alpha: 0.75).cgColor]
		self.gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
		self.gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
		self.tabBar.layer.insertSublayer(self.gradient, at: 0)

		self.tabBar.shadowImage = UIImage()
		self.tabBar.backgroundImage = UIImage()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		self.gradient.frame.size = self.tabBar.frame.size
	}

}
