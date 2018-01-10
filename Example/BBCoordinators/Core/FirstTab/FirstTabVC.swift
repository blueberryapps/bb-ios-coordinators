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
	}

	private func setupButton() {
		self.appScheme.button.setTitle("Go To Next", for: .normal)
		self.appScheme.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
	}

	@objc func buttonTapped() {
		self.viewModel?.buttonTapped()
	}

}

// MARK: - Background

extension FirstTabVC {

	fileprivate func setupBackground() {
		self.appScheme.frame = CGRect(x: self.view.frame.minX + 20, y: self.view.frame.minY + 30, width: self.view.frame.width - 40, height: self.view.frame.height - 94)
		self.appScheme.firstBox.borderColor = .red
		self.appScheme.firstBox.borderWidth = 2
		self.appScheme.firstTabBox.borderColor = .red
		self.appScheme.firstTabBox.borderWidth = 2
		self.appScheme.firstLine.backgroundColor = .red
		self.appScheme.firstLine.selected = true
		self.appScheme.nextBox.borderColor = .blue
		self.appScheme.nextBox.borderWidth = 2
		self.appScheme.nextLine.backgroundColor = .blue
		self.appScheme.nextLine.selected = true

		self.view.addSubview(appScheme)
	}

}
