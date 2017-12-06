//
//  ThirdTabCoordinator.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

protocol ThirdTabCoordinatorType: CoordinatorType {
	func goToPopTo(withVMTestString test: String, andVCTestString test2: String)
}

class ThirdTabCoordinator: Coordinator<ThirdTabVM, ThirdTabVC> {
    
    override func didChangeViewController() {
        self.rootController.setNavigationBarHidden(true, animated: false)
    }
    
}

extension ThirdTabCoordinator: ThirdTabCoordinatorType {

	func goToPopTo(withVMTestString test: String, andVCTestString test2: String) {
		DI.send(test, withKey: DI.Key.diTestVM)
		DI.send(test2, withKey: DI.Key.diTestVC)
		self.go(.forward(to: AppScreen.popTo))
	}

}
