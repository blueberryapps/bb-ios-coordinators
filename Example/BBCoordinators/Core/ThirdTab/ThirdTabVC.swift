//
//  ThirdTabVC.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import UIKit

class ThirdTabVC: BaseController<ThirdTabVM> {
    
	let appScheme = AppScheme.instantiate()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.setupBackground()
		self.setupButton()
	}

	private func setupButton() {
		self.appScheme.button.setTitle("Go To PopTo", for: .normal)
		self.appScheme.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
	}

	@objc func buttonTapped() {
		self.viewModel?.buttonTapped()
	}

}

// MARK: - Background

extension ThirdTabVC {

	fileprivate func setupBackground() {
		self.appScheme.frame = CGRect(x: self.view.frame.minX + 20, y: self.view.frame.minY + 30, width: self.view.frame.width - 40, height: self.view.frame.height - 94)
		self.appScheme.thirdBox.borderColor = .red
		self.appScheme.thirdBox.borderWidth = 2
		self.appScheme.thirdTabBox.borderColor = .red
		self.appScheme.thirdTabBox.borderWidth = 2
		self.appScheme.thirdLine.backgroundColor = .red
		self.appScheme.thirdLine.selected = true
		self.appScheme.popToBox.borderColor = .blue
		self.appScheme.popToBox.borderWidth = 2
		self.appScheme.popToLine.backgroundColor = .blue
		self.appScheme.popToLine.selected = true

		self.view.addSubview(appScheme)
	}

}
