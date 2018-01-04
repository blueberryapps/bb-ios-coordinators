//
//  FirstTabVM.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

class FirstTabVM: BaseViewModel {
    
    func buttonTapped() {
        self.coordinator?.go(.forward(to: AppScreen.next), animated: true)
    }
    
}
