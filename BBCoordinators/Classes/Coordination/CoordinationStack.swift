//
//  CoordinationStack.swift
//  BBCoordinators
//
//  Created by David Lenský on 09/01/2018.
//

import Foundation

public class CoordinationStack: Coordinatable {

	var rootController: UINavigationController?
	var coordinators: [CoordinatorType] = []

	public func push(screen: Screen, animated: Bool = true) {
		let coordinator = screen.type.init()
		let vm = coordinator.createViewModel()
		let vc = coordinator.createViewController(with: vm, and: screen.tabBarItem)

		coordinator.set(stack: self)
		self.coordinators.append(coordinator)
		self.rootController?.pushViewController(vc, animated: animated)
	}

	public func pop(animated: Bool = true) {
		self.rootController?.popViewController(animated: animated)
		let _ = self.coordinators.popLast()
	}

	public func popTo(_ screen: Screen, animated: Bool = true) {
		guard
			let index = self.coordinators.index(where: { coordinator -> Bool in
					type(of: screen) == screen.type
				}),
			let newControllers = self.rootController?.viewControllers[0...index]
		else { return }

		let newCoordinators = self.coordinators[0...index]

		self.rootController?.setViewControllers(Array(newControllers), animated: animated)
		self.coordinators = Array(newCoordinators)
	}

	init<T: UINavigationController>(rootController: T) {
		self.rootController = rootController
	}

}
