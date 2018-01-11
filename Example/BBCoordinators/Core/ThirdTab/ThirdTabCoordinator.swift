//
//  ThirdTabCoordinator.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

class ThirdTabCoordinator: BaseCoordinator<ThirdTabVM, ThirdTabVC> {
    
	override func willGetOnTop(with: Event) {
		switch with {
		case .pop: print("ThirdTabCoordinator will now GET ON top by POP")
		case .push: print("ThirdTabCoordinator will now GET ON top by PUSH")
		}
	}

	override func willLeaveTop(with: Event) {
		switch with {
		case .pop: print("ThirdTabCoordinator will now LEAVE top by POP")
		case .push: print("ThirdTabCoordinator will now LEAVE top by PUSH")
		}
	}
    
}
