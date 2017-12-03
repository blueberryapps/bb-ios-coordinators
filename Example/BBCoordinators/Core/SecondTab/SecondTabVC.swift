//
//  SecondTabVC.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import UIKit

class SecondTabVC: Controller<SecondTabVM> {
    
	let appScheme = AppScheme.instantiate()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.setupBackground()
		self.setupButton()
	}

	private func setupButton() {
		self.appScheme.button.setTitle("Pop back one", for: .normal)
		self.appScheme.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
	}

	@objc func buttonTapped() {
		self.viewModel.buttonTapped()
	}

}

// MARK: - Background

extension SecondTabVC {

	fileprivate func setupBackground() {
		self.appScheme.frame = CGRect(x: self.view.frame.minX + 20, y: self.view.frame.minY + 30, width: self.view.frame.width - 40, height: self.view.frame.height - 94)
		self.appScheme.secondBox.borderColor = .red
		self.appScheme.secondBox.borderWidth = 2
		self.appScheme.secondTabBox.borderColor = .red
		self.appScheme.secondTabBox.borderWidth = 2
		self.appScheme.secondLine.backgroundColor = .red
		self.appScheme.secondLine.selected = true

		self.appScheme.tabBarBox.borderColor = .blue
		self.appScheme.tabBarBox.borderWidth = 2
		self.appScheme.introBox.borderColor = .blue
		self.appScheme.introBox.borderWidth = 2
		self.appScheme.introLine.backgroundColor = .blue
		self.appScheme.introLine.selected = true

		self.view.addSubview(appScheme)
	}

}
