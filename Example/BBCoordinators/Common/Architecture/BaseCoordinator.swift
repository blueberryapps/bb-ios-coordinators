//
//  BaseCoordinator.swift
//  BBCoordinators_Example
//
//  Created by David Lenský on 10/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import BBCoordinators
import Foundation

class BaseCoordinator<VM, VC: Controller>: Coordinator<VM, VC> where VC.T == VM {

}
