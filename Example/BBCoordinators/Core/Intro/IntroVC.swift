//
//  IntroVC.swift
//  TestProject
//
//  Created by David Lenský on 25/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import UIKit

class IntroVC: BaseController<IntroVM> {

	let appScheme = AppScheme.instantiate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

		self.setupBackground()
		self.setupButton()
    }

	private func setupButton() {
		self.appScheme.button.setTitle("Go To TabBar", for: .normal)
		self.appScheme.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
	}

    @objc func buttonTapped() {
        self.viewModel?.buttonTapped()
    }

}

// MARK: - Background

extension IntroVC {

	fileprivate func setupBackground() {
		self.view.backgroundColor = .clear
		self.appScheme.frame = CGRect(x: self.view.frame.minX + 20, y: self.view.frame.minY + 25, width: self.view.frame.width - 40, height: self.view.frame.height - 45)
		self.appScheme.introBox.borderColor = .red
		self.appScheme.introBox.borderWidth = 2
		self.appScheme.tabBarBox.borderColor = .blue
		self.appScheme.tabBarBox.borderWidth = 2
		self.appScheme.introLine.backgroundColor = .blue
		self.appScheme.introLine.selected = true

		self.view.addSubview(appScheme)
	}

}
