//
//  SplashInteractor.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation


protocol SplashInteractorPresenterInterface: InteractorPresenterInterface {
	
}

class SplashInteractor: InteractorInterface {
	
	weak var presenter: SplashPresenterInteractorInterface!
	let provider: SplashProviderProtocol = SplashProvider()
	
}

extension SplashInteractor: SplashInteractorPresenterInterface {
	
}
