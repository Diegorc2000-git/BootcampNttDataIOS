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

final class IdentityInteractor: InteractorInterface {
	
	weak var presenter: IdentityPresenterInteractorInterface!
	let provider: IdentityProviderProtocol = IdentityProvider()
	
	
	private func transformDataToIdentityBussinessModel(data: IdentityServerModel) -> IdentityBussinessModel? {
		var model: IdentityBussinessModel?
		model = IdentityBussinessModel(
			transmisiones: TransmisionesViewModel(
				transmisionDatos: [TransmisionDatoViewModel(
									datosGenericos: DatosGenericosViewModel(
										titular: TitularViewModel(
											tipoDocumentacion: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.tipoDocumentacion,
											documentacion: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.documentacion,
											nombreCompleto: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.nombreCompleto,
											nombre: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.nombre,
											apellido1: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.apellido1,
											apellido2: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.apellido2)),
									datosEspecificos: DatosEspecificosViewModel(
										retorno: RetornoViewModel(
											datosTitular: DatosTitularViewModel(
												fechaCaducidad: data.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.datosTitular?.fechaCaducidad))))]))
		return model
	}
	
	private func transformDataToAddressBusinessModel(data: AddressServerModel) -> AddressBusinessModel? {
		var model: AddressBusinessModel?
		model = AddressBusinessModel(
			transmisiones: DRTransmisionesViewModel(
				transmisionDatos: [DRTransmisionDatoViewModel(
									direccion: data.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.domicilio?.direccion?.via?.nombre,
									municipioRespuesta: data.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.domicilio?.municipioRespuesta?.nombre)]))
		return model
	}
	
	private func transformDataToProfileViewModel(identitySM: IdentityServerModel, addressSM: AddressServerModel) -> ProfileViewModel?{
		let identityBM = self.transformDataToIdentityBussinessModel(data: identitySM)
		let addressBM = self.transformDataToAddressBusinessModel(data: addressSM)
		
		var model: ProfileViewModel?
		model = ProfileViewModel(name: identityBM?.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.nombreCompleto,
								 lastUpdate: identityBM?.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.datosTitular?.fechaCaducidad,
								 lastName: identityBM?.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.apellido1,
								 identityDoc: identityBM?.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.documentacion,
								 validityData: identityBM?.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.datosTitular?.fechaCaducidad,
								 addressData: addressBM?.transmisiones?.transmisionDatos?[0].direccion,
								 cityData: addressBM?.transmisiones?.transmisionDatos?[0].municipioRespuesta)
		return model
	}
	
}

extension IdentityInteractor: IdentityInteractorPresenterInterface {
	func fetchDataIdentityInteractor() {
		self.provider.fetchData { [weak self] (resultIdentityServerModel) in
			guard self != nil else { return }
			self?.provider.fetchDataAddress(completion: { [weak self] (resultAddressServerModel) in
				guard self != nil else { return }
				if let data = self?.transformDataToProfileViewModel(identitySM: resultIdentityServerModel, addressSM: resultAddressServerModel) {
					self?.presenter.getDataProfileView(data: data)
				}
			}, failure: { (networkError) in
				//
			})
		} failure: { (networkError) in
			//
		}
	}
}
