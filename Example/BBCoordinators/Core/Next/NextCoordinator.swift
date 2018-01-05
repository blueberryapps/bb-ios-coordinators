//
//  NextCoordinator.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

class NextCoordinator: CustomCoordinator<NextVM, NextVC> {
    
    override func didChangeViewController() {
        self.rootController.setNavigationBarHidden(true, animated: false)
    }
    
}

