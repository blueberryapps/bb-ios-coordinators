//
//  BaseViewModel.swift
//  BBCoordinators_Example
//
//  Created by David Lenský on 04/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import BBCoordinators
import Foundation

class BaseViewModel: ViewModel {

	weak var coordinator: CoordinatorType?

	required init() {}

}
