//
//  SecondTabCoordinator.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

class SecondTabCoordinator: Coordinator<SecondTabVM, SecondTabVC> {
    
    override func didChangeViewController() {
        self.rootController.setNavigationBarHidden(true, animated: false)
    }
    
}
