//
//  IdentityPresenter.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation

protocol IdentityPresenterRouterInterface: PresenterRouterInterface {
	
}

protocol IdentityPresenterInteractorInterface: PresenterInteractorInterface {
}

protocol IdentityPresenterViewInterface: PresenterViewInterface {
	func buttonInformationPressed()
}

final class IdentityPresenter: PresenterInterface {
	
	var router: IdentityRouterPresenterInterface!
	var interactor: IdentityInteractorPresenterInterface!
	weak var view: IdentityViewPresenterInterface!
		
}

extension IdentityPresenter: IdentityPresenterRouterInterface {
	
}

extension IdentityPresenter: IdentityPresenterInteractorInterface {
	
}

extension IdentityPresenter: IdentityPresenterViewInterface {
	
	func buttonInformationPressed() {
		self.router?.navigateToMessage()
	}
}
