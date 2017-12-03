//
//  PopToVM.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

class PopToVM: ViewModel {
    
    func buttonTapped() {
        self.coordinator?.go(.back(to: AppScreen.intro), animated: true)
    }
    
    convenience init(coordinator: CoordinatorType, diTest: String) {
        self.init(coordinator: coordinator)
        print(diTest)
    }
    
}
