//
//  Utils.swift
//  GrouponForNttdata
//
//  Created by Diego Rodriguez Casillas on 23/2/22.
//

import Foundation
import UIKit

public protocol ReuseIdentifierView: AnyObject {
	static var defaultReuseIdentifierView: String { get }
}

public extension ReuseIdentifierView where Self: UIView {
	
	static var defaultReuseIdentifierView: String {
		return NSStringFromClass(self).components(separatedBy: ".").last!
	}
}

public protocol ReuseIdentifierViewController: AnyObject {
	static var defaultReuseIdentifierViewController: String { get }
}

public extension ReuseIdentifierViewController where Self: UIViewController {
	
	static var defaultReuseIdentifierViewController: String {
		return NSStringFromClass(self).components(separatedBy: ".").last!
	}
}
