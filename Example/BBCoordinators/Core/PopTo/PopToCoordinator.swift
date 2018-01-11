//
//  PopToCoordinator.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

class PopToCoordinator: BaseCoordinator<PopToVM, PopToVC> {

	override func willGetOnTop(with: Event) {
		switch with {
		case .pop: print("PopToCoordinator will now GET ON top by POP")
		case .push: print("PopToCoordinator will now GET ON top by PUSH")
		}
	}

	override func willLeaveTop(with: Event) {
		switch with {
		case .pop: print("PopToCoordinator will now LEAVE top by POP")
		case .push: print("PopToCoordinator will now LEAVE top by PUSH")
		}
	}

    override func customViewModel() -> PopToVM? {
        return DI.get(arg: self)
    }
    
    override func customViewController(with viewModel: PopToVM) -> PopToVC? {
        return DI.get(arg: viewModel)
    }

}
