//
//  IntroCoordinator.swift
//  TestProject
//
//  Created by David Lenský on 25/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

class IntroCoordinator: Coordinator<IntroVM, IntroVC> {
    
	override func willChangeViewController() {
		self.rootController.setNavigationBarHidden(true, animated: false)
	}

    func goToMain() {
        self.go(.forward(to: AppScreen.tabBar))
    }
    
}
