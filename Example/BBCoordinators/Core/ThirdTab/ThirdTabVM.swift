//
//  ThirdTabVM.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

class ThirdTabVM: ViewModel {
    
    func buttonTapped() {
        self.coordinator?.go(.forward(to: AppScreen.popTo), animated: true)
    }
    
}
