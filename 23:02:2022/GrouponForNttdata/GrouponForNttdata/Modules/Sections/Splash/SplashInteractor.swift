//
//  SplashInteractor.swift
//  GrouponForNttdata
//
//  Created by Diego Rodriguez Casillas on 23/2/22.
//

import Foundation

protocol SplashInteractorProtocol {
	func fetchData()
}

class SplashInteractor: BaseInteractor<SplashPresenterProtocol> {
	
	let provider: SplashProviderProtocol = SplashProvider()
	
}

extension SplashInteractor: SplashInteractorProtocol {
	
	func fetchData() {
		provider.fetchData { [weak self] (result) in
			guard self != nil else { return }
			self?.presenter.getDataFromBusiness(data: result.cards)
		} failure: { (error) in
			
		}

	}
}
