//
//  PopToVC.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import UIKit

class PopToVC: BaseController<PopToVM> {

	let appScheme = AppScheme.instantiate()

	convenience init(viewModel: PopToVM, diTest: String) {
		self.init(viewModel: viewModel)
		print(diTest)
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.setupBackground()
		self.setupButton()
		self.setupLabel()
	}

	private func setupButton() {
		self.appScheme.button.setTitle("Pop to \"Third tab\" Screen", for: .normal)
		self.appScheme.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
	}

	private func setupBackground() {
		self.appScheme.frame = CGRect(x: self.view.frame.minX + 20, y: self.view.frame.minY + 30, width: self.view.frame.width - 40, height: self.view.frame.height - 94)
		self.view.addSubview(appScheme)
	}

	private func setupLabel() {
		self.appScheme.label.text = "PopTo\nScreen"
	}

	@objc func buttonTapped() {
		self.viewModel?.buttonTapped()
	}
}
