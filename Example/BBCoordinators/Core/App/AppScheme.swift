//
//  AppScheme.swift
//  BBCoordinators_Example
//
//  Created by David Lenský on 29/11/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class AppScheme: UIView {

	@IBOutlet weak var introBox: Box!
	@IBOutlet weak var firstBox: Box!
	@IBOutlet weak var secondBox: Box!
	@IBOutlet weak var thirdBox: Box!
	@IBOutlet weak var tabBarBox: Box!
	@IBOutlet weak var nextBox: Box!
	@IBOutlet weak var popToBox: Box!
	@IBOutlet weak var firstTabBox: Box!
	@IBOutlet weak var secondTabBox: Box!
	@IBOutlet weak var thirdTabBox: Box!

	@IBOutlet weak var introLine: Line!
	@IBOutlet weak var firstLine: Line!
	@IBOutlet weak var secondLine: Line!
	@IBOutlet weak var thirdLine: Line!
	@IBOutlet weak var nextLine: Line!
	@IBOutlet weak var popToLine: Line!

	@IBOutlet weak var button: UIButton!

	static func instantiate() -> AppScheme {
		return UINib(nibName: "AppScheme", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! AppScheme
	}

}

@IBDesignable
class Box: UIView {

	@IBInspectable var borderColor: UIColor? {
		get{
			guard let cgColor = self.layer.borderColor else { return nil }
			return UIColor(cgColor: cgColor)
		}
		set {
			self.layer.borderColor = newValue?.cgColor
		}
	}

	@IBInspectable var borderWidth: CGFloat {
		get {
			return self.layer.borderWidth
		}
		set {
			self.layer.borderWidth = newValue
		}
	}

}

@IBDesignable
class Line: UIView {

	@IBInspectable var selected: Bool = false

	override func layoutSubviews() {
		super.layoutSubviews()
		self.frame.size = CGSize(width: self.selected ? 2 : 1, height: self.frame.height)
	}

}

extension UIView {

	@IBInspectable var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
			layer.masksToBounds = newValue > 0
		}
	}

}
