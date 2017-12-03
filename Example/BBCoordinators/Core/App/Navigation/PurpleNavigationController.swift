//
//  PurpleNavigationController.swift
//  BBCoordinators_Example
//
//  Created by David Lenský on 01/12/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class PurpleNavigationController: UINavigationController {

	let gradient = CAGradientLayer()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.gradient.colors = [#colorLiteral(red: 0.5, green: 0.04379742189, blue: 0.542300842, alpha: 1).cgColor, #colorLiteral(red: 0.672361105, green: 0.3756803633, blue: 0.8507124352, alpha: 1).cgColor]
		self.gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
		self.gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
		self.view.layer.insertSublayer(self.gradient, at: 0)
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		self.gradient.frame.size = self.view.frame.size
	}

}
