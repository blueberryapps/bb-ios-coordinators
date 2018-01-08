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

public protocol CoordinatorrFactory: class {
	static func createInstance(root: UINavigationController?, children: [BaseCoordinator], container: Container?) -> Self
}

public protocol MainFlowCoordinator: Coordinatorr, CoordinatorType {
    var rootController: UINavigationController { get set }
}

public protocol LeafCoordinator: CoordinatorType {
    weak var flowCoordinator: MainFlowCoordinator? { get set }
}

public protocol Coordinatorr: CoordinatorrFactory {
	var parent: BaseCoordinator? { get set }
	var children: [BaseCoordinator] { get set }
    func start()
}
public class NavigationBasedCoordinator<VM, VC>: MainFlowCoordinator {
    public func start() {
        print("")
    }
    
    public func go(_ action: Action, animated: Bool) {
        print("")
    }
    
    public class func createInstance(root: UINavigationController? = nil, children: [BaseCoordinator], container: Container? = nil) -> Self {
        return createInstanceHelper(root: root, children: children, container: container)
    }
    
    private static func createInstanceHelper<T>(root: UINavigationController? = nil, children: [BaseCoordinator], container: Container? = nil) -> T {
        return NavigationBasedCoordinator<VM, VC>.init(root: root!, children: children, container: container!) as! T
    }
    
    public var rootController: UINavigationController
    
	public var parent: BaseCoordinator?

	public var children: [BaseCoordinator]

	init(root: UINavigationController, children: [BaseCoordinator] = [], container: Container) {
		self.rootController = root
		self.children = children
	}
}

public class BasicCoordinator: LeafCoordinator {
    public var flowCoordinator: MainFlowCoordinator?
    
    public func go(_ action: Action, animated: Bool) {
        print("")
    }
    
    public var parent: BaseCoordinator?
    public var children: [BaseCoordinator]
    
    init(parent: BaseCoordinator?, children: [BaseCoordinator], flowCoorinator: MainFlowCoordinator) {
        self.parent = parent
        self.children = children
        self.flowCoordinator = flowCoorinator
    }
    
    func start() {
        
    }
}

