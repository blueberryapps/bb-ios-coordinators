//
//  ThirdTabVM.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import Foundation

class ThirdTabVM: BaseViewModel {
    
	func buttonTapped() {
		self.coordinator?.push(screen: AppScreen.next)
	}
    
}
