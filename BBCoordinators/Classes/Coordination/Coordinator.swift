//
//  Coordinator.swift
//  TestProject
//
//  Created by David Lenský on 25/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

// MARK: - Coordinator

public protocol Coordinator: CoordinatorType, Stackable, Coordinatable {
	associatedtype M
	associatedtype C: Controller where C.T == M
}

public extension Coordinator {

	/*
	Method for injecting custom ViewModel of type VM.
	• Allows usage of a custom subclass of VM
	• Allows using custom initializer of VM. (For dependency injection, ...)

	- returns custom subclass or instance of VM
	*/
	func customViewModel() -> M? { return nil }

	/*
	Method for injecting custom Controller<VM> of type VC.
	• Allows usage of a custom subclass of VC
	• Allows using custom initializer of VC. (For dependency injection, ...)

	+ gets instance of VM passed from "customViewModel()" if implemented or default one if not

	- returns custom subclass or instance of VC
	*/
	func customViewController(with viewModel: M) -> C? { return nil }

}

// MARK: - Coordinatable

public protocol Coordinatable: class {
	func push(screen: Screen)
	func push(screen: Screen, animated: Bool)
	func pop()
	func pop(animated: Bool)
	func popTo(_ screen: Screen)
	func popTo(_ screen: Screen, animated: Bool)
}

public extension Coordinatable {

	func push(screen: Screen) {
		self.push(screen: screen, animated: true)
	}

	func pop() {
		self.pop(animated: true)
	}

	func popTo(_ screen: Screen) {
		self.pop(animated: true)
	}

}

public extension Coordinatable where Self: Stackable {

	func push(screen: Screen, animated: Bool) {
		self.stack?.push(screen: screen, animated: animated)
	}

	func pop(animated: Bool) {
		self.stack?.pop(animated: animated)
	}

	func popTo(_ screen: Screen, animated: Bool) {
		self.stack?.pop(animated: animated)
	}

}

// MARK: - Stackable

public protocol Stackable: class {

	weak var stack: CoordinationStack? { get set }

}

// MARK: - CoordinatorType

public protocol CoordinatorType: class {

	func set(stack: CoordinationStack)

	func createViewModel() -> ViewModel
	func createViewController(with viewModel: ViewModel, and item: UITabBarItem?) -> UIViewController

	init()

}

public extension CoordinatorType where Self: Stackable {

	func set(stack: CoordinationStack) {
		self.stack = stack
	}

}

public extension CoordinatorType where Self: Coordinator {

	func createViewModel() -> ViewModel {
		return self.customViewModel() ?? M.init(coordinator: self)
	}

	func createViewController(with viewModel: ViewModel, and item: UITabBarItem?) -> UIViewController {
		guard let vm = viewModel as? M else { return UIViewController() }
		return self.customViewController(with: vm) ?? C.init(viewModel: vm, item: item)
	}

}
