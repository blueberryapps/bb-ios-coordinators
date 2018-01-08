//
//  IntroVM.swift
//  TestProject
//
//  Created by David Lenský on 25/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

class IntroVM: BaseViewModel {
    
    func buttonTapped() {
        guard let coordinator = self.coordinator as? IntroCoordinator else { return }
        coordinator.goToMain()
    }
    
    // TODO: - Also could be just self.coordinator.go(.forward(to: AppScreen.tabBar))
    
}
