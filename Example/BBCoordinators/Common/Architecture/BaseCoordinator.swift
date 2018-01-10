//
//  BaseCoordinator.swift
//  BBCoordinators_Example
//
//  Created by David Lenský on 10/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import BBCoordinators
import Foundation

class BaseCoordinator<VM, VC: Controller>: Coordinator where VC.T == VM {
	typealias M = VM
	typealias C = VC

	var stack: CoordinationStack?

	required init() {}

}
