//
//  ThirdTabCoordinator.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import Foundation

protocol ThirdTabCoordinatorType {
	func goToPopTo(withVMTestString test: String, andVCTestString test2: String)
}

class ThirdTabCoordinator: BaseCoordinator<ThirdTabVM, ThirdTabVC> {
    
//        self.rootController.setNavigationBarHidden(true, animated: false)
    
}

extension ThirdTabCoordinator: ThirdTabCoordinatorType {

	func goToPopTo(withVMTestString test: String, andVCTestString test2: String) {
		DI.send(test, withKey: DI.Key.diTestVM)
		DI.send(test2, withKey: DI.Key.diTestVC)
		self.push(screen: AppScreen.popTo)
	}

}
