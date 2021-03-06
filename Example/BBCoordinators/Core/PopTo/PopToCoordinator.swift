//
//  PopToCoordinator.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

class PopToCoordinator: Coordinator<PopToVM, PopToVC> {
    
	override func didChangeViewController() {
        self.rootController.setNavigationBarHidden(true, animated: false)
    }
    
    override func customViewModel() -> PopToVM? {
        return DI.get(arg: self)
    }
    
    override func customViewController(with viewModel: PopToVM) -> PopToVC? {
        return DI.get(arg: viewModel)
    }
    
}
