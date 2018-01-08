//
//  BaseCoordinator.swift
//  BBCoordinators
//
//  Created by David Lenský on 30/11/2017.
//

import Foundation
import Swinject

public protocol CoordinatorType: class {
	func go(_ action: Action, animated: Bool)
}

open class BaseCoordinator {
	public private(set) var rootController: UINavigationController
	internal var parent: BaseCoordinator?
	internal var children: [BaseCoordinator] = []

	required public init(root: UINavigationController) {
		self.rootController = root
	}

	internal func push(screen: Screen, animated: Bool) {}

	/*
	Overridable methods for making changes in coordinator.
	• Are called whenever a controller is pushed or popped from a rootController's stack.
	*/
	open func willChangeViewController() {}
	open func didChangeViewController() {}
}

extension BaseCoordinator {

	/*
	Instantiates UINavigationController and Coordinator of types specified in Screen.
	• Meant as a starting point for the coordinator cycle
	• Coordinator returned from this method should be anchored somewhere
	• UINavigationController (or it's subclass) is anchored as root inside the new coordinator.
	It should be added added to the view hierarchy somewhere (AppDelegate's windows for example)

	- returns newly created Coordinator
	*/
	public static func start(screen: Screen) -> BaseCoordinator {
		let navigationController = screen.navigationBarType.init()
		let coordinator = screen.type.init(root: navigationController)
		coordinator.willChangeViewController()
		coordinator.push(screen: screen, animated: false)
		coordinator.didChangeViewController()
		return coordinator
	}

}

public protocol CoordinatorrFactory {
	static func createInstance(root: UINavigationController, children: [BaseCoordinator], container: Container) -> CoordinatorrFactory
}

public protocol Coordinatorr: CoordinatorType, CoordinatorrFactory {

	var rootController: UINavigationController { get set }
	var parent: BaseCoordinator? { get set }
	var children: [BaseCoordinator] { get set }

	/*
	Overridable methods for making changes in coordinator.
	• Are called whenever a controller is pushed or popped from a rootController's stack.
	*/
	func willChangeViewController()
	func didChangeViewController()
}
public class NavigationBasedCoordinator<VM, VC>: Coordinatorr {
	public static func createInstance(root: UINavigationController, children: [BaseCoordinator], container: Container) -> CoordinatorrFactory {
		return NavigationBasedCoordinator.init(root: root, children: children, container: container)
	}

	public var rootController: UINavigationController

	public var parent: BaseCoordinator?

	public var children: [BaseCoordinator]

	init(root: UINavigationController, children: [BaseCoordinator] = [], container: Container) {
		self.rootController = root
		self.children = children
	}

	public func willChangeViewController() {
		print("")

	}

	public func didChangeViewController() {
		print("")
	}

	func pop(animated: Bool) {

	}

	public func go(_ action: Action, animated: Bool) {
		switch action {
		case .backOne: self.pop(animated: animated)
		case .forward(let screen): self.initialize(screen, withRoot: self.rootController, animated: animated)
		case .back(let screen): self.popTo(screen, animated: animated)
		}

	}

}

