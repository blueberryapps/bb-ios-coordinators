//
//  BaseViewModel.swift
//  BBCoordinators_Example
//
//  Created by Jozef Matus on 08/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import BBCoordinators

public class BaseViewModel: ViewModel {
    public var coordinator: CoordinatorType?
    
    public required init(coordinator: CoordinatorType) {
        self.coordinator = coordinator
    }
    
    
}
