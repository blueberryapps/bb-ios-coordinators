//
//  UIImage.swift
//  BBCoordinators_Example
//
//  Created by David Lenský on 30/11/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

extension UIImage {

	func resize(to size: CGFloat) -> UIImage? {
		let size = CGSize(width: size, height: size)
		UIGraphicsBeginImageContext(size)
		self.draw(in: CGRect(origin: CGPoint.zero, size: size))
		let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return resizedImage?.withRenderingMode(self.renderingMode)
	}

}
