//
//  NextVM.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import Foundation

class NextVM: BaseViewModel {
    
	func buttonTapped() {
		guard let coordinator = self.coordinator as? NextCoordinatorType else { return }
		coordinator.goToPopTo(withVMTestString: "Test VM DI successful", andVCTestString: "Test VC DI successful")
	}
    
}
