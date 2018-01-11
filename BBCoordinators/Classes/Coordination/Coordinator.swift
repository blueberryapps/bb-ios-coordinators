//
//  Coordinator.swift
//  TestProject
//
//  Created by David Lenský on 25/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

// MARK: - Coordinator

open class Coordinator<VM, VC: Controller>: GenericCoordinator where VC.T == VM {
	public typealias M = VM
	public typealias C = VC

	public weak var stack: CoordinationStack?

	public required init() {}

	/*
	Method for injecting custom ViewModel of type VM.
	• Allows usage of a custom subclass of VM
	• Allows using custom initializer of VM. (For dependency injection, ...)

	- returns custom subclass or instance of VM
	*/
	open func customViewModel() -> M? { return nil }

	/*
	Method for injecting custom Controller<VM> of type VC.
	• Allows usage of a custom subclass of VC
	• Allows using custom initializer of VC. (For dependency injection, ...)

	+ gets instance of VM passed from "customViewModel()" if implemented or default one if not

	- returns custom subclass or instance of VC
	*/
	open func customViewController(with viewModel: M) -> C? { return nil }

	open func willGetOnTop(with: Event) {}
	open func willLeaveTop(with: Event) {}

}

public protocol GenericCoordinator: CoordinatorType, Stackable, Coordinatable {
	associatedtype M
	associatedtype C: Controller where C.T == M

	func customViewModel() -> M?
	func customViewController(with viewModel: M) -> C?
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
		self.popTo(screen, animated: true)
	}

}

public extension Coordinatable where Self: Stackable & CoordinatorType {

	func push(screen: Screen, animated: Bool) {
		self.willLeaveTop(with: .push)
		self.stack?.push(screen: screen, animated: animated)
	}

	func pop(animated: Bool) {
		self.willLeaveTop(with: .pop)
		self.stack?.pop(animated: animated)
	}

	func popTo(_ screen: Screen, animated: Bool) {
		self.willLeaveTop(with: .pop)
		self.stack?.popTo(screen, animated: animated)
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

	func willGetOnTop(with: Event)
	func willLeaveTop(with: Event)

	init()

}

public extension CoordinatorType where Self: Stackable {

	public var navigationController: UINavigationController? {
		return self.stack?.rootController
	}

	func set(stack: CoordinationStack) {
		self.stack = stack
	}

}

public extension CoordinatorType where Self: GenericCoordinator {

	func createViewModel() -> ViewModel {
		return self.customViewModel() ?? M.init(coordinator: self)
	}

	func createViewController(with viewModel: ViewModel, and item: UITabBarItem?) -> UIViewController {
		guard let vm = viewModel as? M else { return UIViewController() }
		return self.customViewController(with: vm) ?? C.init(viewModel: vm, item: item)
	}

}
