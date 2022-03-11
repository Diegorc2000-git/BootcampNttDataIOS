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
	func getDataProfileView(data: ProfileViewModel)
}

protocol IdentityPresenterViewInterface: PresenterViewInterface {
	func fetchDataIdentity()
	func showMessageMoreInfoProfile()
	var dataCellModel: ProfileCellModel? { get set }
}

final class IdentityPresenter: PresenterInterface {
	
	var router: IdentityRouterPresenterInterface!
	var interactor: IdentityInteractorPresenterInterface!
	weak var view: IdentityViewPresenterInterface!
	

	var dataCellModel: ProfileCellModel?
	
}

extension IdentityPresenter: IdentityPresenterRouterInterface {
	
}

extension IdentityPresenter: IdentityPresenterInteractorInterface {
	
	func getDataProfileView(data: ProfileViewModel) {
		self.dataCellModel = ProfileCellModel(photo: nil,
											   greeting: "Hola",
											   name: data.name,
											   lastUpdate: data.lastUpdate,
											  lastNamePlaceHolder: "Apellidos",
											  lastNameData: data.lastName,
											  identityDocPlaceHolder: "NIF",
											  identityData: data.identityDoc,
											  validityPlaceHolder: "Validez",
											  validityData: data.validityData,
											  addressPlaceHolder: "DomicilioEmpadronado",
											  addressData: data.addressData,
											  cityPlaceHolder: "Ciudad",
											   cityData: data.cityData)
		self.view.reloadInformationInView()
	}
	
}

extension IdentityPresenter: IdentityPresenterViewInterface {
	func fetchDataIdentity() {
		
		self.interactor.fetchDataIdentityInteractor()
	}
	
	func showMessageMoreInfoProfile() {
		self.router.showMessageMoreInfoProfile()
	}
	
	
	
}
