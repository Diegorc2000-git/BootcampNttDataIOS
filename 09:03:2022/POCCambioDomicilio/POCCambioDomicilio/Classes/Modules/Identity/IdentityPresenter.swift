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
	func showMessageMoreInfoProfile()
	func fetchDataProfile()
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
											  lastNamePlaceHolder: LocalizedKeys.Identity.IdentityLastNamePlaceHolder,
											  lastNameData: data.lastName,
											  identityDocPlaceHolder: LocalizedKeys.Identity.IdentityNIFPlaceHolder,
											  identityData: data.identityDoc,
											  validityPlaceHolder: LocalizedKeys.Identity.IdentityValidationPlaceHolder,
											  validityData: data.validityData,
											  addressPlaceHolder: LocalizedKeys.Identity.IdentityAddressRegisteredPlaceHolder,
											  addressData: data.addressData,
											  cityPlaceHolder: LocalizedKeys.Identity.IdentityCityPlaceHolder,
											  cityData: data.cityData)
		self.view.reloadInformationInView()
	}
	
}

extension IdentityPresenter: IdentityPresenterViewInterface {
	
	func fetchDataProfile() {
		self.interactor.fetchDataIdentityInteractor()
	}
	
	func showMessageMoreInfoProfile() {
		self.router?.navigateToMessage()
	}
}
