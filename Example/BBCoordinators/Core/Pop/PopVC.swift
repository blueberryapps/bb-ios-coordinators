//
//  PopVC.swift
//  BBCoordinators_Example
//
//  Created by David Lenský on 10/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class PopVC: BaseController<PopVM> {

	let appScheme = AppScheme.instantiate()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.setupBackground()
		self.setupButton()
		self.setupLabel()
	}

	private func setupButton() {
		self.appScheme.button.setTitle("Pop current screen", for: .normal)
		self.appScheme.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
	}

	private func setupBackground() {
		self.appScheme.frame = CGRect(x: self.view.frame.minX + 20, y: self.view.frame.minY + 30, width: self.view.frame.width - 40, height: self.view.frame.height - 94)
		self.view.addSubview(appScheme)
	}

	private func setupLabel() {
		self.appScheme.label.text = "Pop\nScreen"
	}

	@objc func buttonTapped() {
		self.viewModel?.buttonTapped()
	}

}
