//
//  PopToVC.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import UIKit

class PopToVC: Controller<PopToVM> {

	let appScheme = AppScheme.instantiate()

	convenience init(viewModel: PopToVM, diTest: String) {
		self.init(viewModel: viewModel)
		print(diTest)
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.setupBackground()
		self.setupButton()
	}

	private func setupButton() {
		self.appScheme.button.setTitle("Pop To Intro", for: .normal)
		self.appScheme.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
	}

	@objc func buttonTapped() {
		self.viewModel.buttonTapped()
	}

}

// MARK: - Background

extension PopToVC {

	fileprivate func setupBackground() {
		self.appScheme.frame = CGRect(x: self.view.frame.minX + 20, y: self.view.frame.minY + 30, width: self.view.frame.width - 40, height: self.view.frame.height - 94)
		self.appScheme.popToBox.borderColor = .red
		self.appScheme.popToBox.borderWidth = 2
		self.appScheme.thirdTabBox.borderColor = .red
		self.appScheme.thirdTabBox.borderWidth = 2

		self.appScheme.tabBarBox.borderColor = .blue
		self.appScheme.tabBarBox.borderWidth = 2
		self.appScheme.introBox.borderColor = .blue
		self.appScheme.introBox.borderWidth = 2

		self.appScheme.introLine.backgroundColor = .blue
		self.appScheme.introLine.selected = true
		self.appScheme.thirdLine.backgroundColor = .blue
		self.appScheme.thirdLine.selected = true
		self.appScheme.popToLine.backgroundColor = .blue
		self.appScheme.popToLine.selected = true

		self.view.addSubview(appScheme)
	}

}
