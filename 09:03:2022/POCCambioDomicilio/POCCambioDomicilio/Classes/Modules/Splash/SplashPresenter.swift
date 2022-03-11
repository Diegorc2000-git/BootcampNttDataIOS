//
//  SplashPresenter.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation

protocol SplashPresenterRouterInterface: PresenterRouterInterface {
	
}

protocol SplashPresenterInteractorInterface: PresenterInteractorInterface {
}

protocol SplashPresenterViewInterface: PresenterViewInterface {
	func loginButtonPressed()
}

final class SplashPresenter: PresenterInterface {
	
	var router: SplashRouterPresenterInterface!
	var interactor: SplashInteractorPresenterInterface!
	weak var view: SplashViewPresenterInterface!
		
}

extension SplashPresenter: SplashPresenterRouterInterface {
	
}

extension SplashPresenter: SplashPresenterInteractorInterface {
	
}

extension SplashPresenter: SplashPresenterViewInterface {
	func loginButtonPressed() {
		self.router.navigateToLogin()
	}
	
}
