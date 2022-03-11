//
//  LoginRouter.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation
import UIKit

protocol LoginRouterPresenterInterface: RouterPresenterInterface {
	func navigateToIdentity()
}

final class LoginRouter: RouterInterface {
	
	weak var presenter: LoginPresenterRouterInterface!
	weak var viewController: UIViewController?
	
}

extension LoginRouter: LoginRouterPresenterInterface {
	
	func navigateToIdentity() {
		let viewController = IdentityAssembly().build()
		viewController.modalPresentationStyle = .overCurrentContext
		self.viewController?.present(viewController, animated: true, completion: nil)
	}
	
}
