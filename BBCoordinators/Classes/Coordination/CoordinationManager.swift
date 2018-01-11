//
//  CoordinationManager.swift
//  BBCoordinators
//
//  Created by David Lenský on 09/01/2018.
//

import Foundation

open class CoordinationManager<S: Settings> {

	public let window: UIWindow

	public var tabBarController: UITabBarController = S.tabBarType.init()
	public var stacks: [CoordinationStack] = [] {
		didSet {
			self.setupStacks()
		}
	}

	public init() {
		self.window = UIWindow(frame: UIScreen.main.bounds)
	}

	public init(window: UIWindow) {
		self.window = window
	}

}

extension CoordinationManager {

	@discardableResult
	public func addStack(with screen: Screen, and settings: StackSettings) -> Coordinatable {
		let navigationController = settings.navBarType.init()
		let stack = CoordinationStack(rootController: navigationController)
		stack.push(screen: screen, animated: false)
		self.stacks.append(stack)
		return stack
	}

	public func clearStacks() {
		self.stacks.removeAll()
		self.tabBarController.viewControllers?.removeAll()
	}
	
}

private extension CoordinationManager {

	func setupStacks() {
		if self.stacks.count == 1 {
			self.window.rootViewController = self.stacks.first?.rootController
		} else {
			let viewControllers = self.stacks.flatMap { return $0.rootController }
			self.window.rootViewController = self.tabBarController
			self.tabBarController.setViewControllers(viewControllers, animated: false)
		}
	}

}

public final class DefaultCoordinationManager: CoordinationManager<DefaultSettings> {

	@discardableResult
	public func addStack(with screen: Screen) -> Coordinatable {
		return super.addStack(with: screen, and: DefaultStackSettings())
	}

}
