//
//  LoginInteractor.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation


protocol LoginInteractorPresenterInterface: InteractorPresenterInterface {
	
}

class LoginInteractor: InteractorInterface {
	
	weak var presenter: LoginPresenterInteractorInterface!
	let provider: LoginProviderProtocol = LoginProvider()
	
}

extension LoginInteractor: LoginInteractorPresenterInterface {
	
}
