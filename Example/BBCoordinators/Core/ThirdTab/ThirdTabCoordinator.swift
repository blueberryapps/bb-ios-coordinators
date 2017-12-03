//
//  ThirdTabCoordinator.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

class ThirdTabCoordinator: Coordinator<ThirdTabVM, ThirdTabVC> {
    
    override func didChangeViewController() {
        self.rootController.setNavigationBarHidden(true, animated: false)
    }
    
}
