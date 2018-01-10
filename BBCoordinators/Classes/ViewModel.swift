//
//  ViewModel.swift
//  TestProject
//
//  Created by David Lenský on 25/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import Foundation

public protocol ViewModel: class {
    
	weak var coordinator: Coordinatable? { get set }
    
    init()
    
}

public extension ViewModel {

	init(coordinator: Coordinatable) {
		self.init()
		self.coordinator = coordinator
	}

}
