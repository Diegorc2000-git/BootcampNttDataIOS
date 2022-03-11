//
//  IdentityRouter.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation
import UIKit

protocol IdentityRouterPresenterInterface: RouterPresenterInterface {
	func navigateToMessage()
}

final class IdentityRouter: RouterInterface {
	
	weak var presenter: IdentityPresenterRouterInterface!
	weak var viewController: UIViewController?
	
}

extension IdentityRouter: IdentityRouterPresenterInterface {
	
	func navigateToMessage() {
		let viewController = MessageAssembly().build()
		viewController.modalPresentationStyle = .overCurrentContext
		self.viewController?.present(viewController, animated: false, completion: nil)
	}
}
