//
//  NewTaskRouter.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 22/2/22.
//

import Foundation
import UIKit

protocol NewTaskRouterProtocol {
	func showPicker(imagePicker: UIViewController)
	func showActionSheet(actionSheet: UIViewController)
}

final class NewTaskRouter {
	
	let vc: NewTaskViewController?
	
	init(vc: NewTaskViewController) {
		self.vc = vc
	}
	
}

extension NewTaskRouter: NewTaskRouterProtocol {
	func showPicker(imagePicker: UIViewController) {
		vc?.present(imagePicker, animated: true, completion: nil)
	}
	
	func showActionSheet(actionSheet: UIViewController) {
		vc?.present(actionSheet, animated: true, completion: nil)
	}
	
}
