//
//  MessagePresenter.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation

protocol MessagePresenterRouterInterface: PresenterRouterInterface {
	
}

protocol MessagePresenterInteractorInterface: PresenterInteractorInterface {
}

protocol MessagePresenterViewInterface: PresenterViewInterface {
	func closeButtonPressed()
}

final class MessagePresenter: PresenterInterface {
	
	var router: MessageRouterPresenterInterface!
	var interactor: MessageInteractorPresenterInterface!
	weak var view: MessageViewPresenterInterface!
		
}

extension MessagePresenter: MessagePresenterRouterInterface {
	
}

extension MessagePresenter: MessagePresenterInteractorInterface {
	
}

extension MessagePresenter: MessagePresenterViewInterface {
	
	func closeButtonPressed() {
		self.router?.dismisModalInformation()
	}
}
