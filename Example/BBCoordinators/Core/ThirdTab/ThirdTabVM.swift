//
//  ThirdTabVM.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import Foundation

class ThirdTabVM: BaseViewModel {
    
    func buttonTapped() {
		guard let coordinator = self.coordinator as? ThirdTabCoordinatorType else { return }
        coordinator.goToPopTo(withVMTestString: "Test VM DI successful", andVCTestString: "Test VC DI successful")
    }
    
}
