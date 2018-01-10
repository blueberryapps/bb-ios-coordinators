//
//  Settings.swift
//  BBCoordinators
//
//  Created by David Lenský on 09/01/2018.
//

import UIKit

public protocol Settings {

	static var tabBarType: UITabBarController.Type { get }

}

public protocol StackSettings {

	var navBarType: UINavigationController.Type { get }

}

public class DefaultSettings: Settings {
	public static var tabBarType: UITabBarController.Type = UITabBarController.self
}

public class DefaultStackSettings: StackSettings {
	public var navBarType: UINavigationController.Type = UINavigationController.self
}
