//
//  FirstTabCoordinator.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import BBCoordinators
import Foundation

class FirstTabCoordinator: BaseCoordinator<FirstTabVM, FirstTabVC> {

	override func willGetOnTop(with: Event) {
		self.navigationController?.setNavigationBarHidden(true, animated: false)
	}

}
