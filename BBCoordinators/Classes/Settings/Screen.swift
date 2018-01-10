//
//  Screen.swift
//  BBCoordinators
//
//  Created by David Lenský on 30/11/2017.
//

import UIKit

/*
 Represents a screen (or a ViewController) in stack.
*/
public protocol Screen {

	/* Type of Coordinator that is responsible for navigation of screen */
	var type: CoordinatorType.Type { get }

	/*
	 UITabBarItem for a screen.
		• If empty, no item is set to the corresponding ViewController
		• Default is nil
	*/
	var tabBarItem: UITabBarItem? { get }

}

/* Defualt implementation of values */
public extension Screen {
	var tabBarItem: UITabBarItem? { return nil }
}
