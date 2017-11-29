//
//  ViewModel.swift
//  BBCoordinators
//
//  Created by David Lenský on 29/11/2017.
//

import Foundation

class ViewModel {

	weak var coordinator: CoordinatorType?

	required init(coordinator: CoordinatorType) {
		self.coordinator = coordinator
	}

}
