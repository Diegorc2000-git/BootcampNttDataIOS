//
//  LoginPresenter.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation
import UIKit

protocol LoginPresenterRouterInterface: PresenterRouterInterface {
	
}

protocol LoginPresenterInteractorInterface: PresenterInteractorInterface {
	
}

protocol LoginPresenterViewInterface: PresenterViewInterface {
	func buttonContinuePressed()
	
}

class LoginPresenter: PresenterInterface {
	
	var router: LoginRouterPresenterInterface!
	var interactor: LoginInteractorPresenterInterface!
	weak var view: LoginViewPresenterInterface!
	
}

extension LoginPresenter: LoginPresenterRouterInterface {
	
}

extension LoginPresenter: LoginPresenterInteractorInterface {
	
}

extension LoginPresenter: LoginPresenterViewInterface {

	func buttonContinuePressed() {
		self.router.navigateToIdentity()
	}
	
}

