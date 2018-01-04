//
//  ViewModel.swift
//  TestProject
//
//  Created by David Lenský on 25/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import Foundation

public protocol ViewModel {
    
	weak var coordinator: CoordinatorType? { get set }
    
	init()
    
}

public extension ViewModel {

	init(coordinator: CoordinatorType) {
		self.init()
		self.coordinator = coordinator
	}

}
