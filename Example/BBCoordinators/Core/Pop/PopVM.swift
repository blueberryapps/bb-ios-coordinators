//
//  PopVM.swift
//  BBCoordinators_Example
//
//  Created by David Lenský on 10/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

class PopVM: BaseViewModel {

	func buttonTapped() {
		self.coordinator?.pop()
	}

}
