//
//  TabBarCoordinator.swift
//  TestProject
//
//  Created by David Lenský on 25/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

class TabBarCoordinator: Coordinator<TabBarVM, TabBarVC> {
    
    override func didChangeViewController() {
        self.rootController.setNavigationBarHidden(true, animated: false)
    }
    
    func goToLogin() {
        self.go(.backOne)
    }
    
}
