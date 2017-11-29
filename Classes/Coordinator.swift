//
//  Coordinator.swift
//  BBCoordinators
//
//  Created by David Lenský on 29/11/2017.
//

import UIKit

// MARK: - Screen

protocol Screen {
	var type: CoordinatorType.Type { get }
	var isTabBar: Bool { get }
	var tabBarScreens: [Screen] { get }
}

extension Screen {
	var isTabBar: Bool { return false }
	var tabBarScreens: [Screen] { return [] }
	var tabBarType: UITabBarController.Type { return UITabBarController.self }
}

// MARK: - Action

enum Action {
	case forward(to: Screen)
	case backOne
	case back(to: Screen)
}

// MARK: - Coordinator

protocol CoordinatorType: class {
	func go(_ action: Action, animated: Bool)
}

class BaseCoordinator: CoordinatorType {
	internal var rootController: UINavigationController
	internal var parent: BaseCoordinator?
	internal var children: [CoordinatorType] = []

	required init(root: UINavigationController) {
		self.rootController = root
	}

	func applySettings() {}
	func go(_ action: Action, animated: Bool = true) {}
	fileprivate func push(screen: Screen, animated: Bool) {}

}

class Coordinator<VM, VC: Controller<VM>>: BaseCoordinator {

	func customViewModel() -> VM? { return nil }
	func customViewController(with viewModel: VM) -> VC? { return nil }

	public func start(with screen: Screen) {
		self.push(screen: screen, animated: false)
	}

	override func go(_ action: Action, animated: Bool = true) {
		switch action {
		case .backOne: self.pop(animated: animated)
		case .forward(let screen): self.initialize(screen, root: self.rootController, animated: animated)
		case .back(let screen): self.popTo(screen, animated: animated)
		}
	}

	private func initialize(_ screen: Screen, root: UINavigationController, animated: Bool) {
		guard let type = screen.type as? BaseCoordinator.Type else { return }
		let coordinator = type.init(root: root)
		coordinator.parent = self
		self.children.append(coordinator)
		coordinator.push(screen: screen, animated: animated)
	}

	private func pop(animated: Bool) {
		self.parent?.children = []
		self.parent?.rootController.popViewController(animated: animated)
		self.parent?.applySettings()
	}

	private func popTo(_ screen: Screen, animated: Bool) { // TODO: - Quite large - shorten it or cut to pieces
		var currentRootController: UINavigationController?
		var counter = 0

		var parent = self.parent
		while parent != nil {
			if parent!.rootController == currentRootController { counter += 1 }
			else {
				currentRootController = parent!.rootController
				counter = 0
			}

			if type(of: parent!) == screen.type { break }
			parent = parent!.parent
		}
		guard let targetCoordinator = parent else { return }
		targetCoordinator.children = []
		let viewControllersCount = targetCoordinator.rootController.viewControllers.count - 1 - counter
		let viewControllers = targetCoordinator.rootController.viewControllers[0...viewControllersCount]
		targetCoordinator.rootController.setViewControllers(Array(viewControllers), animated: true)
		targetCoordinator.applySettings()
	}

	override fileprivate func push(screen: Screen, animated: Bool) {
		let vm = self.customViewModel() ?? VM(coordinator: self)
		let vc = self.customViewController(with: vm) ?? VC(viewModel: vm)

		self.rootController.pushViewController(vc, animated: animated)
		self.applySettings()

		if screen.isTabBar {
			var children: [UINavigationController] = []

			for tabScreen in screen.tabBarScreens {
				let navController = UINavigationController()
				self.initialize(tabScreen, root: navController, animated: false)
				children.append(navController)
			}
			vc.createTabBarController(from: screen.tabBarType, withItemControllers: children)
		}
	}

}
