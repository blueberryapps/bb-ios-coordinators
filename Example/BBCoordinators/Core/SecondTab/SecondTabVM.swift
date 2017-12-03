//
//  SecondTabVM.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

class SecondTabVM: ViewModel {
    
    func buttonTapped() {
        self.coordinator?.go(.backOne, animated: true)
    }
    
}
