//
//  MessageInteractor.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation

protocol MessageInteractorPresenterInterface: InteractorPresenterInterface {
	
}

class MessageInteractor: InteractorInterface {
	
	weak var presenter: MessagePresenterInteractorInterface!
	let provider: MessageProviderProtocol = MessageProvider()
	
}

extension MessageInteractor: MessageInteractorPresenterInterface {
	
}
