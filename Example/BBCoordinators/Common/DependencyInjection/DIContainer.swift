//
//  DIContainer.swift
//  BBCoordinators_Example
//
//  Created by David Lenský on 06/12/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Swinject
import BBCoordinators
import Foundation

class DI {

	static var container: Container = {
		let container = Container()

		container.register(PopToVM.self) { (r, coordinator: PopToCoordinator) in
			let di = DI.get(key: DI.Key.diTestVM) ?? ""
			return PopToVM(coordinator: coordinator, diTest: di)
		}

		container.register(PopToVC.self) { (r, viewModel: PopToVM) in
			let di = DI.get(key: DI.Key.diTestVC) ?? ""
			return PopToVC(viewModel: viewModel, diTest: di)
		}

		return container
	}()

}

// MARK: - Access methods

extension DI {

	static func send<T>(_ value: T, withKey key: String) {
		self.container.register(T.self, name: key) { _ -> T in
			return value
		}
	}

	static func get<T>(key: String? = nil) -> T? {
		return self.container.resolve(T.self, name: key)
	}

	static func get<T, P>(arg: P, key: String? = nil) -> T? {
		return self.container.resolve(T.self, name: key, argument: arg)
	}

}

// MARK: - Parameter Keys

extension DI {

	class Key {
		static let diTestVM = "diTestVM"
		static let diTestVC = "diTestVC"
	}

}
