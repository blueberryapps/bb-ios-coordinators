//
//  NextCoordinator.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

protocol NextCoordinatorType {
	func goToPopTo(withVMTestString test: String, andVCTestString test2: String)
}


class NextCoordinator: BaseCoordinator<NextVM, NextVC> {

	override func willGetOnTop(with: Event) {
		switch with {
		case .pop: print("NextCoordinator will now GET ON top by POP")
		case .push: print("NextCoordinator will now GET ON top by PUSH")
		}
	}

	override func willLeaveTop(with: Event) {
		switch with {
		case .pop: print("NextCoordinator will now LEAVE top by POP")
		case .push: print("NextCoordinator will now LEAVE top by PUSH")
		}
	}

}

extension NextCoordinator: NextCoordinatorType {

	func goToPopTo(withVMTestString test: String, andVCTestString test2: String) {
		DI.send(test, withKey: DI.Key.diTestVM)
		DI.send(test2, withKey: DI.Key.diTestVC)
		self.push(screen: AppScreen.popTo)
	}

}
