//
//  FirstTabVC.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import UIKit

class FirstTabVC: BaseController<FirstTabVM> {
    
	let appScheme = AppScheme.instantiate()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.setupBackground()
		self.setupButton()
		self.setupLabel()
		self.setupSwitch()
	}

	private func setupButton() {
		self.appScheme.button.isHidden = true
	}

	private func setupBackground() {
		self.appScheme.frame = CGRect(x: self.view.frame.minX + 20, y: self.view.frame.minY + 30, width: self.view.frame.width - 40, height: self.view.frame.height - 94)
		self.view.addSubview(appScheme)
	}

	private func setupLabel() {
		self.appScheme.label.text = "First Tab\nScreen"
	}

	private func setupSwitch() {
		self.appScheme.switchView.isHidden = false
		self.appScheme.switch.isOn = self.tabBarController != nil
		self.appScheme.switch.addTarget(self, action: #selector(self.switchValueChanged), for: UIControlEvents.valueChanged)

	}

	@objc func switchValueChanged() {
		self.viewModel?.switchValueChanged()
	}

}
