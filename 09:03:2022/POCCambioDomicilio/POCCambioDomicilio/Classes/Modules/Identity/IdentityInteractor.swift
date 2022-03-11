//
//  IdentityInteractor.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation

protocol IdentityInteractorPresenterInterface: InteractorPresenterInterface {
	func fetchDataIdentityInteractor()
}

class IdentityInteractor: InteractorInterface {
	
	weak var presenter: IdentityPresenterInteractorInterface!
	let provider: IdentityProviderProtocol = IdentityProvider()
	
}

extension IdentityInteractor: IdentityInteractorPresenterInterface {
	
	func fetchDataIdentityInteractor() {
//		self.provider.fetchData { [weak self] (resultIdentityServerModel) in
//			guard self != nil else { return }
//			self?.provider.fetchDataAddress(completion: { [weak self] (resultAddressServerModel) in
//				guard self != nil else { return }
//				if let data = self?.transformDataToProfileViewModel(identitySM: resultIdentityServerModel, addressSM: resultAddressServerModel) {
//					self?.presenter.getDataProfileView(data: data)
//				}
//			}, failure: { (networkError) in
//				//
//			})
//		} failure: { (networkError) in
//			//
//		}
	}

}
